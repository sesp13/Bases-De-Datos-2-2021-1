UPDATE empleado  SET ventas = vent_varray(
  (
    venta_tipo((SELECT REF(p) FROM producto p WHERE p.cod = 1), 2) 
  ),
  (
    venta_tipo((SELECT REF(p) FROM producto p WHERE p.cod = 2), 2) 
  )
)
WHERE cc = 101;

UPDATE empleado  SET ventas = vent_varray(
  (
    venta_tipo((SELECT REF(p) FROM producto p WHERE p.cod = 1), 8) 
  ),
  (
    venta_tipo((SELECT REF(p) FROM producto p WHERE p.cod = 2), 3) 
  )
)
WHERE cc = 102;

UPDATE empleado  SET ventas = vent_varray(
  (
    venta_tipo((SELECT REF(p) FROM producto p WHERE p.cod = 1), 1) 
  ),
  (
    venta_tipo((SELECT REF(p) FROM producto p WHERE p.cod = 4), 1) 
  ),
  (
    venta_tipo((SELECT REF(p) FROM producto p WHERE p.cod = 3), 10) 
  )
)
WHERE cc = 103;

UPDATE empleado  SET ventas = vent_varray(
  (
    venta_tipo((SELECT REF(p) FROM producto p WHERE p.cod = 1), 1) 
  ),
  (
    venta_tipo((SELECT REF(p) FROM producto p WHERE p.cod = 2), 2) 
  ),
  (
    venta_tipo((SELECT REF(p) FROM producto p WHERE p.cod = 3), 4) 
  ),
  (
    venta_tipo((SELECT REF(p) FROM producto p WHERE p.cod = 4), 1) 
  )
)
WHERE cc = 104;

UPDATE empleado  SET ventas = vent_varray(
  (
    venta_tipo((SELECT REF(p) FROM producto p WHERE p.cod = 4), 3) 
  )
)
WHERE cc = 105;

-- Reiniciar todos los arreglos de ventas
UPDATE empleado SET ventas = vent_varray();