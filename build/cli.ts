#!/usr/bin/env ts-node
import yargs from 'yargs'
import shelljs, { ShellString } from 'shelljs'
import { Logger } from 'tslog'
const logger: Logger = new Logger();

const newLineRegExp = /\r?\n|\r/g
const cleanNewLine = (str: string): string => (str.replace(newLineRegExp, ""))

/*TODO:
    docker rm -f `docker container ls -aq
*/

const argv = yargs(process.argv).options({
    tag: { type: "string", demandOption: true },
    dockerfile: { type: "string", default: "./"},
    op: { type: "string", choices: ["build", "rm", "rmi"], demandOption: true }
})
.help('help')
.argv
const currentDir = shelljs.exec("echo $PWD").stdout


if(argv.op == "build"){
    let output: ShellString
    output = shelljs.exec(`docker build -t ${argv.tag} ${argv.dockerfile}`)
    let { code, stdout, stderr } = output
    let imageHash  = stdout
    if(code !== 0) {
        let { code, stdout, stderr } = shelljs.exec(`docker images | grep "<none>" | sed -E 's/\ +/\t/g' | cut -f3`)
        process.stderr.write("[DEBUG] Build process failed...\n Removing Image: " + imageHash)
        process.exit(1)
    }

    let image = cleanNewLine(shelljs.exec(`docker images | grep ${argv.tag} | awk '{printf $3}' | cut -c1-12`).stdout)
    let container = cleanNewLine(shelljs.exec(`docker container create ${image} | cut -c 1-12`).stdout)
    shelljs.exec(`docker start ${container}`)
    logger.info(`\n[DEBUG] Build Info:\nIMAGE: ${image}\nCONTAINER: ${container}`)
    logger.info(`\nEnter container: docker exec -it ${container} /bin/bash`)
    
    process.exit(0)
}
else if(argv.op == "rm"){

}





