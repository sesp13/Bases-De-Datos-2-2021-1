package controllers;

import java.util.*;
import java.sql.*;

import models.*;

public class EmpleadoController {

  Connection conn;

  public EmpleadoController(Connection conn) {
    this.conn = conn;
  }

  public LinkedList<Empleado> getEmpleados() {
    var consulta = "SELECT cc, nom, DEREF(miciu).cod as ciudad, miciu FROM empleado";
    // System.out.println(consulta);

    try {
      Statement sentencia = conn.createStatement();
      ResultSet querie = sentencia.executeQuery(consulta);

      LinkedList<Empleado> resultado = new LinkedList<Empleado>();

      while (querie.next()) {

        //Por defecto no se llena la lista de ventas
        resultado
            .add(new Empleado(querie.getFloat("cc"), querie.getString("nom"), querie.getFloat("ciudad"), null, querie.getRef("miciu")));

      }

      return resultado;

    } catch (Exception e) {
      System.out.println("Error obteniendo empleados: " + e.getMessage());
      return null;
    }
  }

  public LinkedList<Empleado> getEmpleadosPorCiudad(Number codCiudad) {
    var consulta = "SELECT cc, nom, miciu FROM empleado WHERE miciu = (SELECT REF(c) FROM ciudad c WHERE cod = %s)";
    consulta = String.format(consulta, codCiudad);
    // System.out.println(consulta);

    try {
      Statement sentencia = conn.createStatement();
      ResultSet querie = sentencia.executeQuery(consulta);

      LinkedList<Empleado> resultado = new LinkedList<Empleado>();

      while (querie.next()) {

        //Por defecto no se llena la lista de ventas
        resultado
            .add(new Empleado(querie.getFloat("cc"), querie.getString("nom"), codCiudad, null, querie.getRef("miciu")));

      }

      return resultado;

    } catch (Exception e) {
      System.out.println("Error obteniendo empleados por ciudad: " + e.getMessage());
      return null;
    }
  }

  public Empleado getEmpleadoPorCC(Number cc){
    var consulta = "SELECT cc, nom, DEREF(miciu).cod as codCiudad FROM empleado e WHERE e.cc = %s";
    consulta = String.format(consulta, cc);
    System.out.println(consulta);

    try {
      Statement sentencia = conn.createStatement();
      ResultSet querie = sentencia.executeQuery(consulta);

      Empleado resultado = null;

      while (querie.next()) {
        //Crear objeto del empleado escogido
        var empleado = new Empleado(querie.getFloat("cc"), querie.getString("nom"), querie.getFloat("codCiudad"), null, querie.getRef("miciu"));
        resultado = empleado;
          
      }

      return resultado;

    } catch (Exception e) {
      System.out.println("Error obteniendo empleado por cc: " + e.getMessage());
      return null;
    }
  }

  public Boolean reiniciarVentas(){
    var consulta = "UPDATE empleado SET ventas = vent_varray()";

    Boolean resultado = false;

    try {
      Statement sentencia = conn.createStatement();
      sentencia.executeQuery(consulta);

      resultado = true;

      return resultado;

    } catch (Exception e) {
      System.out.println("Error reiniciando las ventas de los empleados " + e.getMessage());
      return null;
    }

  }

}
