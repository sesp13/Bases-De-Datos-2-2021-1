-- Ventas por ciudad
SELECT * FROM empleado e, TABLE(e.ventas)

--Get total ventas ciudad
SELECT 
SUM((v.miprod.precio_unitario) * v.nro_unidades) AS total
FROM empleado e, TABLE(e.ventas) v
WHERE e.miciu = (SELECT REF(c) FROM ciudad c WHERE cod = %s)

--Obtener total ventas de empleado
SELECT 
SUM((v.miprod.precio_unitario) * v.nro_unidades) AS total
FROM empleado e, TABLE(e.ventas) v
WHERE e.cc = %s