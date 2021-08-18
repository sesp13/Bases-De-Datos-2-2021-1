package classes;

import java.awt.BorderLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.BorderFactory;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;

public class Visualizar implements ActionListener{

    private static JButton volver;
    private static JPanel panel;
    private static JFrame frame;


    public Visualizar(){

        volver = new JButton("<html><p style=\"text-align:center;\">Volver</p></html>");
        volver.addActionListener(this);
        volver.setBounds(270,50,110,35);

        panel = new JPanel();
        panel.setBorder(BorderFactory.createEmptyBorder(300,300,10,300));
        panel.setLayout(null);
        panel.add(volver);

        frame = new JFrame();
        frame.add(panel, BorderLayout.CENTER);
        frame.setSize(410,180);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setTitle("Visualizar estadisticas");
        frame.setVisible(true);
    }
    @Override
    public void actionPerformed(ActionEvent e){
        frame.dispose();
        if(e.getSource()==volver){
            Inicio inicio = new Inicio();
        }
    }
}

