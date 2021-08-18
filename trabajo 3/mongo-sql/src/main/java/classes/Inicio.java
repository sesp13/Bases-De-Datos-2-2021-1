package classes;

import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

public class Inicio implements ActionListener{

    private static JButton generar;
    private static JButton visualizar;
    private static JButton vaciar;
    private static JPanel panel;
    private static JFrame frame;


    public Inicio(){

        generar = new JButton("<html><p style=\\\"text-align:center;\\\">Generar<br/>estadisticas</p></html>");
        generar.addActionListener(this);
        generar.setBounds(10,50,110,35);

        visualizar = new JButton("<html><p style=\\\"text-align:center;\\\">Visualizar<br/>estadisticas</p></html>" );
        visualizar.addActionListener(this);
        visualizar.setBounds(140,50,110,35);

        vaciar = new JButton("<html><p style=\"text-align:center;\">Vaciar<br/>arreglos</p></html>");
        vaciar.addActionListener(this);
        vaciar.setBounds(270,50,110,35);

        panel = new JPanel();
        panel.setBorder(BorderFactory.createEmptyBorder(300,300,10,300));
        panel.setLayout(null);
        panel.add(generar);
        panel.add(visualizar);
        panel.add(vaciar);

        frame = new JFrame();
        frame.add(panel, BorderLayout.CENTER);
        frame.setSize(410,180);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setTitle("Inicio");
        frame.setVisible(true);
    }
    @Override
    public void actionPerformed(ActionEvent e){
        frame.dispose();
        if(e.getSource()==generar){
            //Generar
        }
        else if(e.getSource()==visualizar){
            Visualizar Visualizar = new Visualizar();
        }
        else if(e.getSource()==vaciar){
            //registroGanancia registroGanancia = new registroGanancia();//Vaciar
        }
    }
}
