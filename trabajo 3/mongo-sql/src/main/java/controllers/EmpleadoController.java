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
