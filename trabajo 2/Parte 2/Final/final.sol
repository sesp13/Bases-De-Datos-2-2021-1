// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.8.0;


contract TiendaVannesaDaou {
    
    address payable public dueno;
    
    uint private deudaGlobal = 0;
    
    //Control de intentos de destruccion
    uint private intentosDestruccion = 0;
    
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
    
    //mapping para realizar consultas por pais
    mapping (string => uint) private paises;
    
    
    function registrarProducto(string memory nombre, uint unidades, uint precioUnitario, string memory descripcion) public 
        esDueno
    {
        //Verifica que el precioUnitario ingresado sea mayor a 0 y que no exista un nombre entre los productos (el valor por defecto es 0)
        require(productos[nombre].precioUnitario == 0, "Ya existe un producto registrado con ese nombre");
        require(precioUnitario > 0, "El precio unitario debe ser mayor a 0");
        //El usuario ingresa los precios en ether
        uint precioEther = precioUnitario * 1000000000000000000;
        productos[nombre] = producto(nombre, unidades, precioEther, descripcion);
    }
    
    function registrarComprador(string memory cedula, string  memory nombre, string  memory pais) public 
        noEsDueno 
    {
        //Asegurar que la cedula sea unica
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
        comprobarPagoExacto(calcularDescuento(msg.sender, nombreProducto))
        payable
    {
    
        //Se guarda el valor en el contrato
        receiveDeposit();
        
        //Agregar valor de compra al comprador 
        compradores[msg.sender].totalComprado += msg.value;
        
        //Agregar valor de la compra al valor global de las compras por pais
        paises[compradores[msg.sender].pais]+=msg.value;
        
        //Se decrementan las unidades
        productos[nombreProducto].unidades = productos[nombreProducto].unidades - 1;
        
    }
    
    function calcularDescuento(address cliente, string memory nombre) public view returns(uint)
    {
        uint precio=productos[nombre].precioUnitario;
        if (precio >= 3000000000000000000 && compradores[cliente].totalComprado > 50000000000000000000){
            precio-=3000000000000000000;
        }
        return precio;
    }
    
    //Funcion para agregar el valor al contrato
    function receiveDeposit() payable public{
       
    }

    function comprarFiado(string memory nombreProducto) public 
        noEsDueno
        comprobarExistenciaComprador
        deudaCero(msg.sender) 
        comprobarExistenciaProducto(nombreProducto)
        comprobarInventario(nombreProducto)
    {
        //Calcular precio con descuento
        uint precio = calcularDescuento(msg.sender, nombreProducto);
        
        //Agregar valor de deuda al comprador
        compradores[msg.sender].totalDeuda = precio;
        
        //Agregar valor de la deuda a la parte global de las deudas
        deudaGlobal+=precio;
        
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
        deudaGlobal-=msg.value;
        
        paises[compradores[msg.sender].pais]+=msg.value;
    }
    
    // ------------------------ GETTERS ----------------------
    
    //Funcion para obtener el balance del contrato
    function valorTotalCompras() esDueno public view returns(uint){
        return address(this).balance;
    }
    
    
    function valorComprasPorPais(string memory pais) esDueno public view returns(uint){
        return paises[pais];
    }
    
    
    function valorTotalDeudas() esDueno public view returns (uint){
        return deudaGlobal;
    }
    
    function obtenerIntentosDestruccion() 
        public
        esDueno()
        view
        returns(uint)
    {
        return intentosDestruccion;
    }
        
    //Destrucion del contrato
    function cerrarTienda() public 
    esDueno()
    payable 
    {
        if(intentosDestruccion < 2)
        {
            intentosDestruccion += 1;
        } 
        else 
        {
            //Destruir contrato y enviar fondos al dueno
            selfdestruct(dueno);
        }
    }
    
    
    // -----------------------  Modifcadres ----------------------------
    modifier esDueno() {
        require(msg.sender == dueno, "Solo el dueno puede realizar esta accion");
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