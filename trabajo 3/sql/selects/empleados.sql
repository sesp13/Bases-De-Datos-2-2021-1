SELECT * FROM empleado;

SELECT DEREF(v.miprod) FROM empleado e, TABLE(ventas) v;