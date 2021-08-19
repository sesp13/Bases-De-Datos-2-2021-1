package controllers;

import java.sql.*;
import java.util.LinkedList;

import models.*;

public class VentasController {

    Connection conn;

    public VentasController(Connection conn) {
        this.conn = conn;
    }

    public LinkedList<Venta> getVentasPorCiudad(Number codCiudad) {
        var consulta = String.join("", "SELECT ", "v.miprod.cod as miprod, ",
                // "e.cc as cc, ",
                "v.nro_unidades as nro_unidades ", "FROM empleado e, TABLE(e.ventas) v ",
                "WHERE miciu = (SELECT REF(c) FROM ciudad c WHERE cod = %s)");

        consulta = String.format(consulta, codCiudad);
        // System.out.println(consulta);

        try {
            Statement sentencia = conn.createStatement();
            ResultSet querie = sentencia.executeQuery(consulta);

            LinkedList<Venta> resultado = new LinkedList<Venta>();

            while (querie.next()) {

                var venta = new Venta(querie.getFloat("miprod"), querie.getFloat("nro_unidades"));
                // System.out.println(venta.miprod);
                resultado.add(venta);

            }

            return resultado;

        } catch (Exception e) {
            System.out.println("Error obteniendo ventas por ciudad: " + e.getMessage());
            return null;
        }
    }

    public Number getValorTotalVentasCiudad(Number codCiudad) {
        var consulta = String.join("", "SELECT ", "SUM((v.miprod.precio_unitario) * v.nro_unidades) AS total ",
                "FROM empleado e, TABLE(e.ventas) v ", "WHERE e.miciu = (SELECT REF(c) FROM ciudad c WHERE cod = %s)");

        consulta = String.format(consulta, codCiudad);
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
            System.out.println("Error obteniendo el valor total de ventas por ciudad: " + e.getMessage());
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


    public String getEmpleadoConMasVentas(Number codCiudad) {
        var consulta = String.join("", "SELECT * FROM ", "( ", "SELECT ", "e.cc as cc, ",
                "SUM((v.miprod.precio_unitario) * v.nro_unidades) AS total ", "FROM empleado e, TABLE(e.ventas) v ",
                "WHERE e.miciu = (SELECT REF(c) FROM ciudad c WHERE cod = %s)", "GROUP BY e.cc ", "ORDER BY total DESC ", ") ",
                "WHERE rownum <= 1 ");

        consulta = String.format(consulta, codCiudad);
        // System.out.println(consulta);

        try {
            Statement sentencia = conn.createStatement();
            ResultSet querie = sentencia.executeQuery(consulta);

            String resultado = "null";

            while (querie.next()) {
                resultado = String.format("cc: %s, total: %s", querie.getString("cc"), querie.getFloat("total"));
                // System.out.println(resultado);
            }

            return resultado;

        } catch (Exception e) {
            System.out.println("Error obteniendo el empleado de mayor venta: " + e.getMessage());
            return null;
        }
    }

}