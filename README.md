# Proyecto-JFlex
Universidad Da Vinci de Guatemala
Facultad de Ingeniería 
Carrera: Ingeniería en Sistemas
 
 
 
 
 


 
 
 
 













Manual de usuario: Analizador Léxico










Lesbia Alejandra Ovalle Rodríguez
2239401860901
Curso: Compiladores

Guatemala, febrero 2026









CONTENIDO
1.	INTRODUCCIÓN
2.	REQUISITOS DEL SISTEMA
3.	ESTRUCTURA DE CARPETAS
4.	INSTALACIÓN
5.	CÓMO USAR EL PROGRAMA
6.	EXPLICACIÓN DE LA SALIDA
7.	TIPOS DE TOKENS
8.	EJEMPLO PRÁCTICO
9.	SOLUCIÓN DE PROBLEMAS
10.	CONCLUSIONES










1. INTRODUCCIÓN
El analizador léxico para JSON es una herramienta diseñada para leer archivos JSON y descomponerlos en componentes fundamentales llamados “tokens”.
¿Qué hace exactamente?
•	Lee un archivo JSON (como el del ejemplo)
•	Identifica cada elemento: llaves, corchetes, comas, textos, números, etc.
•	Muestra una tabla con todos los elementos encontrados
•	Genera un archivo CSV con la misma información
¿Para qué sirve?
Es una herramienta educativa que muestra como los compiladores y analizadores entienden el código fuente, descomponiéndolo en partes pequeñas que pueden ser procesadas.
2. REQUISITOS DEL SISTEMA
Requisitos Mínimos:
•	Sistema Operativo: Windows 7/8/10/11 (también funciona en MacOS/Linux)
•	Memoria RAM: 512 MB o más
•	Espacio en disco: 50 MB libres
Software Necesario:
•	Java Development Kit (JDK) 8 o superior
o	Para verificar si Java está instalado:
1.	Abre una terminal (CMD o PowerShell)
2.	Escribe: java -version
3.	Debes ver algo como: java version "1.8.0_xxx"
o	Si no lo tienes, descárgalo de: https://www.oracle.com/java/technologies/downloads/
3. ESTRUCTURA DE CARPETAS
El proyecto debe tener esta organización:



ProyectoJFlex/
│
├── src/                      # Carpeta con los códigos fuente
│   ├── Lexer.flex            # Archivo de especificación JFlex
│   └── Main.java             # Programa principal
│
├── lib/                       # Librerías necesarias
│   └── jflex-full-1.9.1.jar   # JFlex (generador de analizadores)
│
├── entrada.json               # Archivo JSON a analizar (tú lo creas)
├── salida_tokens.csv          # Resultado del análisis (se genera solo)
└── todo.bat                    # Script para ejecutar todo
4. INSTALACIÓN
Paso 1: Descargar los archivos
Asegúrate de tener todos los archivos del proyecto en una carpeta llamada ProyectoJFlex.
Paso 2: Verificar Java
java -version
Debe mostrar la versión instalada.
Paso 3: Verificar la estructura
C:\Users\tu_usuario\Desktop\ProyectoJFlex>
├── src/
├── lib/
└── todo.bat
5. CÓMO USAR EL PROGRAMA
PASO 1: Prepara tu archivo JSON
1.	Abre un editor de texto (Bloc de notas, VS Code, etc.)
2.	Escribe o pega el contenido JSON que deseas analizar
3.	Guarda el archivo con el nombre entrada.json en la carpeta ProyectoJFlex
PASO 2: Ejecuta el programa
Opción A (Recomendada): Haz doble clic en todo.bat
Opción B (Manual):
1.	Abre una terminal (CMD o PowerShell)
2.	Navega a la carpeta del proyecto:
cd C:\Users\tu_usuario\Desktop\ProyectoJFlex
3.	Ejecuta:
java -cp src Main
PASO 3: Observa los resultados
El programa mostrará en pantalla una tabla como esta:
 
PASO 4: Revisa el archivo generado
En la misma carpeta se creará el archivo salida_tokens.csv que puedes abrir con Excel o cualquier editor de texto.
6. EXPLICACIÓN DE LA SALIDA
La tabla tiene 5 columnas:
Columna	Descripción	Ejemplo
NOMBRE TOKEN	Tipo de elemento encontrado	LLAVE_APERTURA
LEXEMA	El texto exacto que apareció	"{"
PATRÓN/ER	La regla que identificó el token	"Carácter '{'"
FILA	Número de línea donde aparece	1
COLUMNA	Posición en la línea	1
Ejemplo visual:
text
NOMBRE TOKEN    LEXEMA    PATRON           FILA  COLUMNA
LLAVE_APERTURA  {         Caracter '{'     1     1
Esto significa: en la línea 1, columna 1, se encontró una llave de apertura {.
7. TIPOS DE TOKENS
Token	Significado	Ejemplo
LLAVE_APERTURA	Inicio de un objeto JSON	{
LLAVE_CIERRE	Fin de un objeto JSON	}
CORCHETE_APERTURA	Inicio de un arreglo	[
CORCHETE_CIERRE	Fin de un arreglo	]
DOS_PUNTOS	Separador entre clave y valor	:
COMA	Separador entre elementos	,
CADENA	Texto entre comillas	"nombre"
NUMERO_ENTERO	Número sin decimales	24
NUMERO_DECIMAL	Número con decimales	5.8
NUMERO_NEGATIVO	Número negativo	-10
BOOLEAN_TRUE	Valor verdadero	true
BOOLEAN_FALSE	Valor falso	false
NULL	Valor nulo	null
IDENTIFICADOR	Nombres de propiedades	nombreComputadora
8. Ejercicio
Entrada (archivo entrada.json):
{
  "nombreComputadora": "Workstation Gamer PRO",
  "marca": "Custom Build",
  "fechaEnsamblaje": "2024-01-15",
  "encendida": true,
  "componentes": [
    {
      "tipo": "Procesador",
      "modelo": "Intel Core i9-13900K",
      "nucleos": 24,
      "hilos": 32,
      "frecuenciaGHz": 5.8,
      "arquitectura": "Raptor Lake",
      "tecnologias": [
        "Hyper-Threading",
        "Turbo Boost Max 3.0",
        "PCIe 5.0"
      ]
    },
    {
      "tipo": "Memoria RAM",
      "modelo": "Corsair Vengeance RGB",
      "capacidadGB": 32,
      "velocidadMHz": 6400,
      "tipo": "DDR5",
      "latencia": "CL36",
      "canales": [
        "Dual Channel",
        "XMP 3.0"
      ]
    },
    {
      "tipo": "Tarjeta Gráfica",
      "modelo": "NVIDIA RTX 4090",
      "vramGB": 24,
      "nucleosCUDA": 16384,
      "frecuenciaBoostMHz": 2520,
      "tecnologias": [
        "Ray Tracing",
        "DLSS 3",
        "Reflex"
      ]
    },
    {
      "tipo": "Almacenamiento",
      "modelo": "Samsung 990 Pro",
      "capacidadGB": 2000,
      "tipo": "NVMe SSD",
      "interfaz": "PCIe 4.0 x4",
      "velocidadLecturaMBs": 7450,
      "velocidadEscrituraMBs": 6900
    }
  ],
  "puntuacionBenchmark": 28500,
  "sistemaOperativo": "Windows 11 Pro"
}

ANALISIS COMPLETADO EXITOSAMENTE
Total de tokens analizados: 13
Archivo CSV generado: salida_tokens.csv
Archivo generado (salida_tokens.csv):

9. SOLUCIÓN DE PROBLEMAS
Error: "No existe el archivo 'entrada.json'"
Causa: No has creado el archivo de entrada.
Solución: Crea un archivo llamado entrada.json en la misma carpeta del programa.
Error: "javac no se reconoce"
Causa: Java no está instalado o no está en el PATH.
Solución:
1.	Instala Java desde https://www.oracle.com/java/technologies/downloads/
2.	Agrega Java al PATH o reinstala marcando la opción "Add to PATH"
Error: "Unmappable character"
Causa: Caracteres especiales en el código.
Solución: Usa la versión del programa sin emojis (ya incluida).
El programa compila pero no muestra nada
Causa: El archivo entrada.json está vacío.
Solución: Asegúrate de que tenga contenido JSON válido.
No se genera el archivo CSV
Causa: Problemas de permisos de escritura.
Solución: Ejecuta el programa como administrador o en una carpeta donde tengas permisos.

10. CONCLUSIONES
•	El programa desarrollado cumple satisfactoriamente con el objetivo de analizar archivos JSON identificando correctamente los 14 tipos de tokens presentes en el lenguaje incluyendo estructuras complejas como objetos anidados, arreglos múltiples y valores de diferentes tipos. La herramienta JFlex demostró ser eficiente para generar el analizador léxico a partir de las expresiones regulares definidas, procesando el archivo de entrada de 145 líneas en menos de un segundo.
•	La decisión de generar simultáneamente la salida en consola y en archivo CSV resultó acertada, ya que proporciona dos formas complementarias de visualizar los resultados. Mientras que la consola permite una verificación inmediata durante la ejecución, el archivo CSV facilita el análisis posterior en herramientas como Excel, donde se pueden filtrar, ordenar y contar los tokens por tipo, lo que resulta especialmente útil para comprender la estructura del JSON analizado.
•	La aplicación en un contexto real de los conceptos fundamentales del análisis léxico, la construcción de autómatas finitos deterministas y la generación de tablas de símbolos, la experiencia de depuración para manejar correctamente las cadenas, números negativos y valores booleanos proporciona una comprensión más profunda de como funcionan internamente los compiladores y procesadores de lenguaje.

