package javaapplication1;

import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.util.LinkedList;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

public class consulta implements ActionListener{
    
        private static JPanel panel;
        private static JButton volver;
        private static JFrame frame;
        private static JLabel labelCedula;
        private static JLabel labelGananciaTotal;
        private static JList ganancia;
        private static JList cedula;
        String[] arrayCedulas;
        Double[] arrayGanancias;
        LinkedList<String> vendedores;
        public ApiMultichainBD2 usuario;
    
    public consulta(){                
     
        usuario = new ApiMultichainBD2("localhost", "4250", "multichainrpc","2Q3a6Mjnpq3oVAJdhuNde4AU9gL4qHcEecAcgmdCJNuW");

        vendedores = usuario.obtenerCedulasVendedores();
        arrayCedulas = new String[vendedores.size()];
        vendedores.toArray(arrayCedulas);
        
        arrayGanancias = new Double[vendedores.size()];
        
        for (int i = 0; i < vendedores.size(); i++){
            arrayGanancias[i]=usuario.obtenerGananciasPorVendedor(vendedores.get(i));
            if(arrayCedulas[i].equals("")){
                    arrayCedulas[i]="N/A";
        }
        }
        
        volver = new JButton("Volver");
        volver.addActionListener(this);
        volver.setBounds(230,110,90,25);
        
        labelCedula= new JLabel("Cédula"); 
        labelCedula.setBounds(10, 20, 80, 25);
        
        labelGananciaTotal= new JLabel("Ganancia total"); 
        labelGananciaTotal.setBounds(100,20,81,25);
        
        ganancia= new JList(arrayGanancias);
        ganancia.setBounds(100,50,80,arrayGanancias.length*18);        
        ganancia.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
        
        cedula= new JList(arrayCedulas);
        cedula.setBounds(10,50,80,arrayCedulas.length*18);        
        cedula.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
        
        panel = new JPanel();
        panel.setBorder(BorderFactory.createEmptyBorder(300,300,10,300));
        panel.setLayout(null);
        panel.add(volver);
        panel.add(labelCedula);
        panel.add(labelGananciaTotal);
        panel.add(cedula);
        panel.add(ganancia);
        
        frame = new JFrame();
        frame.add(panel, BorderLayout.CENTER);
        frame.setSize(350,200);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setTitle("Consulta");
        frame.setVisible(true);
    }
    @Override
    public void actionPerformed(ActionEvent e){
        frame.dispose();
        if(e.getSource()==volver){
            inicio inicio = new inicio();
        }
    }
}


