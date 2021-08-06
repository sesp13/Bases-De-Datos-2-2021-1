// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.8.0;


contract TiendaVannesaDaou {
    
    address public dueno;
    
    constructor() {
        dueno = msg.sender;
    }
    
    struct producto {
        string nombre;
        uint unidades;
        uint precioUnitario;
        string descripcion;
    }    
    
    struct comprador {
        string codigo;
        string nombre;
        string pais;
        uint totalComprado;
    }
    
    //Mapping para guardar los productos
    mapping (string => producto) public productos;
    
    //Mapping para guardar los compradores
    mapping (address => comprador) public compradores;
    
    //Mapping para conocer las cedulas ya ocupadas
    mapping (string => bool) private cedulasOcupadas;
    
    //Mapping de deudas
    mapping (address => uint) public deudas;

    function registrarProducto(string memory nombre, uint unidades, uint precioUnitario, string memory descripcion) public esDueno{
        //Verifica que el precioUnitario ingresado sea mayor a 0 y que no exista un nombre entre los productos (el valor por defecto es 0)
        require(productos[nombre].precioUnitario == 0, "Ya existe un producto registrado con ese nombre");
        require(precioUnitario > 0, "El precio unitario debe ser mayor a 0");
        productos[nombre] = producto(nombre, unidades, precioUnitario, descripcion);
    }
    
    function registrarComprador(string memory cedula, string  memory nombre, string  memory pais) public 
        noEsDueno 
    {
        //Asegurar que la cedula sea única
        require(cedulasOcupadas[cedula] != true, "Ya existe un comprador registrado con esta cedula");
        
        // Asegurar que la direccion no sea usada para crear diversos clientes
        require(bytes(compradores[msg.sender].codigo).length == 0, "Esta direccion ya fue ocupada");
        
        //Agregar comprador 
        compradores[msg.sender] = comprador(cedula, nombre, pais, 0);
        
        //Agregar cedula a las ya usadas
        cedulasOcupadas[cedula] = true;
    }
    
    function comprarFiado(string memory nombreProducto) public 
        noEsDueno
        comprobarExistenciaComprador
        deudaCero(msg.sender) 
        comprobarExistenciaProducto(nombreProducto)
        comprobarInventario(nombreProducto)
    {
        //Mirar si se require aplicar el descuento o no 
        deudas[msg.sender] = productos[nombreProducto].precioUnitario;
        productos[nombreProducto].unidades = productos[nombreProducto].unidades - 1;
    }
    
    
    // -----------------------  Modifcadres ----------------------------
    modifier esDueno() {
        require(msg.sender == dueno, "Solo el dueno puede registrar productos");
        _; 
    }
    
    //Modificador para comprobar que la deuda sea 0
    modifier deudaCero(address cliente) {
        require(deudas[cliente]==0, "El comprador tiene una deuda");
        _; 
    }
    
    modifier noEsDueno(){
        require(msg.sender != dueno, "El dueno no puede realizar esta operacion");
        _; 
    }
    
    //Comprueba que el producto tenga existencias
    modifier comprobarInventario(string memory nombreProducto){
        require(productos[nombreProducto].unidades > 0, "No quedan unidades del producto");
        _;
    }
    
    //Comprueba que un producto exista
    modifier comprobarExistenciaProducto(string memory nombreProducto){
        require(productos[nombreProducto].precioUnitario != 0, "No existe el producto");
        _;
    }
    
    //Comprueba que un comprador exista
    modifier comprobarExistenciaComprador(){
        require(bytes(compradores[msg.sender].codigo).length != 0, "El comprador no existe y debe de registrarse");
        _;
    }
}