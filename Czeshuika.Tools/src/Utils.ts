import fs, {PathLike} from "fs";
import path from "path";
import * as YAML from "yaml";

interface ICallbackFn {
    (relativePath: string, fileName: string): void
}

export interface IDict<T> {
    [key: string]: T
}

export function walker(_path: string, fileExt: string, callback: ICallbackFn, originalPath?: string): void {
    fs.readdirSync(_path).forEach(fileName => {
        let fullPath = path.join(_path, fileName)
        if (fs.statSync(fullPath).isDirectory()) {
            walker(fullPath, fileExt, callback, originalPath == null ? _path : originalPath)
        } else if (path.extname(fileName) != fileExt) {
            return;
        } else {
            let relativePath = path.dirname(fullPath)
                .substring((originalPath == null ? _path.length : originalPath.length) + 1)
            callback(relativePath, fileName)
        }
    })
}

export function readFile(path: PathLike): string {
    return fs.readFileSync(path, {encoding: "utf-8"});
}

export function writeFile(path: PathLike, data: string): void {
    fs.writeFileSync(path, data, {encoding: "utf-8"});
}

export function mkdir(path: PathLike): void {
    fs.mkdirSync(path, {recursive: true})
}

export function yamlParse(data: string): any {
    return YAML.parseDocument(data, {prettyErrors: false}).toJSON()
}
