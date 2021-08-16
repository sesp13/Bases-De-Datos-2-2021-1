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
  VentasController ventasController;

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
    this.ventasController = new VentasController(conn);

    this.visualizarListaMongoClass(this.generarEstadisticas());

  }

  public LinkedList<MongoClass> generarEstadisticas() {

    // Objeto de resultado
    var resultado = new LinkedList<MongoClass>();

    // Obtención de departamentos
    var departamentos = this.departamentoController.getDepartamentos();

    if (departamentos != null) {
      for (Departamento departamento : departamentos) {

        var misventas = new LinkedList<MongoVentas>();

        // Obtencion de ciudades dentro de departamentos
        var ciudades = this.ciudadController.getCiudadesPorDepartamento(departamento.cod);

        if (ciudades != null) {

          for (Ciudad ciudad : ciudades) {

            // Obtener listado de empleados
            // var empleados = this.empleadoController.getEmpleadosPorCiudad(ciudad.cod);

            // Arreglo de las ventas de la ciudad
            // var ventasCiudad = this.ventasController.getVentasPorCiudad(ciudad.cod);

            // Obtener la cantidad total de ventas
            var valorTotalVentasCiudad = this.ventasController.getValorTotalVentasCiudad(ciudad.cod);

            // Obtener vendedor con mas ventas
            var empleadoConMasVentas = this.ventasController.getEmpleadoConMasVentas(ciudad.cod);

            // Generar estadisticas misVentas
            var detalle = new MongoVentas();
            detalle.nombreCiudad = ciudad.nom;
            detalle.mejorVendedor = empleadoConMasVentas;
            detalle.valorVentas = valorTotalVentasCiudad;

            misventas.add(detalle);

          }
        }

        // Construir el modelo final
        var resultadoDepartamento = new MongoClass();
        resultadoDepartamento.nombreDepartamento = departamento.nom;
        resultadoDepartamento.misventas = misventas;

        // Agregar el departamento al resultado final
        resultado.add(resultadoDepartamento);
      }
    }

    // Retornar departamento
    return resultado;
  }

  public void visualizarListaMongoClass(LinkedList<MongoClass> lista) {
    for (MongoClass item : lista) {
      System.out.println("--------------");
      System.out.println(String.format("Nombre: %s", item.nombreDepartamento));
      System.out.println("-- Detalle");
      for(MongoVentas ventas : item.misventas){
        System.out.println(String.format("Ciudad: %s", ventas.nombreCiudad));
        System.out.println(String.format("Total: %s", ventas.valorVentas));
        System.out.println(String.format("MejorVendedor: %s", ventas.mejorVendedor));
        System.out.println("*********");
      }
    }
  }

}
