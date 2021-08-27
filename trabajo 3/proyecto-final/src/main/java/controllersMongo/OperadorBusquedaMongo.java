

package controllersMongo;

import java.text.NumberFormat;
import java.util.*;

import ModelsM.*;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoCollection;
import com.sun.jdi.IntegerValue;
import org.bson.Document;

import java.util.LinkedList;
import org.json.JSONObject;
import org.json.JSONArray;

public class OperadorBusquedaMongo {
    MongoCollection collection;

    public OperadorBusquedaMongo(MongoCollection collection) {
        this.collection = collection;
    }

    public ContenedorMongo getBusqueda() {
        MongoCursor<Document> cursor = collection.find().iterator();
        ContenedorMongo resultado;
        try {
            LinkedList<DepartamentoM> listaDepartamentos = new LinkedList<DepartamentoM>();
            //par de nombre, valor que representará las ciudades y su valor total
            HashMap<String, Double> listaCiudades = new HashMap<String, Double>();
            Double ventasTotales=0.0;
            //se itera sobre departamentos
            while (cursor.hasNext()) {
                Double totalVentasxDepartamento = 0.0;
                List<Number> vendedorMayor = Arrays.asList(0,0);
                //Se inicializa de esta forma para el manejo de menores vendedores diferentes de 0
                List<Number> vendedorMenor = Arrays.asList(0,Double.POSITIVE_INFINITY);
                HashMap<String, Double> listaCiudadesxDepartamento = new HashMap<String, Double>();

                JSONObject json = new JSONObject(cursor.next().toJson());

                String nombreDepartamento = json.getString("nombreDepartamento");

                JSONArray ventas= json.getJSONArray("misventas");
                int len = ventas.length();

                //se itera sobre las ventas
                for(int j=0; j<len; j++) {
                    String mejorEmpleado="null, 0";

                    JSONObject datos = ventas.getJSONObject(j);
                    String nombreciudad = (datos.getString("nombre"));

                    if (!Objects.equals(datos.getString("mejorEmpleado"), "null")){
                        mejorEmpleado = (datos.getString("mejorEmpleado"));
                    }
                    else {
                        mejorEmpleado = "null, 0";
                    }

                    //en un lado queda cc:xxx en el otro total: xxx
                    String[] parts = mejorEmpleado.split(",");
                    //Se hace para el manejo de nulos, se reserva la cc 9999999
                    if (parts[0].equals("null")){
                        parts[0]="cc: 0";
                    }

                    Number cc = Integer.parseInt(parts[0].replaceAll("[^0-9]", ""));
                    Number ventasEmpleado = Double.parseDouble(parts[1].replaceAll("[^0-9.]", ""));

                    //se verifica si se hayó un nuevo máximo en la ciudad y se actualiza en tal caso
                    if (vendedorMayor.get(1).doubleValue() <= ventasEmpleado.doubleValue()){
                        vendedorMayor.set(0,cc);
                        vendedorMayor.set(1,ventasEmpleado);
                    };



                    //se verifica si se hayó un nuevo mínimo en la ciudad y se actualiza en tal caso
                    if (vendedorMenor.get(1).doubleValue() >= ventasEmpleado.doubleValue() && ventasEmpleado.doubleValue() >0){
                        vendedorMenor.set(0,cc);
                        vendedorMenor.set(1,ventasEmpleado);
                    };



                    Double total = (datos.getDouble("total"));

                    //se verifica que la ciudad no esté en la lista de ciudades total
                    if (!listaCiudades.containsKey(nombreciudad)){
                        listaCiudades.put(nombreciudad,total);
                    }else {
                        listaCiudades.put(nombreciudad,listaCiudades.get(nombreciudad)+total);
                    }

                    //se hace lo mismo con las ciudadesxDepartamento
                    if (!listaCiudadesxDepartamento.containsKey(nombreciudad)){
                        listaCiudadesxDepartamento.put(nombreciudad,total);
                    }else {
                        listaCiudadesxDepartamento.put(nombreciudad,listaCiudadesxDepartamento.get(nombreciudad)+total);
                    }

                    ventasTotales= ventasTotales+total;
                    totalVentasxDepartamento = totalVentasxDepartamento + total;
                }

                //Se cambia justo antes de añadir el vendedor menor
                if (vendedorMenor.get(1).equals(Double.POSITIVE_INFINITY)){
                    vendedorMenor.set(1, 0.0);
                }

                listaDepartamentos.add(new DepartamentoM(nombreDepartamento,listaCiudadesxDepartamento,new EmpleadoM(vendedorMayor.get(0),vendedorMayor.get(1)),
                        new EmpleadoM(vendedorMenor.get(0),vendedorMenor.get(1)),totalVentasxDepartamento));
            }
            resultado=new ContenedorMongo(listaDepartamentos, listaCiudades, ventasTotales);
        } catch (Exception e) {
            System.out.println(e.getMessage());
            System.out.println("AAAAQQQQ");
            cursor.close();
            return null;
        }
        return resultado;
    }
}