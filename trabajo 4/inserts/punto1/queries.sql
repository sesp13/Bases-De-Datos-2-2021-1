ALTER SYSTEM flush buffer_cache; 
ALTER SYSTEM flush shared_pool;

--B
SELECT /*+ FULL(c) FULL(f) FULL(d)  */ *
FROM cliente c, factura f, detalle d
WHERE c.cedula = f.cecliente AND f.codigof = d.codfact;

ALTER SYSTEM flush buffer_cache; 
ALTER SYSTEM flush shared_pool;

-- C
SELECT /*+ USE_MERGE(c f) USE_MERGE(d)  */ *
FROM cliente c, factura f, detalle d
WHERE c.cedula = f.cecliente AND f.codigof = d.codfact;

ALTER SYSTEM flush buffer_cache; 
ALTER SYSTEM flush shared_pool;
