package models;

import org.bson.Document;

import java.util.LinkedList;

public class MongoClass {

    public String nombreDepartamento;
    public LinkedList<MongoVentas> misventas;


    public static Document convertir(MongoClass mongoClass){
        Document aaa = new Document("nombre ciudad", mongoClass.misventas.getFirst().nombreCiudad).append("valor ventas ciudad", mongoClass.misventas.getFirst().valorVentas)
                .append(mongoClass.misventas.getFirst().mejorVendedor,mongoClass.misventas.pop().mejorVendedor);

        Document document = new Document("nombre departamento",mongoClass.nombreDepartamento).append("mis ventas",aaa);

        return  document;
    }



}
