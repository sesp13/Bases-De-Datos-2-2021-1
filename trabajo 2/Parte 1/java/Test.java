import java.util.*;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import multichain.command.*;
import multichain.object.*;
public class Test {
    public static void main(String[] args) {
        CommandManager commandManager = new CommandManager(
                "localhost",
                "4250",
                "multichainrpc",
                "2Q3a6Mjnpq3oVAJdhuNde4AU9gL4qHcEecAcgmdCJNuW"
        );

        // Comando para insertar
        List<String> lst;
        try {
            // Caso bueno
            String prueba = "{\"json\":{\"nombre\":\"Carlos Antonio\", \"telefono\": 99999}}";
            // Caso malo
            // String prueba = "{\"json\":{\"nombre\":\"Carlos Antonio\", \"telefono\": 99999}}";
            JsonObject jsonObject = new JsonParser().parse(prueba).getAsJsonObject();
            
            String resultado = (String) commandManager.invoke(CommandElt.PUBLISH, "vendedores", "key1", jsonObject);
            System.out.println(resultado);
            // for(String item : lst){
            //     System.out.println(item);
            //     System.out.println("-----------");
            // }
        } catch (MultichainException e){
            e.printStackTrace();
            // Imprimir razon del error
            System.out.println(e.getReason());
        }

        // komando para listar
        List<StreamKeyItem> items;
        try {
            //subscribirse
            commandManager.invoke(CommandElt.SUBSCRIBE, "vendedores");
            //Elementos de de key 1, esta consulta nos sirve para insertar
            items = (List<StreamKeyItem>)commandManager.invoke(CommandElt.LISTSTREAMKEYITEMS, "vendedores", "key1");
            for (StreamKeyItem item : items) {
                System.out.println(item.getData());
                System.out.println("-----------");
            }
        } catch (MultichainException e) {
            e.printStackTrace();
        }
        
    }
}