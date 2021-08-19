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

    public Number getTotalVentasEmpleado(Number cc) {
        var consulta = "SELECT " + "SUM((v.miprod.precio_unitario) * v.nro_unidades) AS total "
                + "FROM empleado e, TABLE(e.ventas) v " + "WHERE e.cc = %s ";

        consulta = String.format(consulta, cc);
        // System.out.println(consulta);

        try {
            Statement sentencia = conn.createStatement();
            ResultSet querie = sentencia.executeQuery(consulta);

            Number resultado = null;

            while (querie.next()) {
                resultado = querie.getFloat("total");
                // System.out.println(resultado);
            }

            return resultado;

        } catch (Exception e) {
            System.out.println("Error obteniendo total de ventas de empleado: " + e.getMessage());
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

}
