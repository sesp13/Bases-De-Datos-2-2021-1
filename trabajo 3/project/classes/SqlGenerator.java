package classes;

import java.sql.*;
import java.util.*;
import classes.models.*;

public class SqlGenerator {

  Connection conn;
  Auth auth;

  // Constructor
  public SqlGenerator() {

    // Instanciar clase de auth
    this.auth = new Auth();

    // Carga de driver
    try {
      Class.forName("oracle.jdbc.driver.OracleDriver");
    } catch (Exception e) {
      System.out.println("No se pudo cargar el driver JDBC");
      return;
    }

    // Conexion
    try {
      conn = DriverManager.getConnection(this.auth.pathDriverOracle, this.auth.usuarioOrcale, this.auth.passwordOracle);
    } catch (Exception e) {
      System.out.println("No hay conexión con la base de datos.");
      return;
    }

    this.generarEstadisticas();

  }

  public void generarEstadisticas() {
    // Obtención de departamentos
    var departamentos = this.getDepartamentos();

    if (departamentos != null) {
      for (Departamento departamento : departamentos) {

        var ciudades = this.getCiudadesPorDepartamento(departamento.cod);

        if (ciudades != null) {
          //Iterar sobre las ciudades del departamento
          for (Ciudad ciudad : ciudades) {
            getEmpleadosPorCiudad(ciudad.cod);
          }
        }
      }
    }
  }

  public LinkedList<Departamento> getDepartamentos() {

    String consulta = "SELECT * FROM departamento";

    try {
      Statement sentencia = conn.createStatement();
      ResultSet querie = sentencia.executeQuery(consulta);

      LinkedList<Departamento> resultado = new LinkedList<Departamento>();

      while (querie.next()) {

        resultado.add(new Departamento(querie.getFloat("cod"), querie.getString("nom")));

      }

      return resultado;

    } catch (Exception e) {
      System.out.println(e.getMessage());
      return null;
    }

  }

  public LinkedList<Ciudad> getCiudadesPorDepartamento(Number codDepartamento) {
    var consulta = "SELECT * FROM ciudad WHERE midep = (SELECT REF(d) FROM departamento d WHERE cod = %s)";
    consulta = String.format(consulta, codDepartamento);
    // System.out.println(consulta);

    try {
      Statement sentencia = conn.createStatement();
      ResultSet querie = sentencia.executeQuery(consulta);

      LinkedList<Ciudad> resultado = new LinkedList<Ciudad>();

      while (querie.next()) {

        // System.out.println(querie.getFloat("cod") + querie.getString("nom"));
        resultado.add(new Ciudad(querie.getFloat("cod"), querie.getString("nom"), codDepartamento));

      }

      return resultado;

    } catch (Exception e) {
      System.out.println(e.getMessage());
      return null;
    }
  }

  public LinkedList<Empleado> getEmpleadosPorCiudad(Number codCiudad) {
    var consulta = "SELECT * FROM empleado WHERE miciu = (SELECT REF(c) FROM ciudad c WHERE cod = %s)";
    consulta = String.format(consulta, codCiudad);
    // System.out.println(consulta);

    try {
      Statement sentencia = conn.createStatement();
      ResultSet querie = sentencia.executeQuery(consulta);

      LinkedList<Empleado> resultado = new LinkedList<Empleado>();

      while (querie.next()) {

        System.out.println(querie.getFloat("cc") + querie.getString("nom"));
        resultado.add(new Empleado(querie.getFloat("cc"), querie.getString("nom"), codCiudad, ""));

      }

      return resultado;

    } catch (Exception e) {
      System.out.println(e.getMessage());
      return null;
    }
  }

}
