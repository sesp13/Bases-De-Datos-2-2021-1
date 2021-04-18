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

        // ---------------- Insertar vendedor -------------------------------------
        // String nombre = "Uriel";
        // String telefono = "46464646";
        String cedula = "cedula1";

        // ReturnFormat resultadoInsercionVendedor = api.InsertarVendedor(cedula, nombre, telefono);
        // System.out.println(resultadoInsercionVendedor.mensaje);
        // System.out.println(resultadoInsercionVendedor.esError);
        // // komando para listar vendedores
        api.ListarVendedoresConsola(cedula);

        // Insertar ganancias
        // String cedula = "cedula1";
        // Number valor = 780;
        // ReturnFormat resultadoInsercionGanancia = api.InsertarGanancias(cedula, valor);
        // System.out.println(resultadoInsercionGanancia.mensaje);
        // System.out.println(resultadoInsercionGanancia.esError);
        api.ListarGananciasConsola(cedula);

        // Obtener cédulas de vendedores
        System.out.println(api.obtenerCedulasVendedores());
        
        // Otras pruebas, no descomentar
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

}
