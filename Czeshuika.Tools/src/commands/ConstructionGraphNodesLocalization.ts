import {ACommand} from "./ACommand";
import * as cli from "../CommandLineParser";
import {log} from "../Logger";
import {IDict, mkdir, readFile, walker, writeFile, yamlParse} from "../Utils";
import path from "path";
import {FluentParser, MessageReference} from "@fluent/syntax";
import {Message as FluentMessage} from "@fluent/syntax/esm/ast";

interface IConstructionGraphNode {
    node: string
}

interface IConstructionGraph {
    graph: IConstructionGraphNode[]
}

interface ITranslate {
    id: string
    name: string
    description: string
}

export class ConstructionGraphNodesLocalization extends ACommand {
    private constructionGraphNode: IDict<string> = {}

    execute(): void {
        this.setupWorkdir()

        const prototypesPath = cli.argv<string>("prototypes")
        if (prototypesPath == null) {
            log.error("Missing argument: \"--prototypes=/path/to/Resources/Prototypes\"")
            return
        }

        const ftlPath = cli.argv<string>("ftl")
        if (ftlPath == null) {
            log.error("Missing argument: \"--ftl=/path/to/Resources/Locale/ru-RU/prototypes/construction_graph.ftl\"")
            return
        }

        this.loadPrototypes(prototypesPath)
        // this.applyTranstation(ftlPath)
        this.saveTranslatedEntities(ftlPath)
    }

    name(): string {
        return "construction_graphnodes_localization";
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
                if (prototype == null || prototype["type"] != "constructionGraph")
                    continue;

                for (let item of (prototype as IConstructionGraph).graph) {
                    this.constructionGraphNode[item.node] = item.node;
                }
            }
        });
    }

    // private applyTranstation(ftlPath: string): void {
    //     log.info("Apply translate (.ftl)")
    //
    //     walker(path.join(this.workdir, ftlPath), ".ftl", (relativePath, fileName) => {
    //         let fullPath = path.join(this.workdir, ftlPath, relativePath, fileName)
    //         log.debug(`${relativePath}/${fileName}`)
    //
    //         const resource = new FluentParser().parse(readFile(fullPath));
    //         for (const fluentEntry of resource.body) {
    //             if (fluentEntry.type != "Message")
    //                 throw new Error("Oops-1!") //FIXME
    //
    //             const translate = this.convertFluent(fluentEntry)
    //
    //             const construction = this.constructions[translate.id]
    //             if (construction == null)
    //                 continue
    //
    //             construction.name = translate.name
    //             construction.description = translate.description
    //         }
    //     })
    // }

    private saveTranslatedEntities(savePath: string): void {
        log.info("Save translated prototypies")

        let lines: string[] = []
        for (let [nameOriginal, nameTranslated] of Object.entries(this.constructionGraphNode)) {
            lines.push(`con-graph-node-${nameOriginal} = ${nameTranslated}`)
        }
        writeFile(path.join(this.workdir, savePath), lines.join("\n"))
    }

    // private convertConstruction(rawEntity: object): IConstruction {
    //     return {
    //         id: rawEntity["id"],
    //         name: rawEntity["name"],
    //         description: rawEntity["description"],
    //     } as IConstruction
    // }
    //
    // private convertFluent(fluentMessage: FluentMessage): ITranslate {
    //     const translate = {
    //         id: fluentMessage.id.name.substring(4) // con-ConstructionId --> ConstructionId
    //     } as ITranslate
    //
    //     let nameElement = fluentMessage.value.elements[0]
    //     if (nameElement.type == "TextElement") {
    //         translate.name = nameElement.value
    //     } else if (nameElement.type == "Placeable") {
    //         if (nameElement.expression.type == "MessageReference") {
    //             translate.name = `{ ${nameElement.expression.id.name} }`
    //         } else if (nameElement.expression.type == "StringLiteral") {
    //             translate.name = nameElement.expression.value == "" ? '{ "" }' : nameElement.expression.value
    //         } else {
    //             throw new Error(`unsupported type '${nameElement.expression.type}'`)
    //         }
    //     }
    //
    //     for (const attr of fluentMessage.attributes) {
    //         let attrValue = attr.value.elements[0]
    //         if (attrValue.type == "Placeable") {
    //             if (attrValue.expression.type == "MessageReference") {
    //                 let msgRef = attrValue.expression as MessageReference
    //                 if (attr.id.name != "desc")
    //                     continue;
    //
    //                 translate.description = (msgRef.attribute == null)
    //                     ? `{ ${msgRef.id.name} }` //{ ref-to-message-id }
    //                     : `{ ${msgRef.id.name}.${msgRef.attribute.name} }`
    //             } else if (attrValue.expression.type == "StringLiteral") {
    //                 if (attr.id.name != "desc")
    //                     continue;
    //
    //                 translate.description = attrValue.expression.value == ""
    //                     ? '{ "" }'
    //                     : attrValue.expression.value
    //             } else {
    //                 throw new Error(`unsupported type '${attrValue.expression.type}'`)
    //             }
    //         } else if (attrValue.type == "TextElement") {
    //             if (attr.id.name != "desc")
    //                 continue;
    //
    //             translate.description = attrValue.value
    //         }
    //     }
    //
    //     return translate
    // }
}
