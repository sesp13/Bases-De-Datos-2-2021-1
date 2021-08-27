DELETE FROM empleado;
DELETE FROM producto;
DELETE FROM ciudad;
DELETE FROM departamento;

INSERT INTO departamento VALUES (1, 'Antioquia');
INSERT INTO departamento VALUES (2, 'Valle del Cauca');

INSERT INTO ciudad VALUES (1, 'Medellin', (SELECT REF(d) FROM departamento d WHERE d.cod = 1));
INSERT INTO ciudad VALUES (2, 'Rionegro', (SELECT REF(d) FROM departamento d WHERE d.cod = 1));
INSERT INTO ciudad VALUES (3, 'Cali', (SELECT REF(d) FROM departamento d WHERE d.cod = 2));
INSERT INTO ciudad VALUES (4, 'Palmira', (SELECT REF(d) FROM departamento d WHERE d.cod = 2));

INSERT INTO producto VALUES (1, 'RAM', 3);
INSERT INTO producto VALUES (2, 'CPU', 15);
INSERT INTO producto VALUES (3, 'Tarjeta Madre', 5);
INSERT INTO producto VALUES (4, 'GPU', 45);
INSERT INTO producto VALUES (5, 'PSU', 4);
INSERT INTO producto VALUES (6, 'Chasis', 3);

INSERT INTO empleado VALUES (
    1,
    'Pepito Perez',
    (SELECT REF(c) FROM ciudad c WHERE c.cod = 1),
    vent_varray(
        venta_tipo(
            (SELECT REF(p) FROM producto p WHERE p.cod = 1),
            10
        ),
        venta_tipo(
            (SELECT REF(p) FROM producto p WHERE p.cod = 2),
            5
        )
    )
);
INSERT INTO empleado VALUES (
    2,
    'Francisco Moreno',
    (SELECT REF(c) FROM ciudad c WHERE c.cod = 1),
    vent_varray(
        venta_tipo(
            (SELECT REF(p) FROM producto p WHERE p.cod = 4),
            4
        )
    )
);
INSERT INTO empleado VALUES (
    3,
    'Daniel Sanchez',
    (SELECT REF(c) FROM ciudad c WHERE c.cod = 2),
    vent_varray(
        venta_tipo(
            (SELECT REF(p) FROM producto p WHERE p.cod = 3),
            3
        ),
        venta_tipo(
            (SELECT REF(p) FROM producto p WHERE p.cod = 5),
            5
        )
    )
);
INSERT INTO empleado VALUES (
    4,
    'John Doe',
    (SELECT REF(c) FROM ciudad c WHERE c.cod = 2),
    vent_varray(
        venta_tipo(
            (SELECT REF(p) FROM producto p WHERE p.cod = 6),
            10
        )
    )
);
INSERT INTO empleado VALUES (
    5,
    'Fulano de Tal',
    (SELECT REF(c) FROM ciudad c WHERE c.cod = 3),
    vent_varray(
        venta_tipo(
            (SELECT REF(p) FROM producto p WHERE p.cod = 3),
            5
        )
    )
);
INSERT INTO empleado VALUES (
    6,
    'Fulano de X',
    (SELECT REF(c) FROM ciudad c WHERE c.cod = 3),
    vent_varray(
        venta_tipo(
            (SELECT REF(p) FROM producto p WHERE p.cod = 2),
            2
        )
    )
);
INSERT INTO empleado VALUES (
    7,
    'Noseme Ocurren',
    (SELECT REF(c) FROM ciudad c WHERE c.cod = 4),
    vent_varray(
        venta_tipo(
            (SELECT REF(p) FROM producto p WHERE p.cod = 1),
            7
        ),
        venta_tipo(
            (SELECT REF(p) FROM producto p WHERE p.cod = 3),
            1
        ),
        venta_tipo(
            (SELECT REF(p) FROM producto p WHERE p.cod = 6),
            1
        )
    )
);
INSERT INTO empleado VALUES (
    8,
    'Deverdad Nose',
    (SELECT REF(c) FROM ciudad c WHERE c.cod = 4),
    vent_varray(
        venta_tipo(
            (SELECT REF(p) FROM producto p WHERE p.cod = 5),
            3
        ),
        venta_tipo(
            (SELECT REF(p) FROM producto p WHERE p.cod = 3),
            1
        )
    )
);

COMMIT;

UPDATE empleado
SET ventas = vent_varray(
    venta_tipo(
        (SELECT REF(p) FROM producto p WHERE p.cod = 3),
        3
    )
)
WHERE cc = 3;

COMMIT;

SELECT * FROM empleado;