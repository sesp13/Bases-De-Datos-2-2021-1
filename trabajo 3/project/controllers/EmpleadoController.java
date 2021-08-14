package controllers;

import java.util.*;
import java.sql.*;

import models.*;

public class EmpleadoController {

  Connection conn;

  public EmpleadoController(Connection conn) {
    this.conn = conn;
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

        // System.out.println(querie.getFloat("cc") + querie.getString("nom"));
        // LinkedList<Venta> ventaEmpleado = new LinkedList<Venta>();

        // var ventasArray = querie.getArray("ventas").getResultSet();

        // System.out.println(ventasArray.);

        // while(ventasArray.next()){
        //   System.out.println(ventasArray.getRef("miprod"));
        // }

        resultado
            .add(new Empleado(querie.getFloat("cc"), querie.getString("nom"), codCiudad, "", querie.getRef("miciu")));

      }

      return resultado;

    } catch (Exception e) {
      System.out.println("Error obteniendo empleados por ciudad: " + e.getMessage());
      return null;
    }
  }

}
