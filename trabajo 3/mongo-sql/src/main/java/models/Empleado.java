package models;

import java.sql.Ref;

import java.util.LinkedList;

public class Empleado {
    public Number cc;
    public String nom;
    public Number miciu;
    public LinkedList<Venta> ventas;
    public Ref miciuRef;

    public Empleado(Number cc, String nom, Number miciu, LinkedList<Venta> ventas, Ref miciuRef) {
        this.cc = cc;
        this.nom = nom;
        this.miciu = miciu;
        this.ventas = ventas;
        this.miciuRef = miciuRef;
    }

}