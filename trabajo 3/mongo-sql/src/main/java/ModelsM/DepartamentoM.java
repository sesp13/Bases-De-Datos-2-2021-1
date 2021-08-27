package ModelsM;

import com.mongodb.client.MongoCollection;
import org.javatuples.Pair;

import java.util.HashMap;
import java.util.LinkedList;

public class DepartamentoM {

    public String nombre;
    public Pair<String, Double> ciudadMayorVentas;
    public EmpleadoM vendedorMayor;
    public EmpleadoM vendedorMenor;
    public Number ventas;
    public HashMap<String, Double> listaCiudades;

    public DepartamentoM(String nombre, HashMap<String, Double> listaCiudades, EmpleadoM vendedorMayor, EmpleadoM vendedorMenor, Number ventas) {
        this.vendedorMayor=vendedorMayor;
        this.vendedorMenor=vendedorMenor;
        this.ventas=ventas;
        this.nombre=nombre;
        this.listaCiudades=listaCiudades;
    }

}
