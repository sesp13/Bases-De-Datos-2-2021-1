// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.8.0;


contract TiendaVannesaDaou {
    
    address payable public dueno;
    
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
        uint totalDeuda;
    }
    
    //Mapping para guardar los productos
    mapping (string => producto) public productos;
    
    //Mapping para guardar los compradores
    mapping (address => comprador) public compradores;
    
    //Mapping para conocer las cedulas ya ocupadas
    mapping (string => bool) private cedulasOcupadas;
    

    function registrarProducto(string memory nombre, uint unidades, uint precioUnitario, string memory descripcion) public 
        esDueno
    {
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
        compradores[msg.sender] = comprador(cedula, nombre, pais, 0, 0);
        
        //Agregar cedula a las ya usadas
        cedulasOcupadas[cedula] = true;
    }
    
    function comprar(string memory nombreProducto) public 
        noEsDueno
        comprobarExistenciaComprador
        deudaCero(msg.sender) 
        comprobarExistenciaProducto(nombreProducto)
        comprobarInventario(nombreProducto)
        comprobarPagoExacto(productos[nombreProducto].precioUnitario)
        payable
    {
        //Mirar si se require aplicar el descuento o no 
        
        //Modificar la siguiente linea una vez se implemente el descuento
    
        //Se guarda el valor en el contrato
        receiveDeposit();
        
        //Agregar valor de compra al comprador 
        compradores[msg.sender].totalComprado += msg.value;
        
        //Agregar valor de la compra al valor global de las compras
        
        //Se decrementan las unidades
        productos[nombreProducto].unidades = productos[nombreProducto].unidades - 1;
        
    }
    
    //Funcion para agregar el valor al contrato
    function receiveDeposit() payable public{
       
    }
    
    //Funcion para obtener el balance del contrato
    function obtenerBalanceContrato() public view returns(uint){
        return address(this).balance;
    }
    
    function comprarFiado(string memory nombreProducto) public 
        noEsDueno
        comprobarExistenciaComprador
        deudaCero(msg.sender) 
        comprobarExistenciaProducto(nombreProducto)
        comprobarInventario(nombreProducto)
    {
        //Mirar si se require aplicar el descuento o no 
        
        //Agregar valor de deuda al comprador
        compradores[msg.sender].totalDeuda = productos[nombreProducto].precioUnitario;
        
        //Agregar valor de la deuda a la parte global de las deudas
        
        //Decrementar las unidades del producto
        productos[nombreProducto].unidades = productos[nombreProducto].unidades - 1;
    }
    
    function pagarFiado() public
        noEsDueno
        comprobarExistenciaComprador
        comprobarPagoExacto(compradores[msg.sender].totalDeuda)
        payable
    {
        //Transferir valor al contrato
        receiveDeposit();
        
        //Hacer 0 la dueda del comprador 
        compradores[msg.sender].totalDeuda = 0;
        
        //Agregar el valor del pago al total comprado por el cliente 
        compradores[msg.sender].totalComprado += msg.value;
        
        // Manejo de la parte global
    }
    
    
    // -----------------------  Modifcadres ----------------------------
    modifier esDueno() {
        require(msg.sender == dueno, "Solo el dueno puede registrar productos");
        _; 
    }
    
    //Modificador para comprobar que la deuda sea 0
    modifier deudaCero(address cliente) {
        require(compradores[cliente].totalDeuda == 0, "El comprador tiene una deuda");
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
    
    //Comprueba que se pague el valor exacto indicado
    modifier comprobarPagoExacto(uint valor){
        require(msg.value == valor, "El valor enviado debe ser exacto al especificado");
        _;
    }
}