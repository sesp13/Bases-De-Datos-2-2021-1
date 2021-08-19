package ModelsM;

import java.util.HashMap;
import java.util.LinkedList;

public class ContenedorMongo {
    public LinkedList<DepartamentoM> departamentos;
    public HashMap<String, Double> ciudades;
    public Double ventasTotales;

    public ContenedorMongo(LinkedList<DepartamentoM> departamentos, HashMap<String, Double> ciudades, Double ventasTotales){
        this.departamentos=departamentos;
        this.ciudades=ciudades;
        this.ventasTotales=ventasTotales;
    }
}

