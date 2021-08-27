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
    HistoricoVentasController historicoVentasController;

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
            // Tener autocommits
            // conn.setAutoCommit(true);
        } catch (Exception e) {
            System.out.println("No hay conexión con la base de datos.");
            return;
        }

        // Autocommit

        // Carga de controladores
        this.ciudadController = new CiudadController(conn);
        this.empleadoController = new EmpleadoController(conn);
        this.departamentoController = new DepartamentoController(conn);
        this.ventasController = new VentasController(conn);
        this.historicoVentasController = new HistoricoVentasController(conn);

        // this.visualizarListaMongoClass(this.generarEstadisticas());
        // System.out.println("------------------------------------------------------------------------------------------------------------------------------------------");
        // this.generarHistorico();

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
            for (MongoVentas ventas : item.misventas) {
                System.out.println(String.format("Ciudad: %s", ventas.nombreCiudad));
                System.out.println(String.format("Total: %s", ventas.valorVentas));
                System.out.println(String.format("MejorVendedor: %s", ventas.mejorVendedor));
                System.out.println("*********");
            }
        }
    }

    public void generarHistorico() {

        // ------------ Iterar sobre los empleados ----------------
        var empleados = this.empleadoController.getEmpleados();

        for (Empleado empleado : empleados) {
            // System.out.println(empleado.cc + " " + empleado.nom);
            var totalVentasEmpleado = this.empleadoController.getTotalVentasEmpleado(empleado.cc);
            // System.out.println(totalVentasEmpleado);

            // Buscar si existe un historico de venta
            var historicoViejo = this.historicoVentasController.getHistoricoEmpleado(empleado.cc);

            if (historicoViejo != null) {

                // -------------- Si el historico existe -------------------
                System.out.println("--------------------------");
                System.out.println("Existo tengo cc: " + historicoViejo.cc + " y mi total actual es: " + historicoViejo.totalacumuladoventas + " me sumaran " + totalVentasEmpleado);

                var historicoActualizado = new HistoricoVenta(empleado.cc, totalVentasEmpleado);

                // Sumar el acumulado de ventas
                historicoActualizado.totalacumuladoventas = historicoActualizado.totalacumuladoventas.floatValue()
                        + historicoViejo.totalacumuladoventas.floatValue();

                // Actualizarlo en la base de datos
                var resultadoActualizacion = this.historicoVentasController.actualizarHistoricoVentas(historicoActualizado);

                if (resultadoActualizacion) {
                    System.out.println(String.format("Historico de %s actualizado nuevo valor %s", historicoActualizado.cc,
                            historicoActualizado.totalacumuladoventas));
                } else {
                    System.out.println(String.format("Error actualizando historico de %s", historicoActualizado.cc));
                }

            } else {

                // ------------ Si el historico no existe ----------------

                // Crear historico nuevo
                var historicoNuevo = new HistoricoVenta(empleado.cc, totalVentasEmpleado);

                // Guardarlo en la base de datos
                var resultadoCreacion = this.historicoVentasController.crearHistoricoVentas(historicoNuevo);

                if (resultadoCreacion) {
                    System.out.println(String.format("Historico de %s creado", historicoNuevo.cc));
                } else {
                    System.out.println(String.format("Error creando historico de %s", historicoNuevo.cc));
                }
            }


        }

        // -------- Reiniciar ventas de empleados ------------
        var resultadoReinicioVentas = this.ventasController.reiniciarVentas();

        if (resultadoReinicioVentas) {
            System.out.println("Ventas borradas correctamente");
        } else {
            System.out.println("Error al borrar ventas");
        }

    }

}