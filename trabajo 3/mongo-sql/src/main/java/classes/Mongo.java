package classes;

import org.bson.Document;
import org.bson.conversions.Bson;

import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;

public class Mongo {
        String uri;

        MongoClient mongoClient;

        MongoClientURI clientURI;

        MongoCollection collection;

        MongoDatabase mongoDatabase;

        public Mongo(Document document){
                //Local
                this.uri = "mongodb://localhost:27017/?readPreference=primary&appname=MongoDB%20Compass&directConnection=true&ssl=false";
                //Atlas
                this.uri = "mongodb+srv://sesp:ptHa2PLMHQHjAQFG@myfirstcluster.8p9t6.mongodb.net/Bases2?retryWrites=true&w=majority";
                this.clientURI = new MongoClientURI(uri);
                this.mongoClient = new MongoClient(clientURI);
                this.mongoDatabase = mongoClient.getDatabase("learn");
                this.collection = mongoDatabase.getCollection("unicorns");
                System.out.println("conexion exitosa");
                this.guardarMongo(document);
        }

        public void guardarMongo (Document documento) {
                 this.collection.insertOne(documento);
        }
    }
