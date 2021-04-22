package javaapplication1;

import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

public class inicio implements ActionListener{
    
        private static JButton consultar;
        private static JButton registrarVendedor;
        private static JButton registrarGanancia;
        private static JPanel panel;
        private static JFrame frame;
        
    
    public inicio(){                
        
        consultar = new JButton("Consultar");
        consultar.addActionListener(this);
        consultar.setBounds(10,110,90,35);
        
        registrarVendedor = new JButton("<html>Registrar<br/>Vendedor</html>" );
        registrarVendedor.addActionListener(this);
        registrarVendedor.setBounds(120,110,90,35);
        
        registrarGanancia = new JButton("<html>Registrar<br/>Ganancia</html>");
        registrarGanancia.addActionListener(this);
        registrarGanancia.setBounds(230,110,90,35);
        
        panel = new JPanel();
        panel.setBorder(BorderFactory.createEmptyBorder(300,300,10,300));
        panel.setLayout(null);
        panel.add(consultar);
        panel.add(registrarVendedor);
        panel.add(registrarGanancia);
        
        frame = new JFrame();
        frame.add(panel, BorderLayout.CENTER);
        frame.setSize(350,350);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setTitle("Inicio");
        frame.setVisible(true);
    }
    @Override
    public void actionPerformed(ActionEvent e){
        frame.dispose();
        if(e.getSource()==consultar){
            consulta consulta = new consulta();
        }
        else if(e.getSource()==registrarVendedor){
            registroVendedor registroVendedor = new registroVendedor();
        }
        else if(e.getSource()==registrarGanancia){
            registroGanancia registroGanancia = new registroGanancia();
        }
    }
}
