CREATE TABLE individuo(
    codigo NUMBER(8) PRIMARY KEY,
    nombre VARCHAR2(20) NOT NULL,
    valor NUMBER(8) NOT NULL CHECK (valor > 0),
    padre NUMBER(8),-- REFERENCES individuo,
    nro_hijos NUMBER(8) NOT NULL CHECK (nro_hijos >=0),
    CHECK(padre <> codigo)
);

-- Se crean los triggers

SELECT *  FROM individuo;

INSERT INTO individuo VALUES (19, 'Hope Sandoval', 10, NULL, 0);
/*
codigo 	nombre 		    valor 	padre	nro_hijos
19	    Hope Sandoval   10	    NULL    0
*/

INSERT INTO individuo VALUES (32, 'Kirsty Hawkshaw', 8, NULL, 0);
/*
codigo 	nombre 		        valor 	padre	nro_hijos
19	    Hope Sandoval       10	    NULL    0
32      Kirsty Hawkshaw     8       NULL    0
*/

INSERT INTO individuo VALUES (64, 'Annabella Lwin', 10, 19, 0);
/*
codigo 	nombre 		        valor 	padre	nro_hijos
19	    Hope Sandoval       10	    NULL    1
32      Kirsty Hawkshaw     8       NULL    0
64      Annabella Lwin      10      19      0
*/

INSERT INTO individuo VALUES (122, 'Amanda Marshall', 20, 19, 0);
/*
codigo 	nombre              valor 	padre	nro_hijos
19      Hope Sandoval	    10	    NULL    2
32	    Kirsty Hawkshaw	    8	    NULL    0
64	    Annabella Lwin	    10	    19      0
122	    Amanda Marshall	    20	    19      0
*/

INSERT INTO individuo VALUES (11, 'Mavvie Marcos', 2, 64, 0);
/*
codigo 	nombre              valor 	padre	nro_hijos
19      Hope Sandoval       10      NULL    2
32      Kirsty Hawkshaw     8       NULL    0
64      Annabella Lwin      10      19      1
122     Amanda Marshall     20      19      0
11      Mavvie Marcos       2       64      0
*/

UPDATE individuo SET valor = 18 WHERE codigo = 19;
/*
codigo 	nombre              valor 	padre	nro_hijos
19      Hope Sandoval       12      NULL    2
32      Kirsty Hawkshaw     8       NULL    0
64      Annabella Lwin      16      19      1
122     Amanda Marshall     20      19      0
11      Mavvie Marcos       2       64      0
*/

UPDATE individuo SET codigo = 333 WHERE codigo = 19;
/*
codigo 	nombre              valor 	padre	nro_hijos
333     Hope Sandoval       12      NULL    2
32      Kirsty Hawkshaw     8       NULL    0
64      Annabella Lwin      16      333     1
122     Amanda Marshall     20      333     0
11      Mavvie Marcos       2       64      0
*/

DELETE FROM individuo WHERE codigo = 64;
/*
codigo 	nombre              valor 	padre	nro_hijos
333     Hope Sandoval       12      NULL    1
32      Kirsty Hawkshaw     8       NULL    0
122     Amanda Marshall     20      333     0
11      Mavvie Marcos       2       NULL    0
*/

UPDATE individuo SET valor = 4 WHERE codigo = 333;
/*
codigo 	nombre              valor 	padre	nro_hijos
333     Hope Sandoval       4       NULL    1
32      Kirsty Hawkshaw     8       NULL    0
122     Amanda Marshall     20      333     0
11      Mavvie Marcos       2       NULL    0
*/

-- Se borra la tabla, se vuelve a crear la tabla y se vuelven a crear los triggers

INSERT INTO individuo VALUES (1, 'Pichu', 2, NULL, 0);
/*
codigo 	nombre      valor 	padre	nro_hijos
1       Pichu       2       NULL    0
*/

INSERT INTO individuo VALUES (2, 'Charmander', 5, NULL, 0);
/*
codigo 	nombre      valor 	padre	nro_hijos
1       Pichu       2       NULL    0
2       Charmander  5       NULL    0
*/

INSERT INTO individuo VALUES (3, 'Charmeleon', 10, 2, 0);
/*
codigo 	nombre      valor 	padre	nro_hijos
1       Pichu       2       NULL    0
2       Charmander  5       NULL    1
3       Charmeleon  10      2       0
*/

INSERT INTO individuo VALUES (4, 'Charizard', 15, 3, 0);
/*
codigo 	nombre      valor 	padre	nro_hijos
1       Pichu       2       NULL    0
2       Charmander  5       NULL    1
3       Charmeleon  10      2       1
4       Charizard   15      3       0
*/

UPDATE individuo SET valor = 8 WHERE codigo = 2;
/*
codigo 	nombre      valor 	padre	nro_hijos
1       Pichu       2       NULL    0
2       Charmander  5       NULL    1
3       Charmeleon  10      2       1
4       Charizard   15      3       0
*/

UPDATE individuo SET valor = 12 WHERE codigo = 2;
/*
codigo 	nombre      valor 	padre	nro_hijos
1       Pichu       2       NULL    0
2       Charmander  7       NULL    1
3       Charmeleon  15      2       1
4       Charizard   15      3       0
*/

DELETE FROM individuo WHERE codigo = 2;
/*
codigo 	nombre      valor 	padre	nro_hijos
1       Pichu       2       NULL    0
3       Charmeleon  15      NULL    1
4       Charizard   15      3       0
*/

UPDATE individuo SET valor = 10 WHERE codigo = 1;
/*
codigo 	nombre      valor 	padre	nro_hijos
1       Pichu       4       NULL    0
3       Charmeleon  15      NULL    1
4       Charizard   15      3       0
*/

INSERT INTO individuo VALUES (5, 'Pikachu', 9, 1, 0);
/*
codigo 	nombre      valor 	padre	nro_hijos
1       Pichu       4       NULL    1
3       Charmeleon  15      NULL    1
4       Charizard   15      3       0
5       Pikachu     9       1       0
*/

UPDATE individuo SET codigo = 6 WHERE codigo = 1;
/*
codigo 	nombre      valor 	padre	nro_hijos
6       Pichu       4       NULL    1
3       Charmeleon  15      NULL    1
4       Charizard   15      3       0
5       Pikachu     9       6       0
*/

UPDATE individuo SET valor = 1 WHERE codigo = 4;
/*
codigo 	nombre      valor 	padre	nro_hijos
6       Pichu       4       NULL    1
3       Charmeleon  15      NULL    1
4       Charizard   1       3       0
5       Pikachu     9       6       0
*/