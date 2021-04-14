function getfilterstreamitem() {
  return {
    format: "json",
    keys: ["key 1"],
    data: {
      json: {
        telefono: 123123,
        nombre: "Pepito",
        gallo: "Pepito",
      },
    },
  };
}

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

function filterstreamitem() {
  var tipo = getstreaminfo();
  return tipo;
}

// multichain-cli empresa create streamfilter controlVendedores1 "{}"  "function filterstreamitem() {  var obj = getfilterstreamitem();  if (obj.format != \"json\") return \"Solo se admiten JSON\";  var json = obj.data.json;  if (obj.keys.length > 1) return \"El elemento debe tener una sola clave\";  if (!json.hasOwnProperty(\"nombre\"))    return \"El Json debe de tener el campo nombre\";  if (!json.hasOwnProperty(\"telefono\"))    return \"El Json debe de tener la propiedad telefono\"; if (Object.keys(json).length > 2){ return \"El Json solo puede tener nombre y telefono\";  }}"
