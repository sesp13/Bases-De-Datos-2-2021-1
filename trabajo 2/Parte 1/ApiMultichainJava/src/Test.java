import java.util.*;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import apiMultichain.ApiMultichainBD2;
import apiMultichain.Ganancia;
import apiMultichain.ReturnFormat;
import apiMultichain.Vendedor;
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
        // String nombre = "Juliana Dominguez";
        // String telefono = "346464646";
        // String cedula = "cedula2";

        // ReturnFormat resultadoInsercionVendedor = api.insertarVendedor(cedula, nombre, telefono);
        // System.out.println(resultadoInsercionVendedor.mensaje);
        // System.out.println(resultadoInsercionVendedor.esError);
        // // komando para listar vendedores
        // System.out.println("------------------------ Listado por consola de vendedores --------------------------------");
        // api.listarVendedoresConsola("cedula2");
        
        // Insertar ganancias
        // String cedula = "cedula1";
        // Number valor = 780;
        // ReturnFormat resultadoInsercionGanancia = api.insertarGanancias(cedula, valor);
        // System.out.println(resultadoInsercionGanancia.mensaje);
        // System.out.println(resultadoInsercionGanancia.esError);
        // System.out.println("------------------------ Listado por consola de ganancias --------------------------------");
        // api.listarGananciasConsola(cedula);
        
        // Obtener cédulas de vendedores
        System.out.println("------------------------ Listado de cédulas de vendedores --------------------------------");
        System.out.println(api.obtenerCedulasVendedores());
        
        //Obtener ganancias de un vendedor
        System.out.println("------------------------ Listado de ganancias de un vendedor, lista de objeto ganancia --------------------------------");
        String cedulaVendedor = "key1";
        LinkedList<Ganancia> gananciasVendedores = api.obtenerListaGananciasPorVendedor(cedulaVendedor);
        System.out.println(String.format("Ganancias del vendedor: %s", cedulaVendedor));
        for(Ganancia ganancia : gananciasVendedores){
            System.out.println(String.format("Vendedor: %s Ganancia: %s", ganancia.vendedor, ganancia.valor));
        }
        
        //Obtener vendedores
        System.out.println("------------------------ Listado de vendedores con sus ganancias --------------------------------");
        LinkedList<Vendedor> vendedores = api.obtenerVendedores();
        for(Vendedor vendedor : vendedores){
            System.out.println(String.format("Vendedor: %s Telefono: %s Ganancia: %s", vendedor.nombre, vendedor.telefono, vendedor.ganancias));
        }

    }

}
