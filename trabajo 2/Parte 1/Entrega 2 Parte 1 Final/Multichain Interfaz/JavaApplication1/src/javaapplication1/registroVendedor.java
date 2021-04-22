package javaapplication1;

import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

public class registroVendedor implements ActionListener{
    
        private static JLabel labelNombre;
        private static JLabel labelCedula;
        private static JLabel labelTelefono;
        private static JTextField nombre;
        private static JTextField cedula;
        private static JTextField telefono;
        private static JPanel panel;
        private static JButton ingresar;
        private static JButton volver;
        private static JFrame frame;
        public ApiMultichainBD2 usuario;
    
    public registroVendedor(){                
        
        usuario = new ApiMultichainBD2("localhost","4372","multichainrpc","A9yLyfDvjdoCuUXUPKXMTtUVMsNqFamJej48yLLLDMGC");

        
        ingresar = new JButton("Ingresar");
        ingresar.addActionListener(this);
        ingresar.setBounds(10,110,90,25);
        
        volver = new JButton("Volver");
        volver.addActionListener(this);
        volver.setBounds(230,110,90,25);
        
        labelNombre = new JLabel("Nombre");
        labelNombre.setBounds(10, 20, 80, 25);
        
        nombre = new JTextField (20); 
        nombre.setBounds(100,20,130,25);
        
        labelCedula= new JLabel("Cédula"); 
        labelCedula.setBounds(10,50,80,25);
        
        cedula = new JTextField (20); 
        cedula.setBounds(100,50,130,25);
        
        labelTelefono= new JLabel("Teléfono"); 
        labelTelefono.setBounds(10,80,80,25);
        
        telefono = new JTextField (20); 
        telefono.setBounds(100,80,130,25);
        
        panel = new JPanel();
        panel.setBorder(BorderFactory.createEmptyBorder(300,300,10,300));
        panel.setLayout(null);
        panel.add(labelNombre);
        panel.add(labelCedula);
        panel.add(labelTelefono);
        panel.add(nombre);
        panel.add(cedula);
        panel.add(telefono);
        panel.add(ingresar);
        panel.add(volver);
        
        frame = new JFrame();
        frame.add(panel, BorderLayout.CENTER);
        frame.setSize(350,250);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setTitle("Registro Vendedor");
        frame.setVisible(true);
    }
    @Override
    public void actionPerformed(ActionEvent e){ 
        if(e.getSource()==ingresar){
           usuario.insertarVendedor(cedula.getText(), nombre.getText(), telefono.getText()); 
        }
        frame.dispose(); 
        inicio inicio = new inicio();
    }
}


