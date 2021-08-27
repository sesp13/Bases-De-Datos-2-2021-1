package controllersMongo;

import ModelsM.ContenedorMongo;
import ModelsM.DepartamentoM;
import com.mongodb.client.MongoCollection;
import org.javatuples.Pair;

import java.util.LinkedList;

public class BusquedaMongo {

    /*String uri;
    MongoClient mongoClient;
    MongoClientURI clientURI;
    MongoCollection collection;
    MongoDatabase mongoDatabase;*/
    MongoCollection collection;

    public Pair<String, Double> mayorVentasDepartamentoGlobal;
    public Pair<String, Double> mayorVentasCiudadGlobal;
    public Pair<String, Double> mayorVendedorGlobal;
    public Pair<String, Double> menorVendedorGlobal;
    public LinkedList<DepartamentoM> busquedaDepartamento;

    public BusquedaMongo(MongoCollection collection) {
        this.collection = collection;

        ContenedorMongo resultado = new OperadorBusquedaMongo(collection).getBusqueda();

        this.ejecutarBusqueda(resultado);
    }

    public void ejecutarBusqueda(ContenedorMongo resultado) {
        //departamento con ventas mas altas
        this.mayorVentasDepartamentoGlobal = CalculoBusquedas.mayorVentasxDepartamento(resultado.departamentos);
        //ciudad con ventas mas altas
        this.mayorVentasCiudadGlobal = CalculoBusquedas.mayorVentasxCiudad(resultado.ciudades);
        //vendedor con ventas más altas
        this.mayorVendedorGlobal = CalculoBusquedas.mayorVendedor(resultado.departamentos);
        //vendedor con ventas más bajas
        this.menorVendedorGlobal = CalculoBusquedas.menorVendedor(resultado.departamentos);
        //Busqueda por departamentos
        this.busquedaDepartamento = CalculoBusquedas.busquedaxDepartamentos(resultado.departamentos);
    }
}
