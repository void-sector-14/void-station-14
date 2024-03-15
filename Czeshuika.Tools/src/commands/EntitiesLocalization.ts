import {ACommand} from "./ACommand";
import * as cli from "../CommandLineParser";
import {log} from "../Logger";
import {mkdir, readFile, walker, writeFile, yamlParse, IDict} from "../Utils";
import path from "path";
import {FluentParser, Message as FluentMessage, MessageReference} from "@fluent/syntax";

type TField = "name" | "description" | "suffix"
type TParent = string | string[]

interface IEntity {
    id: string
    parent?: TParent
    name?: string
    description?: string
    suffix?: string
}

interface ITranslate {
    id: string
    name?: string
    description?: string
    suffix?: string
}

export class EntitiesLocalization extends ACommand {
    private entities: IDict<IEntity> = {}
    private entitiesPath: IDict<string[]> = {}

    execute(): void {
        this.setupWorkdir()

        const prototypesPath = cli.argv<string>("prototypes")
        if (prototypesPath == null) {
            log.error("Missing argument: \"--prototypes=/path/to/Resources/Prototypes\"")
            return
        }

        const ftlPath = cli.argv<string>("ftl")
        if (ftlPath == null) {
            log.error("Missing argument: \"--ftl=/path/to/Resources/Locale/ru-RU/prototypes/entity\"")
            return
        }

        const savePath = cli.argv<string>("save")
        if (savePath == null) {
            log.error("Missing argument: \"--save=/path/to/Resources/Locale/ru-RU/prototypes/entity_new\"")
            return
        }

        this.loadPrototypes(prototypesPath)
        this.fixEntities()
        this.applyTranstation(ftlPath)
        this.saveTranslatedEntities(savePath)
    }

    name(): string {
        return "entities_localization";
    }

    private loadPrototypes(prototypesPath: string): void {
        log.info("Load prototypes (.yml)")

        walker(path.join(this.workdir, prototypesPath), ".yml", (relativePath, fileName) => {
            let fullPath = path.join(this.workdir, prototypesPath, relativePath, fileName)
            log.debug(`${relativePath}/${fileName}`)

            const prototypies: object[] = yamlParse(readFile(fullPath))
            if (prototypies == null || prototypies.length == 0)
                return

            for (const prototype of prototypies) {
                if (prototype == null || prototype["type"] != "entity")
                    continue;

                const entity = this.convertEntity(prototype)
                this.entities[entity.id] = entity

                let entityFilePath = path.join(relativePath, fileName)
                if (this.entitiesPath.hasOwnProperty(entityFilePath)) {
                    this.entitiesPath[entityFilePath].push(entity.id)
                } else {
                    this.entitiesPath[entityFilePath] = [entity.id]
                }
            }
        })
    }

    private fixEntities(): void {
        log.info("Fix name, description and suffix entities")

        for (let [_, entity] of Object.entries(this.entities)) {
            this.fixEntityField(entity, "name", entity.id)
            this.fixEntityField(entity, "description", null)
            this.fixEntityField(entity, "suffix", null)
        }
    }

    private fixEntityField(entity: IEntity, field: TField, failValue: string): void {
        if (entity[field] != null)
            return

        if (entity.parent == null) {
            entity[field] = failValue
            return
        }

        if (Array.isArray(entity.parent)) {
            let found = false
            for (let parentId of entity.parent) {
                if (!this.checkDefineInParentSingle(parentId, field))
                    continue;

                found = true
                switch (field) {
                    case "name": {
                        entity.name = `{ ent-${parentId} }`
                        break
                    }
                    case "description": {
                        entity.description = `{ ent-${parentId}.desc }`
                        break
                    }
                    case "suffix": {
                        entity.suffix = `{ ent-${parentId}.suffix }`
                        break
                    }
                }
            }

            if (!found)
                entity[field] = failValue
        } else {
            if (this.checkDefineInParentSingle(entity.parent, field)) {
                switch (field) {
                    case "name": {
                        entity.name = `{ ent-${entity.parent} }`
                        break
                    }
                    case "description": {
                        entity.description = `{ ent-${entity.parent}.desc }`
                        break
                    }
                    case "suffix": {
                        entity.suffix = `{ ent-${entity.parent}.suffix }`
                        break
                    }
                }
            } else {
                entity[field] = failValue
            }
        }
    }

    private checkDefineInParentSingle(parentId: string, field: TField): boolean {
        const entity = this.entities[parentId]
        if (entity == null)
            throw new Error(`Entity '${parentId}' not found!`)

        if (field == "name" && entity.name != null)
            return true
        if (field == "description" && entity.description != null)
            return true
        if (field == "suffix" && entity.suffix != null)
            return true

        if (entity.parent == null)
            return false

        return this.checkDefineInParent(entity.parent, field)
    }

    private checkDefineInParentMany(parentIds: string[], field: TField): boolean {
        for (let parentId of parentIds) {
            if (this.checkDefineInParentSingle(parentId, field))
                return true
        }

        return false
    }

    private checkDefineInParent(parentIds: TParent, field: TField): boolean {
        if (Array.isArray(parentIds)) {
            return this.checkDefineInParentMany(parentIds, field)
        } else {
            return this.checkDefineInParentSingle(parentIds, field)
        }
    }

    private applyTranstation(ftlPath: string): void {
        log.info("Apply translate (.ftl)")

        walker(path.join(this.workdir, ftlPath), ".ftl", (relativePath, fileName) => {
            let fullPath = path.join(this.workdir, ftlPath, relativePath, fileName)
            log.debug(`${relativePath}/${fileName}`)

            const resource = new FluentParser().parse(readFile(fullPath));
            for (const fluentEntry of resource.body) {
                if (fluentEntry.type != "Message") {
                    if (fluentEntry.type == "Junk" || fluentEntry.type == "Comment")
                        continue
                    throw new Error("Oops-1!") //FIXME
                }

                const translate = this.convertFluent(fluentEntry)

                const entity = this.entities[translate.id]
                if (entity == null)
                    continue

                entity.name = translate.name
                entity.description = translate.description
                entity.suffix = translate.suffix
            }
        })
    }

    private saveTranslatedEntities(savePath: string): void {
        log.info("Save translated prototypies")

        for (let [prototypePath, entityIds] of Object.entries(this.entitiesPath)) {
            log.debug(prototypePath)

            const parsedPath = path.parse(prototypePath);
            const dir = path.join(this.workdir, savePath, parsedPath.dir.toLowerCase())
            mkdir(dir)
            const file = path.join(dir, parsedPath.name.toLowerCase() + ".ftl")

            let lines: string[] = []
            for (const eid of entityIds) {
                const entity = this.entities[eid]
                let patchDesc = entity.description == null ? '{ "" }' : entity.description
                patchDesc = patchDesc.replaceAll("\n", "\n            ")
                //@formatter:off
                lines.push(`ent-${entity.id} = ${entity.name}\n` +
                           `    .desc = ${patchDesc}\n` +
                           `    .suffix = ${entity.suffix == null ? '{ "" }' : entity.suffix}\n`)
                //@formatter:on
            }
            writeFile(file, lines.join("\n"))
        }
    }

    private convertEntity(rawEntity: object): IEntity {
        return {
            id: rawEntity["id"],
            parent: rawEntity["parent"],
            name: rawEntity["name"],
            description: rawEntity["description"],
            suffix: rawEntity["suffix"]
        } as IEntity
    }

    private convertFluent(fluentMessage: FluentMessage): ITranslate {
        const translate = {
            id: fluentMessage.id.name.substring(4) // ent-EntityId --> EntityId
        } as ITranslate

        let nameElement = fluentMessage.value.elements[0]
        if (nameElement.type == "TextElement") {
            translate.name = nameElement.value
        } else if (nameElement.type == "Placeable") {
            if (nameElement.expression.type == "MessageReference") {
                translate.name = `{ ${nameElement.expression.id.name} }`
            } else if (nameElement.expression.type == "StringLiteral") {
                translate.name = nameElement.expression.value == "" ? '{ "" }' : nameElement.expression.value
            } else {
                throw new Error(`unsupported type '${nameElement.expression.type}'`)
            }
        }

        for (const attr of fluentMessage.attributes) {
            let attrValue = attr.value.elements[0]
            if (attrValue.type == "Placeable") {
                if (attrValue.expression.type == "MessageReference") {
                    let msgRef = attrValue.expression as MessageReference
                    if (attr.id.name == "desc") {
                        translate.description = (msgRef.attribute == null)
                            ? `{ ${msgRef.id.name} }` //{ ref-to-message-id }
                            : `{ ${msgRef.id.name}.${msgRef.attribute.name} }` //{ ent-EntityId.desc }
                    } else if (attr.id.name == "suffix") {
                        translate.suffix = (msgRef.attribute == null)
                            ? `{ ${msgRef.id.name} }` //{ ref-to-message-id }
                            : `{ ${msgRef.id.name}.${msgRef.attribute.name} }` //{ ent-EntityId.suffix }
                    }
                } else if (attrValue.expression.type == "StringLiteral") {
                    if (attr.id.name == "desc")
                        translate.description = attrValue.expression.value == ""
                            ? '{ "" }'
                            : attrValue.expression.value
                    else if (attr.id.name == "suffix")
                        translate.suffix = attrValue.expression.value == ""
                            ? '{ "" }'
                            : attrValue.expression.value
                } else {
                    throw new Error(`unsupported type '${attrValue.expression.type}'`)
                }
            } else if (attrValue.type == "TextElement") {
                if (attr.id.name == "desc")
                    translate.description = attrValue.value
                else if (attr.id.name == "suffix")
                    translate.suffix = attrValue.value
            }
        }

        return translate
    }
}
