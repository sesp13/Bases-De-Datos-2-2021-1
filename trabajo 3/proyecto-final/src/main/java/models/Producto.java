package models;

public class Producto {
    public Number cod;
    public String nom;
    public Number precio_unitario;

    public Producto(Number cod, String nom, Number precio_unitario){
        this.cod = cod;
        this.nom = nom;
        this.precio_unitario = precio_unitario;
    }

}
