package Interfaz;

import ModelsM.DepartamentoM;
import controllersMongo.BusquedaMongo;
import controllersMongo.CalculoBusquedas;

import java.awt.BorderLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.math.BigDecimal;
import java.util.LinkedList;

import javax.swing.BorderFactory;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JLabel;


public class Visualizar implements ActionListener{

    private static JButton volver;
    private static JPanel panel;
    private static JFrame frame;


    public Visualizar(BusquedaMongo busqueda){

        panel = new JPanel();
        panel.setBorder(BorderFactory.createEmptyBorder(700,700,10,300));
        panel.setLayout(null);

        Integer alturaVariable=10;

        for (DepartamentoM  departamento: busqueda.busquedaDepartamento) {
            JLabel label = new JLabel(departamento.nombre+" |Ventas totales: "+new BigDecimal(departamento.ventas.doubleValue())+" |Ciudad con mas ventas: "+
                    departamento.ciudadMayorVentas.getValue0()+": ventas : "+new BigDecimal(departamento.ciudadMayorVentas.getValue1())+
                    " |Mayor vendedor cc: "+departamento.vendedorMayor.cc+": ventas : "+new BigDecimal(departamento.vendedorMayor.ventas.doubleValue())+
                    " |Menor vendedor cc: "+departamento.vendedorMenor.cc+": ventas : "+new BigDecimal(departamento.vendedorMenor.ventas.doubleValue())); // Creates the JLabel
            label.setName(departamento.nombre+"label"); // Sets the name
            label.setSize(1500,15); // Sets the size
            label.setLocation(20,alturaVariable); // Sets the location
            alturaVariable+=30;
            panel.add(label);
        }

        JLabel separador = new JLabel("-------------------Datos globales-------------------");
        separador.setSize(1500,15); // Sets the size
        separador.setLocation(20,alturaVariable); // Sets the location
        panel.add(separador);
        alturaVariable+=30;

        JLabel mayorDepartamengo = new JLabel("Departamento con mas ventas: "+busqueda.mayorVentasDepartamentoGlobal.getValue0()
                +" ventas : "+new BigDecimal(busqueda.mayorVentasDepartamentoGlobal.getValue1().intValue()));
        mayorDepartamengo.setSize(1500,15); // Sets the size
        mayorDepartamengo.setLocation(20,alturaVariable); // Sets the location
        panel.add(mayorDepartamengo);
        alturaVariable+=30;

        JLabel mayorCiudad = new JLabel("Ciudad con mas ventas: "+busqueda.mayorVentasCiudadGlobal.getValue0()
                +" ventas : "+new BigDecimal(busqueda.mayorVentasCiudadGlobal.getValue1()));
        mayorCiudad.setSize(1500,15); // Sets the size
        mayorCiudad.setLocation(20,alturaVariable); // Sets the location
        panel.add(mayorCiudad);
        alturaVariable+=30;

        JLabel mayorVendedor = new JLabel("Vendedor con mas ventas| cc: "+(busqueda.mayorVendedorGlobal.getValue0())
                +" ventas : "+ new BigDecimal(busqueda.mayorVendedorGlobal.getValue1()));
        mayorVendedor.setSize(1500,15); // Sets the size
        mayorVendedor.setLocation(20,alturaVariable); // Sets the location
        panel.add(mayorVendedor);
        alturaVariable+=30;

        JLabel menorVendedor = new JLabel("Vendedor con menos ventas:| cc: "+(busqueda.menorVendedorGlobal.getValue0())
                +" ventas : "+new BigDecimal(busqueda.menorVendedorGlobal.getValue1()));
        menorVendedor.setSize(1500,15); // Sets the size
        menorVendedor.setLocation(20,alturaVariable); // Sets the location
        panel.add(menorVendedor);

        volver = new JButton("<html><p style=\"text-align:center;\">Volver</p></html>");
        volver.addActionListener(this);
        volver.setBounds(1000,alturaVariable+40,110,35);
        panel.add(volver);

        frame = new JFrame();
        frame.add(panel, BorderLayout.CENTER);
        frame.setSize(1300,900);
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

