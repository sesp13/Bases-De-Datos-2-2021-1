function mejorCombinacion(value, xs) {
  b = 2 * value;
  cols = [];
  for (i = 0; i < b; i++) {
    cols[i] = null;
  }
  cols[0] = [];
  xs.forEach((xi) => {
    for (s = b - xi - 1; s >= 0; s--) {
      if (cols[s + xi] == null && cols[s] != null) {
        let cln = [cols[s]];
        cln.push(xi);
        cols[s + xi] = cln;
      }
    }
  });
  var returned = null;
  for (let d = 0; d < value + 1; d++) {
    if (cols[value - d] != null) {
      returned = cols[value - d];
      // console.log("fIST: ", returned);
      break;
    } else if (cols[value + d] != null) {
      returned = cols[value + d];
      // console.log("sECOND: ",returned);
      break;
    }
  }
  // console.log(returned);
  if (returned == null) {
    returned = cols[0];
  }
  let final = [];
  if(returned[0].length !=  undefined){
    while(returned[0].length != 0){
      final.push(returned[1]);
      returned = returned[0];
      if(returned[0].length == 0){
        final.push(returned[1]);  
      }
    }
  }
  return final;
}
console.log(mejorCombinacion(10, [3, 3, 3, 8]));

// function test(n, C, v){
//   if(n== 0 || C == 0)
//     result = 0;
//   else if(v[n] > C){
//     result = test(n -1, C, v) ;
//   }
//   else {
//     temp1 = test(n-1, C, v);
//     temp2 = v[n] + test(n-1, C - v[n]);
//     result = max(temp1, temp2);
//   }
//   return result;
// }
// console.log(test(8, [2, 2, 3, 5, 7])