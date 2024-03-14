import * as process from "process";

export function argvAny(key: string): any {
    // Return true if the key exists and a value is defined
    if ( process.argv.includes( `--${ key }` ) ) return true;

    const value = process.argv.find( element => element.startsWith( `--${ key }=` ) );

    // Return null if the key does not exist and a value is not defined
    if ( !value ) return null;

    return value.replace( `--${ key }=` , '' );
}

export function argvAnyDefault(key: string, defaultValue: any): any {
    // Return true if the key exists and a value is defined
    if ( process.argv.includes( `--${ key }` ) ) return true;

    const value = process.argv.find( element => element.startsWith( `--${ key }=` ) );

    // Return null if the key does not exist and a value is not defined
    if ( !value ) return defaultValue;

    return value.replace( `--${ key }=` , '' );
}

export function argv<T>(key: string): T {
    return argvAny(key) as T;
}

export function argvDefault<T>(key: string, defaultValue: T): T {
    return argvAnyDefault(key, defaultValue) as T;
}

export function getCommand(): string {
    return process.argv[2]
}
