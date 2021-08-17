package models;

public class HistoricoVenta {
  public Number cc;
  public Number totalacumuladoventas = 0;

  public HistoricoVenta(Number cc, Number totalacumuladoventas){
    this.cc = cc;
    this.totalacumuladoventas = totalacumuladoventas;
  }

}