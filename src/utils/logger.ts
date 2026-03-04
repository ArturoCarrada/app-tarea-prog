import * as fs from 'fs';
import * as path from 'path';

export const writeLog = (mensaje: string): void => {
    const now = new Date();
    const offsetMs = now.getTimezoneOffset() * 60000;

    // Crea la fecha ajustada y la formatea
    const timestamp = new Date(now.getTime() - offsetMs)
        .toISOString()
        .replace('T', ' ')
        .replace('Z', '');

    const logsDir = path.join(__dirname, '../../logs');
    const logFile = path.join(logsDir, 'log_ejecucion.txt');


    const linea = `[${timestamp}] [TS] - ${mensaje}\n`;

    if (!fs.existsSync(logsDir)) {
        fs.mkdirSync(logsDir, { recursive: true });
    }

    fs.appendFileSync(logFile, linea);
    console.log(linea);
}