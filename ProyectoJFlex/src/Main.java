import java.io.FileReader;
import java.io.FileWriter;
import java.io.PrintWriter;
import java.io.IOException;

public class Main {
    public static void main(String[] args) {
        System.out.println("=========================================");
        System.out.println("   ANALIZADOR LEXICO PARA JSON");
        System.out.println("=========================================");
        
        FileReader reader = null;
        PrintWriter csvWriter = null;
        
        try {
            // Verificar que existe el archivo de entrada
            java.io.File file = new java.io.File("entrada.json");
            if (!file.exists()) {
                System.err.println("ERROR: No existe el archivo 'entrada.json'");
                System.err.println("Crealo con el contenido JSON del enunciado.");
                return;
            }
            
            // Crear archivo CSV de salida
            csvWriter = new PrintWriter(new FileWriter("salida_tokens.csv"));
            csvWriter.println("Nombre token,Lexema,Patron/Expresion regular,Fila,Columna");
            
            // Crear el lexer
            reader = new FileReader("entrada.json");
            Lexer lexer = new Lexer(reader);
            
            // Mostrar encabezados en consola
            System.out.println("\n" + "=".repeat(110));
            System.out.printf("%-20s %-30s %-35s %-10s %-10s%n", 
                "NOMBRE TOKEN", "LEXEMA", "PATRON/ER", "FILA", "COLUMNA");
            System.out.println("=".repeat(110));
            
            // Contador de tokens
            int contador = 0;
            int token;
            
            // Ejecutar el analizador - yylex() retorna 0 SOLO al final
            while ((token = lexer.yylex()) != 0) {
                contador++;
                
                // Guardar en CSV usando las variables publicas del Lexer
                csvWriter.println(String.format("\"%s\",\"%s\",\"%s\",%d,%d",
                    escapeCSV(Lexer.ultimoToken),
                    escapeCSV(Lexer.ultimoLexema),
                    escapeCSV(Lexer.ultimoPatron),
                    Lexer.ultimaFila,
                    Lexer.ultimaColumna));
                
                // Opcional: mostrar progreso
                // System.out.println("Token #" + contador + " procesado");
            }
            
            // Cerrar recursos
            csvWriter.close();
            reader.close();
            
            System.out.println("=".repeat(110));
            System.out.println("\nANALISIS COMPLETADO EXITOSAMENTE");
            System.out.println("Total de tokens analizados: " + contador);
            System.out.println("Archivo CSV generado: salida_tokens.csv");
            
        } catch (IOException e) {
            System.err.println("Error: " + e.getMessage());
            e.printStackTrace();
        }
    }
    
    private static String escapeCSV(String texto) {
        if (texto == null) return "";
        return texto.replace("\"", "\"\"");
    }
}