SELECT * FROM empleado;

--Con arreglo 
SELECT * FROM empleado e, TABLE(e.ventas) v;

--Obtener ventas por ciudad
SELECT 
e.cc,
v.miprod.cod as codProducto, 
v.nro_unidades as nroUnidades 
FROM empleado e, TABLE(e.ventas) v
WHERE miciu = (SELECT REF(c) FROM ciudad c WHERE cod = %s)

--Obtener ventas por empleado
SELECT 
e.cc,
v.miprod.cod as codProducto, 
v.nro_unidades as nroUnidades,
v.miprod.precio_unitario as precioProducto,
(v.miprod.precio_unitario) * v.nro_unidades as total
FROM empleado e, TABLE(e.ventas) v;


--Get empleado con mayor venta
SELECT * FROM (
  SELECT
  e.cc as cc,
  SUM((v.miprod.precio_unitario) * v.nro_unidades) AS total
  FROM empleado e, TABLE(e.ventas) v
  GROUP BY e.cc
  ORDER BY total DESC
) WHERE rownum <= 1;

