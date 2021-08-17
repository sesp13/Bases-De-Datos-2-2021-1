package controllers;

import java.sql.*;
import java.util.*;
import models.*;

public class HistoricoVentasController {

  Connection conn;

  public HistoricoVentasController(Connection conn) {
    this.conn = conn;
  }

  public HistoricoVenta getHistoricoEmpleado(Number cc) {

    var consulta = "SELECT * FROM historicoventas WHERE cc = %s";
    consulta = String.format(consulta, cc);
    // System.out.println(consulta);

    try {
      Statement sentencia = conn.createStatement();
      ResultSet querie = sentencia.executeQuery(consulta);

      HistoricoVenta resultado = null;

      while (querie.next()) {
        resultado = new HistoricoVenta(querie.getFloat("cc"), querie.getFloat("totalacumuladoventas"));
        // System.out.println(resultado);
      }

      return resultado;

    } catch (Exception e) {
      System.out.println("Error obteniendo historico de venta de empleado: " + e.getMessage());
      return null;
    }

  }

  // Retorna true si logro completar la tarea
  public boolean crearHistoricoVentas(HistoricoVenta historicoNuevo) {
    var consulta = "INSERT INTO historicoventas VALUES(%s, %s)";
    consulta = String.format(consulta, historicoNuevo.cc, historicoNuevo.totalacumuladoventas);
    System.out.println(consulta);

    Boolean resultado = false;

    try {
      Statement sentencia = conn.createStatement();

      // Ejecutar insert
      sentencia.executeQuery(consulta);
      resultado = true;

      return resultado;

    } catch (Exception e) {
      System.out.println("Error creando historico de venta de empleado: " + e.getMessage());
      return false;
    }
  }

  // Retorna true si logro completar la tarea
  public boolean actualizarHistoricoVentas(HistoricoVenta historicoNuevo) {
    var consulta = "UPDATE historicoventas SET totalacumuladoventas = %s WHERE cc = %s";
    consulta = String.format(consulta, historicoNuevo.totalacumuladoventas, historicoNuevo.cc);
    // System.out.println(consulta);

    Boolean resultado = false;

    try {
      Statement sentencia = conn.createStatement();

      // Ejecutar insert
      sentencia.executeQuery(consulta);

      resultado = true;

      return resultado;

    } catch (Exception e) {
      System.out.println("Error actualizando historico de venta de empleado: " + e.getMessage());
      return false;
    }
  }

  // Iterar sobre los empleados

  // Sacar el resultado del historico de ventas, si noo existe crear el registro,
  // sino actualizarlo

  // Necesito obtener el total de ventas del empleado para poder saber como
  // actualizar

  // Borrar los arrays actualues

}
