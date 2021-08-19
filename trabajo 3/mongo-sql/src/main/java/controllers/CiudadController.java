package controllers;

import java.sql.*;
import java.util.*;
import models.*;

public class CiudadController {

    Connection conn;

    public CiudadController(Connection conn) {
        this.conn = conn;
    }

    public Ciudad getCiudadPorCod(Number cod) {
        var consulta = "SELECT * FROM ciudad WHERE cod = %s";
        consulta = String.format(consulta, cod);

        try {
            Statement sentencia = conn.createStatement();
            ResultSet querie = sentencia.executeQuery(consulta);

            Ciudad resultado = new Ciudad(querie.getFloat("cod"), querie.getString("nom"), null);

            return resultado;

        } catch (Exception e) {
            System.out.println("Se produjo un error obtiendo la ciudad por codigo: " + e.getMessage());
            return null;
        }
    }

    public LinkedList<Ciudad> getCiudadesPorDepartamento(Number codDepartamento) {
        var consulta = "SELECT * FROM ciudad WHERE midep = (SELECT REF(d) FROM departamento d WHERE cod = %s)";
        consulta = String.format(consulta, codDepartamento);
        // System.out.println(consulta);

        try {
            Statement sentencia = conn.createStatement();
            ResultSet querie = sentencia.executeQuery(consulta);

            LinkedList<Ciudad> resultado = new LinkedList<Ciudad>();

            while (querie.next()) {

                // System.out.println(querie.getFloat("cod") + querie.getString("nom"));
                resultado.add(new Ciudad(querie.getFloat("cod"), querie.getString("nom"), codDepartamento));

            }

            return resultado;

        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
    }

}