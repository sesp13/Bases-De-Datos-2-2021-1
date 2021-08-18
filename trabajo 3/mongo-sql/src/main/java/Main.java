import java.sql.*;

import classes.Inicio;
import classes.MongoConnection;
import classes.SqlGenerator;
import models.MongoClass;

public class Main {
    public static void main(String[] args) {

        MongoConnection connMongo = new MongoConnection();
        SqlGenerator generador = new SqlGenerator();

        var estadisticas = generador.generarEstadisticas();

        //Pasar estadisticas a mongo
        connMongo.guardarListadoMongoClass(estadisticas);

        // new Inicio();

        // connMongo.guardarDocumento();

    } // Fin del main
} // Fin de la clase
