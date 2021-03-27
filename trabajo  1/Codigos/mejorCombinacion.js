function mejorCombinacion(numero, array) {
  let b = 2 * numero;
  let cols = [];

  for (let i = 0; i < array.length; i++) {
    let xi = array[i];
    for (let s = b - xi - 1; s >= 0; s--) {
      if (
        (cols[s + xi] == null || cols[s + xi] == undefined) &&
        cols[s] != null &&
        cols[s] != undefined
      ) {
        let cln = [cols[s]];
        cln.push(xi);
        cols[s + xi] = cln;
      }
    }
  }
  console.log(cols);
  for (let d = 0; d < numero; d++) {
    if (cols[numero - d] != null && cols[numero - d] != undefined) {
      return cols[numero - d];
    } else if (cols[numero + d] != null && cols[numero + d] != undefined) {
      return cols[numero + d];
    }
  }
  return cols[0];
}

console.log(mejorCombinacion(8, [2, 3, 5, 7]));
