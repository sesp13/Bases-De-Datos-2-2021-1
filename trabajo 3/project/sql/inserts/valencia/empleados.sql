INSERT ALL
INTO empleado VALUES(1, 'Oscar Xhaqiri', (SELECT REF(ciu) FROM ciudad ciu WHERE ciu.cod =1),
vent_varray(
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =8),2),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =10),2))
)
INTO empleado VALUES(2, 'Jadara Martinez', (SELECT REF(ciu) FROM ciudad ciu WHERE ciu.cod =1),
vent_varray(
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =9),4),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =14),5),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =11),6),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =14),5),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =5),2),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =3),4),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =7),6),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =13),1),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =9),4),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =4),6))
)
INTO empleado VALUES(3, 'Ramon Exposito', (SELECT REF(ciu) FROM ciudad ciu WHERE ciu.cod =1),
vent_varray(
))
INTO empleado VALUES(4, 'Yeison Aranjuez', (SELECT REF(ciu) FROM ciudad ciu WHERE ciu.cod =1),
vent_varray(
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =2),5),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =7),5))
)
INTO empleado VALUES(5, 'Ramon Gutierrez', (SELECT REF(ciu) FROM ciudad ciu WHERE ciu.cod =1),
vent_varray(
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =13),5))
)
INTO empleado VALUES(6, 'Zendaya Perez', (SELECT REF(ciu) FROM ciudad ciu WHERE ciu.cod =2),
vent_varray(
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =8),4),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =13),3),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =1),4),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =4),2),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =7),3),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =12),6))
)
INTO empleado VALUES(7, 'Abigail Lopez', (SELECT REF(ciu) FROM ciudad ciu WHERE ciu.cod =2),
vent_varray(
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =12),4),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =1),1),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =2),5),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =5),1),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =10),3))
)
INTO empleado VALUES(8, 'William Uribe', (SELECT REF(ciu) FROM ciudad ciu WHERE ciu.cod =3),
vent_varray(
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =5),2),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =10),3),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =14),3),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =1),2),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =11),5),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =10),6),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =1),1),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =11),2),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =2),4))
)
INTO empleado VALUES(9, 'William Bedoya', (SELECT REF(ciu) FROM ciudad ciu WHERE ciu.cod =4),
vent_varray(
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =9),1),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =12),4),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =4),6),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =8),3),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =14),3),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =9),4),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =13),1),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =2),5),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =5),1))
)
INTO empleado VALUES(10, 'Oscar Jazzera', (SELECT REF(ciu) FROM ciudad ciu WHERE ciu.cod =4),
vent_varray(
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =2),5),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =1),3),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =7),3),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =13),2),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =14),1),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =1),1))
)
INTO empleado VALUES(11, 'Salome Aranjuez', (SELECT REF(ciu) FROM ciudad ciu WHERE ciu.cod =7),
vent_varray(
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =11),5),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =12),4),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =13),2),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =15),1),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =1),6),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =8),3),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =6),5),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =11),2))
)
INTO empleado VALUES(12, 'Victor Obrador', (SELECT REF(ciu) FROM ciudad ciu WHERE ciu.cod =7),
vent_varray(
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =8),6))
)
INTO empleado VALUES(13, 'Victor Torres', (SELECT REF(ciu) FROM ciudad ciu WHERE ciu.cod =7),
vent_varray(
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =12),5),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =4),4),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =4),2),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =8),4),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =3),1),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =4),5),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =2),1),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =12),2),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =9),1),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =1),4))
)
INTO empleado VALUES(14, 'Xakar Perez', (SELECT REF(ciu) FROM ciudad ciu WHERE ciu.cod =8),
vent_varray(
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =14),5),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =13),5),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =5),5),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =10),6),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =9),5),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =4),2),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =2),3),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =8),1))
)
INTO empleado VALUES(15, 'Abigail Uribe', (SELECT REF(ciu) FROM ciudad ciu WHERE ciu.cod =8),
vent_varray(
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =11),4),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =14),6),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =7),1),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =1),6),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =6),3),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =2),1),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =14),1),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =12),5),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =13),4),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =7),1))
)
INTO empleado VALUES(16, 'Salome Novoa', (SELECT REF(ciu) FROM ciudad ciu WHERE ciu.cod =10),
vent_varray(
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =2),1),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =2),5),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =13),1),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =10),1),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =9),4),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =15),3),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =15),2),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =5),1))
)
INTO empleado VALUES(17, 'Kelly Uribe', (SELECT REF(ciu) FROM ciudad ciu WHERE ciu.cod =10),
vent_varray(
))
INTO empleado VALUES(18, 'Francisco Aranjuez', (SELECT REF(ciu) FROM ciudad ciu WHERE ciu.cod =11),
vent_varray(
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =3),2),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =3),5),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =5),6),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =13),4))
)
INTO empleado VALUES(19, 'Laura Uribe', (SELECT REF(ciu) FROM ciudad ciu WHERE ciu.cod =11),
vent_varray(
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =8),1),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =6),3))
)
INTO empleado VALUES(20, 'Victor Ciro', (SELECT REF(ciu) FROM ciudad ciu WHERE ciu.cod =11),
vent_varray(
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =13),1),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =10),4),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =4),4),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =10),1),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =14),4))
)
INTO empleado VALUES(21, 'Tomas Jazzera', (SELECT REF(ciu) FROM ciudad ciu WHERE ciu.cod =11),
vent_varray(
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =1),3),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =4),5),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =13),2),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =10),4),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =10),6),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =6),1))
)
INTO empleado VALUES(22, 'Daniel Gutierrez', (SELECT REF(ciu) FROM ciudad ciu WHERE ciu.cod =12),
vent_varray(
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =3),2),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =15),3))
)
INTO empleado VALUES(23, 'Salome Aranjuez', (SELECT REF(ciu) FROM ciudad ciu WHERE ciu.cod =12),
vent_varray(
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =10),1),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =14),1),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =7),2))
)
INTO empleado VALUES(24, 'Laura Novoa', (SELECT REF(ciu) FROM ciudad ciu WHERE ciu.cod =12),
vent_varray(
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =3),4),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =4),4),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =8),3),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =5),6),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =10),5),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =7),6),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =8),4),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =15),2),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =5),2))
)
INTO empleado VALUES(25, 'Hada Perez', (SELECT REF(ciu) FROM ciudad ciu WHERE ciu.cod =12),
vent_varray(
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =8),1),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =7),6),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =8),2),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =1),3))
)
INTO empleado VALUES(26, 'Abigail Dominico', (SELECT REF(ciu) FROM ciudad ciu WHERE ciu.cod =13),
vent_varray(
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =12),1))
)
INTO empleado VALUES(27, 'Abigail Lopez', (SELECT REF(ciu) FROM ciudad ciu WHERE ciu.cod =13),
vent_varray(
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =12),5),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =8),2),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =4),5),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =10),6),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =5),6))
)
INTO empleado VALUES(28, 'Tomas Xhaqiri', (SELECT REF(ciu) FROM ciudad ciu WHERE ciu.cod =13),
vent_varray(
))
INTO empleado VALUES(29, 'Zendaya Franco', (SELECT REF(ciu) FROM ciudad ciu WHERE ciu.cod =13),
vent_varray(
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =10),1),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =15),3),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =15),3),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =11),6),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =5),2),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =10),1),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =11),3),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =10),4),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =15),4),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =4),1))
)
INTO empleado VALUES(30, 'Bombon Exposito', (SELECT REF(ciu) FROM ciudad ciu WHERE ciu.cod =14),
vent_varray(
))
INTO empleado VALUES(31, 'Salome Torres', (SELECT REF(ciu) FROM ciudad ciu WHERE ciu.cod =15),
vent_varray(
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =12),5),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =7),6),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =15),3),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =15),4),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =4),2))
)
INTO empleado VALUES(32, 'Petra Xhaqiri', (SELECT REF(ciu) FROM ciudad ciu WHERE ciu.cod =15),
vent_varray(
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =6),4),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =10),5),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =5),3),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =11),4))
)
INTO empleado VALUES(33, 'Eliana Ilizad', (SELECT REF(ciu) FROM ciudad ciu WHERE ciu.cod =15),
vent_varray(
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =13),2),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =11),6),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =5),3),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =8),4),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =2),2),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =11),2),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =3),5),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =14),4))
)
INTO empleado VALUES(34, 'Ramon Gutierrez', (SELECT REF(ciu) FROM ciudad ciu WHERE ciu.cod =15),
vent_varray(
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =12),4),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =4),5),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =8),6))
)
INTO empleado VALUES(35, 'Quaraz Torres', (SELECT REF(ciu) FROM ciudad ciu WHERE ciu.cod =16),
vent_varray(
))
INTO empleado VALUES(36, 'William Obrador', (SELECT REF(ciu) FROM ciudad ciu WHERE ciu.cod =16),
vent_varray(
))
INTO empleado VALUES(37, 'Daniel Bedoya', (SELECT REF(ciu) FROM ciudad ciu WHERE ciu.cod =16),
vent_varray(
))
INTO empleado VALUES(38, 'Unilda Ilizad', (SELECT REF(ciu) FROM ciudad ciu WHERE ciu.cod =16),
vent_varray(
))
INTO empleado VALUES(39, 'Victor Dominico', (SELECT REF(ciu) FROM ciudad ciu WHERE ciu.cod =16),
vent_varray(
))
INTO empleado VALUES(40, 'Oscar Ilizad', (SELECT REF(ciu) FROM ciudad ciu WHERE ciu.cod =18),
vent_varray(
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =2),6),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =6),2),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =3),2),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =10),5),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =13),4),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =13),4),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =12),2),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =13),1),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =6),1),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =8),1))
)
INTO empleado VALUES(41, 'Kelly Bedoya', (SELECT REF(ciu) FROM ciudad ciu WHERE ciu.cod =18),
vent_varray(
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =11),6),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =7),2),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =15),6))
)
INTO empleado VALUES(42, 'Abigail Valencia', (SELECT REF(ciu) FROM ciudad ciu WHERE ciu.cod =18),
vent_varray(
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =1),6),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =7),6))
)
INTO empleado VALUES(43, 'Unilda Salazar', (SELECT REF(ciu) FROM ciudad ciu WHERE ciu.cod =18),
vent_varray(
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =9),3),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =2),3),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =12),6),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =10),3),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =4),2))
)
INTO empleado VALUES(44, 'Ramon Gutierrez', (SELECT REF(ciu) FROM ciudad ciu WHERE ciu.cod =19),
vent_varray(
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =5),2),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =5),3),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =5),3),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =1),4),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =13),1),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =5),5),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =14),3),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =4),6),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =12),1))
)
INTO empleado VALUES(45, 'Natalia Quispe', (SELECT REF(ciu) FROM ciudad ciu WHERE ciu.cod =19),
vent_varray(
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =2),6))
)
INTO empleado VALUES(46, 'Oscar Martinez', (SELECT REF(ciu) FROM ciudad ciu WHERE ciu.cod =19),
vent_varray(
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =14),3))
)
INTO empleado VALUES(47, 'Bombon Franco', (SELECT REF(ciu) FROM ciudad ciu WHERE ciu.cod =20),
vent_varray(
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =7),4),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =4),6),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =10),5),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =4),5))
)
INTO empleado VALUES(48, 'William Lopez', (SELECT REF(ciu) FROM ciudad ciu WHERE ciu.cod =20),
vent_varray(
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =12),1),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =7),5),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =7),1))
)
INTO empleado VALUES(49, 'Ismael Torres', (SELECT REF(ciu) FROM ciudad ciu WHERE ciu.cod =20),
vent_varray(
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =8),4),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =11),6),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =11),1),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =3),2),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =13),6),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =12),4),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =15),6),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =15),3))
)
INTO empleado VALUES(50, 'Daniel Jazzera', (SELECT REF(ciu) FROM ciudad ciu WHERE ciu.cod =20),
vent_varray(
))
INTO empleado VALUES(51, 'Oscar Dominico', (SELECT REF(ciu) FROM ciudad ciu WHERE ciu.cod =21),
vent_varray(
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =13),1),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =9),2),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =15),6),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =7),6),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =13),2),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =1),5),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =8),2))
)
INTO empleado VALUES(52, 'Yeison Exposito', (SELECT REF(ciu) FROM ciudad ciu WHERE ciu.cod =21),
vent_varray(
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =13),4),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =13),2),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =7),5),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =3),2))
)
INTO empleado VALUES(53, 'Ramon Lopez', (SELECT REF(ciu) FROM ciudad ciu WHERE ciu.cod =22),
vent_varray(
))
INTO empleado VALUES(54, 'Carlos Franco', (SELECT REF(ciu) FROM ciudad ciu WHERE ciu.cod =22),
vent_varray(
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =8),1),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =14),2),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =2),3),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =5),1),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =13),2),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =7),3),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =3),3),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =14),5),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =12),4),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =6),6))
)
INTO empleado VALUES(55, 'Ramon Salazar', (SELECT REF(ciu) FROM ciudad ciu WHERE ciu.cod =22),
vent_varray(
))
INTO empleado VALUES(56, 'Hada Holanda', (SELECT REF(ciu) FROM ciudad ciu WHERE ciu.cod =22),
vent_varray(
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =4),2),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =15),6),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =4),5),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =14),6),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =9),6),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =8),4),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =11),2),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =5),1),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =13),5),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =1),2))
)
INTO empleado VALUES(57, 'William Uribe', (SELECT REF(ciu) FROM ciudad ciu WHERE ciu.cod =23),
vent_varray(
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =5),4),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =9),5),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =3),1),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =8),2))
)
INTO empleado VALUES(58, 'Daniel Dominico', (SELECT REF(ciu) FROM ciudad ciu WHERE ciu.cod =23),
vent_varray(
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =12),1),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =13),6),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =10),2),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =1),4),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =5),3),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =5),2),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =8),2))
)
INTO empleado VALUES(59, 'Xakar Yon', (SELECT REF(ciu) FROM ciudad ciu WHERE ciu.cod =23),
vent_varray(
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =15),4),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =1),4),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =5),5),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =9),1),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =5),3),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =6),1),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =8),5),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =13),4),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =13),3),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =6),6))
)
INTO empleado VALUES(60, 'Abigail Gutierrez', (SELECT REF(ciu) FROM ciudad ciu WHERE ciu.cod =23),
vent_varray(
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =13),3),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =2),5),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =15),3),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =10),1),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =9),2),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =1),4),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =12),4))
)
INTO empleado VALUES(61, 'Ramon Valencia', (SELECT REF(ciu) FROM ciudad ciu WHERE ciu.cod =23),
vent_varray(
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =6),4),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =15),3))
)
INTO empleado VALUES(62, 'Ramon Ciro', (SELECT REF(ciu) FROM ciudad ciu WHERE ciu.cod =24),
vent_varray(
))
INTO empleado VALUES(63, 'Abigail Xhaqiri', (SELECT REF(ciu) FROM ciudad ciu WHERE ciu.cod =24),
vent_varray(
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =10),5),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =13),1),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =4),5),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =10),1),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =11),4),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =6),4),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =1),3),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =15),5))
)
INTO empleado VALUES(64, 'Daniel Perez', (SELECT REF(ciu) FROM ciudad ciu WHERE ciu.cod =24),
vent_varray(
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =9),5),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =5),6),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =10),6))
)
INTO empleado VALUES(65, 'William Yon', (SELECT REF(ciu) FROM ciudad ciu WHERE ciu.cod =24),
vent_varray(
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =12),4),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =4),4),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =1),2),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =3),1),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =9),3),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =3),5),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =12),6),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =14),2),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =12),5))
)
INTO empleado VALUES(66, 'Carlos Perez', (SELECT REF(ciu) FROM ciudad ciu WHERE ciu.cod =26),
vent_varray(
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =12),2))
)
INTO empleado VALUES(67, 'Francisco Jazzera', (SELECT REF(ciu) FROM ciudad ciu WHERE ciu.cod =26),
vent_varray(
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =14),6),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =7),1),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =9),5),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =1),6),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =11),6),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =11),2),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =2),2),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =11),6),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =5),2))
)
INTO empleado VALUES(68, 'Carlos Lopez', (SELECT REF(ciu) FROM ciudad ciu WHERE ciu.cod =26),
vent_varray(
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =14),2),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =1),6))
)
INTO empleado VALUES(69, 'Abigail Obrador', (SELECT REF(ciu) FROM ciudad ciu WHERE ciu.cod =26),
vent_varray(
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =11),2),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =5),2),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =15),3),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =2),2),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =4),2),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =15),5),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =13),6),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =12),4),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =2),6),
venta_tipo((SELECT REF(pro) FROM producto pro WHERE pro.cod =5),4))
)
SELECT * FROM dual;