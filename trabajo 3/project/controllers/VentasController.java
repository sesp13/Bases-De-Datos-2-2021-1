package controllers;

import java.sql.*;
import java.util.LinkedList;

import models.Venta;

public class VentasController {

  Connection conn;

  public VentasController(Connection conn) {
    this.conn = conn;
  }
  
  public void getVentasPorCiudad(Number codCiudad){
    var consulta = "SELECT e.miprod as miprod as unidades FROM empleado e, TABLE(e.ventas)";
    // consulta = String.format(consulta, codCiudad);
    // System.out.println(consulta);

    try {
      Statement sentencia = conn.createStatement();
      ResultSet querie = sentencia.executeQuery(consulta);

      LinkedList<Venta> resultado = new LinkedList<Venta>();

      while (querie.next()) {

        //Por defecto no se llena la lista de ventas
        // resultado
        //     .add(new Empleado(querie.getFloat("cc"), querie.getString("nom"), codCiudad, null, querie.getRef("miciu")));

        var mensaje = "El empleado %s vendio %s unidades";
        mensaje = String.format(mensaje,querie.getString("cc"), querie.getFloat("nro_unidades"));

        System.out.println(mensaje);
      

      }

      // return resultado;

    } catch (Exception e) {
      System.out.println("Error obteniendo ventas por ciudad: " + e.getMessage());
      // return null;
    }
  }

}
