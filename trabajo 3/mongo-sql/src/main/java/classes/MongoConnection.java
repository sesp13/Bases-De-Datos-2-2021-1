package classes;

import org.bson.Document;
import org.bson.conversions.Bson;

import models.MongoClass;
import models.MongoVentas;

import java.util.LinkedList;

import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;

public class MongoConnection {
  String uri;

  MongoClient mongoClient;

  MongoClientURI clientURI;

  MongoCollection<Document> collection;

  MongoDatabase mongoDatabase;

  public MongoConnection() {
    // Local
    // this.uri =
    // "mongodb://localhost:27017/?readPreference=primary&appname=MongoDB%20Compass&directConnection=true&ssl=false";
    // Atlas recordar poner los parametros correctos
    this.uri = "mongodb+srv://<user>:<password>@myfirstcluster.8p9t6.mongodb.net/Bases2?retryWrites=true&w=majority";
    this.clientURI = new MongoClientURI(uri);
    this.mongoClient = new MongoClient(clientURI);
    this.mongoDatabase = mongoClient.getDatabase("Bases2");
    this.collection = mongoDatabase.getCollection("departamentos");
    System.out.println("conexion exitosa");
    // this.guardarMongo(document);
  }

  public void guardarDocumento() {
    var mongoClass = new MongoClass();
    mongoClass.nombreDepartamento = "Enviguetto";
    mongoClass.misventas = null;
    var document = new Document().append("nombreDepartamento", mongoClass.nombreDepartamento).append("ventas", null);
    this.collection.insertOne(document);
  }

  public void 
  guardarMongoClass(MongoClass mongoClass) {
    try {
      // Listado final
      LinkedList<Document> ciudades = new LinkedList<Document>();

      // Iterar sobre el arreglo de ventas
      for (MongoVentas ciudad : mongoClass.misventas) {
        var documento = new Document().append("nombre", ciudad.nombreCiudad)
            .append("mejorEmpleado", ciudad.mejorVendedor).append("total", ciudad.valorVentas);
        ciudades.add(documento);
      }

      Document departamento = new Document().append("nombreDepartamento", mongoClass.nombreDepartamento)
          .append("misventas", ciudades);
      // System.out.println(departamento);
      this.collection.insertOne(departamento);
    } catch (Exception e) {
      System.out.println(String.format("Error creando en mongo el departamento %s", mongoClass.nombreDepartamento));
    }
  }

  public void guardarListadoMongoClass(LinkedList<MongoClass> estadisticas) {
    if (estadisticas != null && estadisticas.size() > 0) {
      for (MongoClass departamento : estadisticas) {
        this.guardarMongoClass(departamento);
      }
    }
  }

}
