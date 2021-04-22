// smart filter vendedores
function filterstreamitem() {
    var obj = getfilterstreamitem();
  
    if (obj.format != "json") return "Solo se admiten JSON";
  
    var json = obj.data.json;
    if (obj.keys.length > 1) return "El elemento debe tener una sola clave";
  
    if (!json.hasOwnProperty("nombre"))
      return "El Json debe de tener el campo nombre";
  
    if (!json.hasOwnProperty("telefono"))
      return "El Json debe de tener la propiedad telefono";
  
    if (Object.keys(json).length > 2) {
      return "El Json solo puede tener nombre y telefono";
    }
  }
  
  // smart filter ganancias
  function filterstreamitem() {
    var obj = getfilterstreamitem();
  
    if (obj.format != "json") return "Solo se admiten JSON";
  
    var json = obj.data.json;
    if (obj.keys.length > 1) return "El elemento debe tener una sola clave";
  
    if (!json.hasOwnProperty("valor"))
      return "El Json debe de tener el campo valor";
  
    if (Object.keys(json).length > 1) {
      return "El Json solo puede tener el campo valor";
    }
  }