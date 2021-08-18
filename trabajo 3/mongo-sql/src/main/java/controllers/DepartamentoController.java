package controllers;

import java.util.*;
import java.sql.*;

import models.*;

public class DepartamentoController {
    Connection conn;

    public DepartamentoController(Connection conn) {
        this.conn = conn;
    }

    public LinkedList<Departamento> getDepartamentos() {

        String consulta = "SELECT * FROM departamento";

        try {
            Statement sentencia = conn.createStatement();
            ResultSet querie = sentencia.executeQuery(consulta);

            LinkedList<Departamento> resultado = new LinkedList<Departamento>();

            while (querie.next()) {

                resultado.add(new Departamento(querie.getFloat("cod"), querie.getString("nom")));

            }

            return resultado;

        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }

    }

}
