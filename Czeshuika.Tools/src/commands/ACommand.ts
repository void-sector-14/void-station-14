import * as cli from "../CommandLineParser";
import path from "path";
import {log} from "../Logger";

export abstract class ACommand {
    protected workdir: string

    // Название команды
    abstract name(): string

    // Точка запуска
    abstract execute(): void

    protected setupWorkdir(): void {
        this.workdir = cli.argv<string>("workdir")
        this.workdir = this.workdir == null ? __dirname : path.resolve(this.workdir)
        log.debug(`command work dir: ${this.workdir}`)
    }
}
