import {ACommand} from "./ACommand";
import * as cli from "../CommandLineParser";
import {log} from "../Logger";
import {IDict, mkdir, readFile, walker, writeFile, yamlParse} from "../Utils";
import path from "path";
import {FluentParser, MessageReference} from "@fluent/syntax";
import {Message as FluentMessage} from "@fluent/syntax/esm/ast";

interface IConstruction {
    id: string
    name: string
    description: string
}

interface ITranslate {
    id: string
    name: string
    description: string
}

export class ConstructionsLocalization extends ACommand {
    private constructions: IDict<IConstruction> = {}
    private constructionsPath: IDict<string[]> = {}

    execute(): void {
        this.setupWorkdir()

        const prototypesPath = cli.argv<string>("prototypes")
        if (prototypesPath == null) {
            log.error("Missing argument: \"--prototypes=/path/to/Resources/Prototypes\"")
            return
        }

        const ftlPath = cli.argv<string>("ftl")
        if (ftlPath == null) {
            log.error("Missing argument: \"--ftl=/path/to/Resources/Locale/ru-RU/construction/con-menu\"")
            return
        }

        const savePath = cli.argv<string>("save")
        if (savePath == null) {
            log.error("Missing argument: \"--save=/path/to/Resources/Locale/ru-RU/construction/con-menu_new\"")
            return
        }

        this.loadPrototypes(prototypesPath)
        this.applyTranstation(ftlPath)
        this.saveTranslatedEntities(savePath)
    }

    name(): string {
        return "constructions_localization";
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
                if (prototype == null || prototype["type"] != "construction")
                    continue;

                const construction = this.convertConstruction(prototype)
                this.constructions[construction.id] = construction

                let constructionFilePath = path.join(relativePath, fileName)
                if (this.constructionsPath.hasOwnProperty(constructionFilePath)) {
                    this.constructionsPath[constructionFilePath].push(construction.id)
                } else {
                    this.constructionsPath[constructionFilePath] = [construction.id]
                }
            }
        });
    }

    private applyTranstation(ftlPath: string): void {
        log.info("Apply translate (.ftl)")

        walker(path.join(this.workdir, ftlPath), ".ftl", (relativePath, fileName) => {
            let fullPath = path.join(this.workdir, ftlPath, relativePath, fileName)
            log.debug(`${relativePath}/${fileName}`)

            const resource = new FluentParser().parse(readFile(fullPath));
            for (const fluentEntry of resource.body) {
                if (fluentEntry.type != "Message")
                    throw new Error("Oops-1!") //FIXME

                const translate = this.convertFluent(fluentEntry)

                const construction = this.constructions[translate.id]
                if (construction == null)
                    continue

                construction.name = translate.name
                construction.description = translate.description
            }
        })
    }

    private saveTranslatedEntities(savePath: string): void {
        log.info("Save translated prototypies")

        for (let [prototypePath, constructionIds] of Object.entries(this.constructionsPath)) {
            log.debug(prototypePath)

            const parsedPath = path.parse(prototypePath);
            const dir = path.join(this.workdir, savePath, parsedPath.dir.toLowerCase())
            mkdir(dir)
            const file = path.join(dir, parsedPath.name.toLowerCase() + ".ftl")

            let lines: string[] = []
            for (const eid of constructionIds) {
                const construction = this.constructions[eid]
                let patchDesc = construction.description == null ? '{ "" }' : construction.description
                patchDesc = patchDesc.replaceAll("\n", "\n            ")
                //@formatter:off
                lines.push(`con-${construction.id} = ${construction.name}\n` +
                    `    .desc = ${patchDesc}\n`)
                //@formatter:on
            }
            writeFile(file, lines.join("\n"))
        }
    }

    private convertConstruction(rawEntity: object): IConstruction {
        return {
            id: rawEntity["id"],
            name: rawEntity["name"],
            description: rawEntity["description"],
        } as IConstruction
    }

    private convertFluent(fluentMessage: FluentMessage): ITranslate {
        const translate = {
            id: fluentMessage.id.name.substring(4) // con-ConstructionId --> ConstructionId
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
                    if (attr.id.name != "desc")
                        continue;

                    translate.description = (msgRef.attribute == null)
                        ? `{ ${msgRef.id.name} }` //{ ref-to-message-id }
                        : `{ ${msgRef.id.name}.${msgRef.attribute.name} }`
                } else if (attrValue.expression.type == "StringLiteral") {
                    if (attr.id.name != "desc")
                        continue;

                    translate.description = attrValue.expression.value == ""
                        ? '{ "" }'
                        : attrValue.expression.value
                } else {
                    throw new Error(`unsupported type '${attrValue.expression.type}'`)
                }
            } else if (attrValue.type == "TextElement") {
                if (attr.id.name != "desc")
                    continue;

                translate.description = attrValue.value
            }
        }

        return translate
    }
}
