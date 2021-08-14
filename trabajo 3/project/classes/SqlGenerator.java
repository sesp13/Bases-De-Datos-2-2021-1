package classes;

import java.sql.*;
import java.util.*;

import controllers.*;
import models.*;

public class SqlGenerator {

  // Conexion a la base de datos oracle
  Connection conn;

  // Datos de autenticacion
  Auth auth;

  // Controladores
  CiudadController ciudadController;
  EmpleadoController empleadoController;
  DepartamentoController departamentoController;

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

    // Carga de controladores
    this.ciudadController = new CiudadController(conn);
    this.empleadoController = new EmpleadoController(conn);
    this.departamentoController = new DepartamentoController(conn);

    this.generarEstadisticas();

  }

  public void generarEstadisticas() {
    // Obtención de departamentos
    var departamentos = this.departamentoController.getDepartamentos();

    if (departamentos != null) {
      for (Departamento departamento : departamentos) {

        var ciudades = this.ciudadController.getCiudadesPorDepartamento(departamento.cod);

        if (ciudades != null) {
          // Iterar sobre las ciudades del departamento
          LinkedList<Venta> ventasCiudad = new LinkedList<Venta>();
          
          for (Ciudad ciudad : ciudades) {
            var empleados = this.empleadoController.getEmpleadosPorCiudad(ciudad.cod);
          }
        }
      }
    }
  }

}
