package javaapplication1;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;


import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.util.LinkedList;

public class registroGanancia implements ActionListener{
    
        private static JLabel labelCedula;
        private static JLabel labelGanancia;
        private static JTextField ganancia;
        private static JPanel panel;
        private static JButton ingresar;
        private static JButton volver;
        private static JFrame frame;
        private static JList cedula;
        String[] arrayCedulas;
        LinkedList<String> vendedores;
        
        public ApiMultichainBD2 usuario;
    
    public registroGanancia(){                
        
        usuario = new ApiMultichainBD2("localhost", "4250", "multichainrpc","2Q3a6Mjnpq3oVAJdhuNde4AU9gL4qHcEecAcgmdCJNuW");

        vendedores = usuario.obtenerCedulasVendedores();
        arrayCedulas = new String[vendedores.size()];
        vendedores.toArray(arrayCedulas);
        
        for (int i = 0; i < vendedores.size(); i++){
            if(arrayCedulas[i].equals("")){
                    arrayCedulas[i]="N/A";
        }
        }
        
        ingresar = new JButton("Ingresar");
        ingresar.addActionListener(this);
        ingresar.setBounds(10,70,90,25);
        
        volver = new JButton("Volver");
        volver.addActionListener(this);
        volver.setBounds(140,70,90,25);
        
        labelCedula= new JLabel("Cédula"); 
        labelCedula.setBounds(280, 20, 80, 25);
        
        labelGanancia= new JLabel("Ganancia"); 
        labelGanancia.setBounds(10,20,80,25);
        
        ganancia = new JTextField (20); 
        ganancia.setBounds(100,20,130,25);
        
        cedula= new JList(arrayCedulas);
        cedula.setBounds(350,10,80,arrayCedulas.length*18);        
        cedula.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
        
        panel = new JPanel();
        panel.setBorder(BorderFactory.createEmptyBorder(300,300,10,300));
        panel.setLayout(null);
        panel.add(labelCedula);
        panel.add(labelGanancia);
        panel.add(ganancia);
        panel.add(ingresar);
        panel.add(volver);
        panel.add(cedula);
        
        frame = new JFrame();
        frame.add(panel, BorderLayout.CENTER);
        frame.setSize(450,250);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setTitle("Registro Ganancia");
        frame.setVisible(true);
        
        
    }
    @Override
    public void actionPerformed(ActionEvent e){
        frame.dispose();
        if(e.getSource()==ingresar){
            if(!cedula.getSelectedValue().equals("N/A")){
                usuario.insertarGanancias(cedula.getSelectedValue().toString(), Integer.parseInt(ganancia.getText()));
            }
            else{
            usuario.insertarGanancias("", Integer.parseInt(ganancia.getText()));
            }
        }
        frame.dispose();
        inicio inicio = new inicio();
    }
    
    
}


