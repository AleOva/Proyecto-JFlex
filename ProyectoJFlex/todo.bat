@echo off
echo ========================================
echo PROCESO COMPLETO - ANALIZADOR JSON
echo ========================================
echo.

echo [1/4] Generando Lexer.java con JFlex...
java -jar lib/jflex-full-1.9.1.jar src/Lexer.flex
if %errorlevel% neq 0 (
    echo ERROR: Fallo JFlex
    pause
    exit /b
)
echo OK - Lexer.java generado
echo.

echo [2/4] Compilando archivos Java...
javac src/*.java
if %errorlevel% neq 0 (
    echo ERROR: Fallo compilacion
    pause
    exit /b
)
echo OK - Compilacion exitosa
echo.

echo [3/4] Verificando entrada.json...
if not exist entrada.json (
    echo ADVERTENCIA: No existe entrada.json
    echo Creando archivo de ejemplo...
    echo { > entrada.json
    echo   "ejemplo": "test" >> entrada.json
    echo } >> entrada.json
)
echo OK - Archivo listo
echo.

echo [4/4] Ejecutando analizador...
echo.
java -cp src Main

echo.
echo ========================================
echo PROCESO COMPLETADO
echo ========================================
pause