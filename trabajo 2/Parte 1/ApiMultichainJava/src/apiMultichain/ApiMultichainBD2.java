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
    public ApiMultichainBD2(String server, String port, String loginUser, String password) {
        this.commandManager = new CommandManager(server, port, loginUser, password);
    }

    public String convertirVendedor(String nombre, String telefono) {
        return String.format("{\"json\":{\"nombre\":\"%s\", \"telefono\": %s}}", nombre, telefono);
    }

    public String convertirGanancia(Number valor) {
        return String.format("{\"json\":{\"valor\": %s}}", valor);
    }

    /*
     * Funcion para insertar vendedor, requiere cedula, nombre y telefono Devuelve
     * un objeto de tipo ReturnFormat el cual tiene las propiedades mensaje y
     * esError
     */
    public ReturnFormat insertarVendedor(String cedula, String nombre, String telefono) {
        String mensaje;
        Boolean esError;
        String vendedor = this.convertirVendedor(nombre, telefono);
        try {
            JsonObject jsonObject = new JsonParser().parse(vendedor).getAsJsonObject();
            String resultado = (String) this.commandManager.invoke(CommandElt.PUBLISH, "vendedores", cedula,
                    jsonObject);
            mensaje = resultado;
            esError = false;
        } catch (MultichainException e) {
            mensaje = e.getReason();
            esError = true;
        }
        return new ReturnFormat(mensaje, esError);
    }

    /*
     * Funcion para insertar ganancia, requiere cedula, y el valor, este debe de ser
     * de tipo Number Devuelve un objeto de tipo ReturnFormat el cual tiene las
     * propiedades mensaje y esError
     */
    public ReturnFormat insertarGanancias(String cedula, Number valor) {
        String mensaje;
        Boolean esError;
        String ganancias = this.convertirGanancia(valor);
        try {
            JsonObject jsonObject = new JsonParser().parse(ganancias).getAsJsonObject();
            String resultado = (String) this.commandManager.invoke(CommandElt.PUBLISH, "ganancias", cedula, jsonObject);
            mensaje = resultado;
            esError = false;
        } catch (MultichainException e) {
            mensaje = e.getReason();
            esError = true;
        }
        return new ReturnFormat(mensaje, esError);
    }

    public LinkedList<String> obtenerCedulasVendedores() {
        LinkedList<String> resultado = new LinkedList<String>();

        try {
            List<StreamKey> items;
            // Subscribirse
            this.commandManager.invoke(CommandElt.SUBSCRIBE, "vendedores");
            items = (List<StreamKey>) this.commandManager.invoke(CommandElt.LISTSTREAMKEYS, "vendedores");
            for (StreamKey item : items) {
                resultado.add(item.getKey());
            }
        } catch (MultichainException e) {
        }

        return resultado;
    }

    /*
     * Devuelve una lista de vendedores que poseen el objeto Vendedor que tiene
     * nombre, telefono y ganancias asociadas
     */
    public LinkedList<Vendedor> obtenerVendedores() {
        LinkedList<Vendedor> resultado = new LinkedList<Vendedor>();
        try {
            // subscribirse
            this.commandManager.invoke(CommandElt.SUBSCRIBE, "vendedores");

            // Obtener cedulas
            LinkedList<String> cedulas = this.obtenerCedulasVendedores();

            // Recorrer cedulas
            for (String cedula : cedulas) {
                List<StreamKeyItem> items;
                items = (List<StreamKeyItem>) this.commandManager.invoke(CommandElt.LISTSTREAMKEYITEMS, "vendedores",
                        cedula);
                // Recorrer vendedores
                for (StreamKeyItem item : items) {
                    // System.out.println(item.getData());
                    String json = item.getData().toString();
                    json = parsearStringConEspacios(json);
                    // System.out.println(json);
                    JsonObject jsonObject = new JsonParser().parse(json).getAsJsonObject();
                    if(jsonObject.has("json")){
                        jsonObject = jsonObject.get("json").getAsJsonObject();
                        String nombre = jsonObject.has("nombre") ? jsonObject.get("nombre").toString() : "";
                        String telefono = jsonObject.has("telefono") ? jsonObject.get("telefono").toString() : "";
                        Double ganancia = this.obtenerGananciasPorVendedor(cedula);
                        // Agregar vendedor
                        resultado.add(new Vendedor(nombre, telefono, ganancia));
                    }
                }
            }

        } catch (MultichainException e) {
            e.printStackTrace();
        }

        return resultado;
    }

    /*
     * Devuelve una lista de el objeto Ganancia que tiene vendedor y valor Para
     * todas las ganancias de un vendedor especificado
     */
    public LinkedList<Ganancia> obtenerListaGananciasPorVendedor(String cedulaVendedor) {
        LinkedList<Ganancia> resultado = new LinkedList<Ganancia>();
        try {
            // subscribirse
            this.commandManager.invoke(CommandElt.SUBSCRIBE, "ganancias");
            // Listar ganancias
            List<StreamKeyItem> items;
            items = (List<StreamKeyItem>) this.commandManager.invoke(CommandElt.LISTSTREAMKEYITEMS, "ganancias",
                    cedulaVendedor);
            // Recorrer ganancias
            for (StreamKeyItem item : items) {
                String json = item.getData().toString();
                JsonObject jsonObject = new JsonParser().parse(json).getAsJsonObject();
                Double valor = Double.parseDouble(jsonObject.get("json").getAsJsonObject().get("valor").getAsString());
                // Agregar valor encontrado
                resultado.add(new Ganancia(cedulaVendedor, valor));
            }
        } catch (MultichainException e) {
            e.printStackTrace();
        }

        return resultado;
    }

    /*
     * Devuelve la cantidad de ganancias que tiene un vendedor
     */
    public Double obtenerGananciasPorVendedor(String cedulaVendedor) {
        Double ganancia = 0.0;
        try {
            // subscribirse
            this.commandManager.invoke(CommandElt.SUBSCRIBE, "ganancias");
            // Listar ganancias
            List<StreamKeyItem> items;
            items = (List<StreamKeyItem>) this.commandManager.invoke(CommandElt.LISTSTREAMKEYITEMS, "ganancias",
                    cedulaVendedor);
            // Recorrer ganancias
            for (StreamKeyItem item : items) {
                String json = item.getData().toString();
                JsonObject jsonObject = new JsonParser().parse(json).getAsJsonObject();
                Double valor = Double.parseDouble(jsonObject.get("json").getAsJsonObject().get("valor").getAsString());
                // Agregar valor encontrado
                ganancia = ganancia + valor;
            }
        } catch (MultichainException e) {
            e.printStackTrace();
        }

        return ganancia;
    }

    // ----------------------- Métodos para ver cosas por consola
    public void listarVendedoresConsola(String cedula) {
        List<StreamKeyItem> items;
        try {
            // subscribirse
            this.commandManager.invoke(CommandElt.SUBSCRIBE, "vendedores");
            // Elementos de de key 1, esta consulta nos sirve para insertar
            items = (List<StreamKeyItem>) this.commandManager.invoke(CommandElt.LISTSTREAMKEYITEMS, "vendedores",
                    cedula);
            for (StreamKeyItem item : items) {
                System.out.println(item.getData());
                System.out.println("-----------");
            }
        } catch (MultichainException e) {
            e.printStackTrace();
        }
    }

    public void listarGananciasConsola(String cedula) {
        List<StreamKeyItem> items;
        try {
            // subscribirse
            this.commandManager.invoke(CommandElt.SUBSCRIBE, "ganancias");
            // Elementos de de key 1 (cedula), esta consulta nos sirve para insertar
            items = (List<StreamKeyItem>) this.commandManager.invoke(CommandElt.LISTSTREAMKEYITEMS, "ganancias",
                    cedula);
            for (StreamKeyItem item : items) {
                System.out.println(item.getData());
                System.out.println("-----------");
            }
        } catch (MultichainException e) {
            e.printStackTrace();
        }
    }

    // Utilidades
    public String parsearStringConEspacios(String string){
        String[] lista = string.split(", ");
        String resultado = "";
        int index = 0;
        for(String element : lista){
            String[] lista2  = element.split(" ");
            for(String element2: lista2){
                resultado = resultado + element2;
            }
            if(index != lista.length - 1){
                resultado = resultado + ", ";
            }
            index++;
        }

        lista = resultado.split("=,");
        // System.out.println(resultado);
        resultado = "";
        index = 0;
        for(String element : lista){
            resultado = resultado + element;
            if(index != lista.length - 1){
                resultado = resultado + "=\"\",";
            }
            index++;
        }
        return resultado;
    }

}
