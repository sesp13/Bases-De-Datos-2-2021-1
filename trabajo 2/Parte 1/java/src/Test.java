import java.util.*;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import apiMultichain.ApiMultichainBD2;
import apiMultichain.ReturnFormat;
import multichain.command.*;
import multichain.object.*;

public class Test {
    public static void main(String[] args) {
        System.out.println("----------------------------------------");
        // Al instanciar la api debemos pasar los parametros para que funcione el comand
        // manager
        ApiMultichainBD2 api = new ApiMultichainBD2("localhost", "4250", "multichainrpc",
                "2Q3a6Mjnpq3oVAJdhuNde4AU9gL4qHcEecAcgmdCJNuW");

        // Insertar vendedor
        String nombre = "Andres";
        String telefono = "46464646";
        String cedula = "cedula1";

        ReturnFormat resultadoInsercionVendedor = api.InsertarVendedor(cedula, nombre, telefono);
        System.out.println(resultadoInsercionVendedor.mensaje);
        System.out.println(resultadoInsercionVendedor.esError);

        // komando para listar
        List<StreamKeyItem> items;
        try {
            // subscribirse
            api.commandManager.invoke(CommandElt.SUBSCRIBE, "vendedores");
            // Elementos de de key 1, esta consulta nos sirve para insertar
            items = (List<StreamKeyItem>) api.commandManager.invoke(CommandElt.LISTSTREAMKEYITEMS, "vendedores",
                    "cedula1");
            for (StreamKeyItem item : items) {
                System.out.println(item.getData());
                System.out.println("-----------");
            }
        } catch (MultichainException e) {
            e.printStackTrace();
        }

        // // Comando para insertar
        // List<String> lst;
        // try {
        // // Caso bueno
        // String prueba = "{\"json\":{\"nombre\":\"Carlos Antonio\", \"telefono\":
        // 99999}}";
        // // Caso malo
        // // String prueba = "{\"json\":{\"nombre\":\"Carlos Antonio\", \"telefono\":
        // 99999}}";
        // JsonObject jsonObject = new JsonParser().parse(prueba).getAsJsonObject();

        // String resultado = (String) api.commandManager.invoke(CommandElt.PUBLISH,
        // "vendedores", "key1", jsonObject);
        // System.out.println(resultado);
        // // for(String item : lst){
        // // System.out.println(item);
        // // System.out.println("-----------");
        // // }
        // } catch (MultichainException e){
        // e.printStackTrace();
        // // Imprimir razon del error
        // System.out.println(e.getReason());
    }

    // ApiMultichainBD2 api = new ApiMultichainBD2();
    // System.out.println("Vendedor");
    // System.out.println(api.convertirVendedor("Juan Carlos", "78999"));

    // System.out.println("Ganancia");
    // String ganancia = api.convertirGanancia(28);
    // api.InsertarGanancias("key1", ganancia);
    // api.ListarGanancias("key1");

}
