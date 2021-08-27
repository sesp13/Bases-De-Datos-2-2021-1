package controllersMongo;

import ModelsM.DepartamentoM;
import models.MongoClass;
import org.bson.io.BsonOutput;
import org.javatuples.Pair;

import java.security.Key;
import java.util.Arrays;
import java.util.*;
import java.util.LinkedList;
import java.util.List;

public class CalculoBusquedas {
    public static Pair<String, Double> mayorVentasxDepartamento(LinkedList<DepartamentoM> departamentos) {

        HashMap<String, Double> mapaDepartamentos = new HashMap<String, Double>();

        //System.out.println(departamentos.size());

        for (DepartamentoM item : departamentos) {
            mapaDepartamentos.put(item.nombre, item.ventas.doubleValue());
        }

        //retorna la clave del valor maximo
        Map.Entry<String , Double> maxEntry = null;

        for (Map.Entry<String, Double> entry : mapaDepartamentos.entrySet())
        {
            if (maxEntry == null || entry.getValue().compareTo(maxEntry.getValue()) > 0)
            {
                maxEntry = entry;
            }
        }

        Pair<String, Double> resultado = Pair.with(maxEntry.getKey(), maxEntry.getValue());
        /*
        System.out.println("Global");
        System.out.println("Departamento con mas ventas:");
        System.out.println(resultado.getValue0()+" <> "+resultado.getValue1());
        System.out.println("");
        */
        return resultado;
    }

    public static Pair<String, Double> mayorVentasxCiudad(HashMap<String, Double> ciudades) {

        Pair<String, Double> resultado;

        if (ciudades.size()>0) {
            Object nombre = Collections.max(ciudades.entrySet(), Map.Entry.comparingByValue()).getKey();

            resultado = Pair.with(nombre.toString(), ciudades.get(nombre));
        }
        else{
            resultado = Pair.with("El departamento no tiene ciudades inscritas",0.0);
        }
        /*
        System.out.println("ciudad con más ventas");
        System.out.println(resultado.getValue0()+" <> "+resultado.getValue1());
        System.out.println("");
        */
        return resultado;
    }

    public static Pair<String, Double> mayorVendedor(LinkedList<DepartamentoM> departamentos) {

        HashMap<Double, Double> mapaVendedores = new HashMap<Double, Double>();

        Pair<String, Double> resultado;

        for (DepartamentoM item : departamentos) {
            mapaVendedores.put(item.vendedorMayor.cc.doubleValue(), item.vendedorMayor.ventas.doubleValue());
        }

        //retorna la clave del valor maximo
        if (mapaVendedores.size()>0) {
            Object cc = Collections.max(mapaVendedores.entrySet(), Map.Entry.comparingByValue()).getKey();

            resultado = Pair.with(cc.toString(), mapaVendedores.get(cc));        }
        else{
            resultado = Pair.with("El departamento no tiene ventas",0.0);
        }
        /*
        System.out.println("vendedor con mas ventas:");
        System.out.println(resultado.getValue0()+" <> "+resultado.getValue1());
        System.out.println("");
        */
        return resultado;
    }

    public static Pair<String, Double> menorVendedor(LinkedList<DepartamentoM> departamentos) {

        HashMap<Double, Double> mapaVendedores = new HashMap<Double, Double>();

        Pair<String, Double> resultado;

        for (DepartamentoM item : departamentos) {
            //Para no mostrar los casos de ciudades sin vendedores
            if(item.vendedorMenor.ventas.doubleValue()>0) {
                mapaVendedores.put(item.vendedorMenor.cc.doubleValue(), item.vendedorMenor.ventas.doubleValue());
            }
        }
        //retorna la clave del valor minimo
        if (mapaVendedores.size()>0) {
            Object cc = Collections.min(mapaVendedores.entrySet(), Map.Entry.comparingByValue()).getKey();
            resultado = Pair.with(cc.toString(), mapaVendedores.get(cc));        }
        else{
            resultado = Pair.with("El departamento no tiene ventas",0.0);
        }

        /*
        System.out.println("Vendedor con menos ventas:");
        System.out.println(resultado.getValue0()+" <> "+resultado.getValue1());
        System.out.println("");
        */
        return resultado;
    }

    public static LinkedList<DepartamentoM> busquedaxDepartamentos (LinkedList<DepartamentoM> departamentos) {

        for (DepartamentoM item : departamentos) {
            item.ciudadMayorVentas=mayorVentasxCiudad(item.listaCiudades);
        }

        //System.out.println("Datos por departamento");

        /*
        for (DepartamentoM item : departamentos) {
            System.out.println(item.nombre);
            System.out.println(item.ciudadMayorVentas.getValue0());
            System.out.println(item.ciudadMayorVentas.getValue1());
            System.out.println(item.ventas);
        }*/

        return departamentos;
    }

}
