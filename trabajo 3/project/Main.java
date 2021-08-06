import java.sql.*;

public class Main {
  public static void main(String[] args) {
    Connection conn;
    Statement sentencia;
    ResultSet resultado;

    // Se carga el driver JDBC-ODBC
    try {
      Class.forName("oracle.jdbc.driver.OracleDriver");
    } catch (Exception e) {
      System.out.println("No se pudo cargar el driver JDBC");
      return;
    }

    // Se establece la conexión con la base de datos
    try {
      conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "admin", "admin");
      sentencia = conn.createStatement();
    } catch (SQLException e) {
      System.out.println("No hay conexión con la base de datos.");
      return;
    }

    try {
      System.out.println("Seleccionando...");
      resultado = sentencia.executeQuery("SELECT codigo,nom,salario FROM empleado");
      // Se recorren las tuplas retornadas
      while (resultado.next()) {
        System.out.println(resultado);
        System.out.println(
            resultado.getInt("codigo") + "---" + resultado.getString("nom") + "---" + resultado.getInt("salario"));
      }

      // Cierre de la conexión
      conn.close();
    } catch (SQLException e) {
      System.out.println("Error: " + e.getMessage());
    }
    System.out.println("Consulta finalizada.");
    
  } // Fin del main
} // Fin de la clase
