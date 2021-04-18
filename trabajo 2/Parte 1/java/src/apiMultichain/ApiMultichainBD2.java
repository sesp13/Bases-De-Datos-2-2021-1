package apiMultichain;

import java.util.*;
import multichain.command.*;
import multichain.object.*;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

public class ApiMultichainBD2 {

    public CommandManager commandManager;

    // Constructor
    public ApiMultichainBD2(String server, String port, String loginUser, String password){
        this.commandManager = new CommandManager(
            server,
            port,
            loginUser,
            password
        );
    }

    public String convertirVendedor(String nombre, String telefono) {
        return String.format("{\"json\":{\"nombre\":\"%s\", \"telefono\": %s}}", nombre, telefono);
    }

    public String convertirGanancia(Number valor) {
        return String.format("{\"json\":{\"valor\": %s}}", valor);
    }

    /*
        Funcion para insertar vendedor, requiere cedula, nombre y telefono
        Devuelve un objeto de tipo ReturnFormat el cual tiene las propiedades mensaje y esError
    */
    public ReturnFormat InsertarVendedor(String cedula, String nombre, String telefono){
        String mensaje;
        Boolean esError;
        String vendedor = this.convertirVendedor(nombre, telefono);
        try {
            JsonObject jsonObject = new JsonParser().parse(vendedor).getAsJsonObject();
            String resultado = (String) this.commandManager.invoke(CommandElt.PUBLISH, "vendedores", cedula, jsonObject);
            mensaje = resultado;
            esError = false;
        } catch (MultichainException e) {
            mensaje = e.getReason();
            esError = true;
        }
        return new ReturnFormat(mensaje, esError);
    }

    public void InsertarGanancias(String key, String ganancias) {
        // Comando para insertar
        try {
            JsonObject jsonObject = new JsonParser().parse(ganancias).getAsJsonObject();

            String resultado = (String) this.commandManager.invoke(CommandElt.PUBLISH, "ganancias", key, jsonObject);
            System.out.println(resultado);
        } catch (MultichainException e) {
            // e.printStackTrace();
            // Imprimir razon del error
            System.out.println(e.getReason());
        }
    }

    public void ListarGanancias(String key){
        List<StreamKeyItem> items;
        try {
            //subscribirse
            this.commandManager.invoke(CommandElt.SUBSCRIBE, "ganancias");
            //Elementos de de key 1, esta consulta nos sirve para insertar
            items = (List<StreamKeyItem>) this.commandManager.invoke(CommandElt.LISTSTREAMKEYITEMS, "ganancias", key);
            for (StreamKeyItem item : items) {
                System.out.println(item.getData());
                System.out.println("-----------");
            }
        } catch (MultichainException e) {
            e.printStackTrace();
        }
    }
}
