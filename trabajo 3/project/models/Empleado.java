package models;

import java.sql.Ref;

public class Empleado {
  public Number cc;
  public String nom;
  public Number miciu;
  public String ventas;
  public Ref miciuRef;

  public Empleado(Number cc, String nom, Number miciu, String ventas, Ref miciuRef) {
    this.cc = cc;
    this.nom = nom;
    this.miciu = miciu;
    this.ventas = ventas;
    this.miciuRef = miciuRef;
  }

}
