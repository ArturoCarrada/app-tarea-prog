import { writeLog } from './utils/logger';

const main = async(): Promise<void> => {
    try {
        writeLog("INICIO: Proceso TypeScript iniciado.");
        writeLog(`INFO: Usando Node ${process.version}`);
        
        // Simulación de lógica
        const resultadoPrueba: number = 10 + 20;
        writeLog(`INFO: Resultado de cálculo tipado: ${resultadoPrueba}`);

        writeLog("FIN: Proceso TS completado.");
        // throw new Error("Prueba de fallo");
        process.exit(0);
    } catch (error) {
        writeLog(`ERROR: ${(error as Error).message}`);
        process.exit(1);
    }
}

main();