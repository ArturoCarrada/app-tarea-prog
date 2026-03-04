::==============================================================================================================================
::======================== Bat para poder ejecutar la app de node desde el programador de tareas de Windows ====================
::==============================================================================================================================
@echo off   

:: NOTA: Se debe tener instalado previamente Node mediante NVM (Node Version Manager) para Windows (este se instala primero),
::      e instalar ahora así la versión de Node que se va a usar (en este caso, 20.20.0)

:: Forzar a la consola a usar UTF-8 para que los acentos se vean bien en el log del visor de eventos
chcp 65001 > nul

:: 1. Ir a la raíz del proyecto
cd /d "C:\"

:: 2.Asegurar versión de Node con NVM
call nvm use 20.20.0

:: X. Instalar dependencias (solo si no existen, opcional)
:: call npm install

:: X. Compilar TypeScript a JavaScript
:: echo Compilando TypeScript...
:: call npx tsc

:: 3. Definir la ruta exacta al ejecutable de Node
SET "NODE_BIN=C:\nvm4w\nodejs\node.exe"

:: 4. Ejecutar el archivo usando la ruta absoluta del motor de Node (dist/index.js es el archivo compilado del proyecto)
echo Iniciando proceso...
:: node dist/index.js
"%NODE_BIN%" dist/index.js

:: 3. Ejecutar el archivo compilado desde la carpeta /dist
echo Ejecutando...

:: 4. Verificar si el proceso de Node se ejecutó correctamente, si no, registrar un evento de error en el visor de eventos de Windows
:: Capturamos el código de salida de Node

::IF %ERRORLEVEL% NEQ 0 (
::    echo Ocurrió un error en Node. Código: %ERRORLEVEL%
::    :: Salimos del bat con el mismo código de error que dio Node
::    exit /b %ERRORLEVEL%
::)

:: Si %ERRORLEVEL% es diferente de 0, significa que hubo un error en la ejecución de Node,
:: por lo que se registra un evento de error en el visor de eventos de Windows y se sale del bat con el mismo código de error
IF %ERRORLEVEL% NEQ 0 (
    eventcreate /ID 999 /L APPLICATION /T ERROR /D "La tarea programada de Node falló."
    exit /b %ERRORLEVEL%
)

:: pause
:: timeout /t 10

exit /b 0
