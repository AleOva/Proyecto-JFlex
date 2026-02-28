// Lexer.flex
// Analizador Léxico para JSON
// Version FINAL - Con retornos numéricos

%%

%public
%class Lexer
%unicode
%line
%column
%function yylex
%type int
%eofval{
    return 0;
%eofval}

%{
    // Variables PUBLICAS para que Main.java pueda acceder a ellas
    public static String ultimoToken = "";
    public static String ultimoLexema = "";
    public static String ultimoPatron = "";
    public static int ultimaFila = 0;
    public static int ultimaColumna = 0;
    
    // Metodo para actualizar la informacion del token
    private void setTokenInfo(String token, String patron) {
        ultimoToken = token;
        ultimoLexema = yytext();
        ultimoPatron = patron;
        ultimaFila = yyline + 1;
        ultimaColumna = yycolumn + 1;
        
        // Imprimir en consola con formato de tabla
        System.out.printf("%-20s %-30s %-35s %-6d %-6d%n", 
            ultimoToken, ultimoLexema, ultimoPatron, ultimaFila, ultimaColumna);
    }
%}

/* Definicion de patrones */
DIGITO = [0-9]
LETRA = [a-zA-Z]
DIGITOS = {DIGITO}+
NUMERO_ENTERO = {DIGITOS}
NUMERO_DECIMAL = {DIGITOS} \. {DIGITOS}
NUMERO_NEGATIVO = \- {DIGITOS} (\. {DIGITOS})?
CADENA = \" ([^\"\\] | \\ .)* \"
ESPACIOS = [ \t\r\n]+

%%

/* Palabras reservadas - CADA UNA RETORNA UN NÚMERO DIFERENTE */
"true"          { setTokenInfo("BOOLEAN_TRUE", "Palabra reservada true"); return 1; }
"false"         { setTokenInfo("BOOLEAN_FALSE", "Palabra reservada false"); return 2; }
"null"          { setTokenInfo("NULL", "Palabra reservada null"); return 3; }

/* Simbolos especiales JSON */
"{"             { setTokenInfo("LLAVE_APERTURA", "Caracter '{'"); return 4; }
"}"             { setTokenInfo("LLAVE_CIERRE", "Caracter '}'"); return 5; }
"["             { setTokenInfo("CORCHETE_APERTURA", "Caracter '['"); return 6; }
"]"             { setTokenInfo("CORCHETE_CIERRE", "Caracter ']'"); return 7; }
":"             { setTokenInfo("DOS_PUNTOS", "Caracter ':'"); return 8; }
","             { setTokenInfo("COMA", "Caracter ','"); return 9; }

/* Numeros */
{NUMERO_ENTERO}     { setTokenInfo("NUMERO_ENTERO", "Numero entero"); return 10; }
{NUMERO_DECIMAL}    { setTokenInfo("NUMERO_DECIMAL", "Numero decimal"); return 11; }
{NUMERO_NEGATIVO}   { setTokenInfo("NUMERO_NEGATIVO", "Numero negativo"); return 12; }

/* Cadenas de texto */
{CADENA}            { setTokenInfo("CADENA", "Cadena de texto"); return 13; }

/* Identificadores */
{LETRA}({LETRA}|{DIGITO}|_)* { setTokenInfo("IDENTIFICADOR", "Identificador"); return 14; }

/* Espacios - se ignoran (NO retornan nada) */
{ESPACIOS}          { /* Ignorar espacios */ }

/* Error lexico */
[^]                 { 
    System.err.println("Error: Caracter no valido '" + yytext() + 
                       "' linea " + (yyline + 1)); 
    return 15; 
}