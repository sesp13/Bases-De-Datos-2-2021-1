package ModelsM;

import models.Venta;

import java.sql.Ref;
import java.util.LinkedList;

public class EmpleadoM {
    public Number cc;
    public Number ventas;

    public EmpleadoM(Number cc, Number ventas) {
        this.cc = cc;
        this.ventas = ventas;
    }
}
