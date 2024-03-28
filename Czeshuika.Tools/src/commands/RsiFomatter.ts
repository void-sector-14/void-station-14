import * as cli from "../CommandLineParser"
import {ACommand} from "./ACommand";
import fs from 'fs';
import {log} from "../Logger";
import * as path from "path";
import {writeFile} from "../Utils";

export class RsiFomatter extends ACommand {
    private metaJsonPath: string

    execute(): void {
        this.setupWorkdir()

        const rsiPath = cli.argv<string>("rsi")
        if (rsiPath == null) {
            log.error("Missing argument: \"--rsi=/path/to/texture.rsi\"")
            return
        }

        let metaJson = this.loadMetaJson(rsiPath)
        log.info("Sorting states")
        metaJson["states"] = (metaJson["states"] as Array<object>).sort((a, b) => {
            if (a["name"] > b["name"]) return 1
            if (a["name"] < b["name"]) return -1
            return 0
        })

        this.saveMetaJson(metaJson)
    }

    name(): string {
        return "rsi_formatter"
    }

    private loadMetaJson(rsiPath: string): object {
        log.info("Load meta.json")

        this.metaJsonPath = path.join(this.workdir, rsiPath, "meta.json")
        log.debug(`check "${this.metaJsonPath}"`)
        if (fs.statSync(`${this.metaJsonPath}`, {throwIfNoEntry: false}) === undefined) {
            log.error(`Invalide rsi texture "${rsiPath}": meta.json not found`)
            return
        }

        let buffer = fs.readFileSync(this.metaJsonPath, { encoding: "utf-8" })
        return JSON.parse(buffer)
    }

    private saveMetaJson(metaJson: object): void {
        log.info("Save meta.json")

        let jsonStr = JSON.stringify(metaJson, null, 2)
        writeFile(this.metaJsonPath, jsonStr + "\n")
    }
}
