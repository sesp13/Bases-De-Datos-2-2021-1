package ModelsM;

import com.mongodb.client.MongoCollection;
import controllersMongo.OperadorBusquedaMongo;
import org.bson.Document;
import org.javatuples.Pair;

import java.util.LinkedList;

public class BusquedaMongo {

    /*String uri;
    MongoClient mongoClient;
    MongoClientURI clientURI;
    MongoCollection collection;
    MongoDatabase mongoDatabase;*/
    MongoCollection collection;


    public BusquedaMongo(MongoCollection collection) {
        this.collection = collection;

        ContenedorMongo resultado = new OperadorBusquedaMongo(collection).getBusqueda();

        this.ejecutarBusqueda(resultado);
    }

    public void ejecutarBusqueda(ContenedorMongo resultado) {
        //departamento con ventas mas altas
        Pair<String, Double> mayorVentasDepartamentoGlobal = CalculoBusquedas.mayorVentasxDepartamento(resultado.departamentos);
        //ciudad con ventas mas altas
        Pair<String, Double> mayorVentasCiudadGlobal = CalculoBusquedas.mayorVentasxCiudad(resultado.ciudades);
        //vendedor con ventas más altas
        Pair<String, Double> mayorVendedorGlobal = CalculoBusquedas.mayorVendedor(resultado.departamentos);
        //vendedor con ventas más bajas
        Pair<String, Double> menorVendedorGlobal = CalculoBusquedas.menorVendedor(resultado.departamentos);
        //Busqueda por departamentos
        LinkedList<DepartamentoM> busquedaDepartamento = CalculoBusquedas.busquedaxDepartamentos(resultado.departamentos);
    }
}
