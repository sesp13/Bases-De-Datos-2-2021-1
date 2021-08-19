

package controllersMongo;

import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoCollection;
import models.Ciudad;
import org.bson.Document;

import java.util.LinkedList;

public class MongoCiudad {
    MongoCollection collection;

    public MongoCiudad(MongoCollection collection) {
        this.collection = collection;
    }

    public LinkedList<Ciudad> getCiudades() {
        MongoCursor<Document> cursor = collection.find().iterator();

        try {
            while (cursor.hasNext()) {
                System.out.println(cursor.next().toJson());
                return null;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            cursor.close();
            return null;
        }
        return null;
    }
}