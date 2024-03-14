import * as cli from "./CommandLineParser"
import {ACommand} from "./commands/ACommand";
import {RsiFomatter} from "./commands/RsiFomatter";
import {log} from "./Logger";
import {IDict} from "./Utils";
import {EntitiesLocalization} from "./commands/EntitiesLocalization";
import {ConstructionsLocalization} from "./commands/ConstructionsLocalization";
import {AlertsLocalization} from "./commands/AlertsLocalization";
import {ConstructionGraphNodesLocalization} from "./commands/ConstructionGraphNodesLocalization";

const knownCommands: IDict<ACommand> = function (...cmds: ACommand[]): IDict<ACommand> {
    const result: IDict<ACommand> = {}
    cmds.forEach(cmd => {
        result[cmd.name()] = cmd
    })
    return result
}(
    new RsiFomatter(),
    new EntitiesLocalization(),
    new ConstructionsLocalization(),
    new ConstructionGraphNodesLocalization(),
    new AlertsLocalization(),
)

if (knownCommands.hasOwnProperty(cli.getCommand())) {
    log.debug(`node work dir: ${__dirname}`)
    knownCommands[cli.getCommand()].execute()
} else if (cli.getCommand() === undefined) {
    log.error("Missing command")
} else {
    log.error(`Unknown command: ${cli.getCommand()}`)
}
