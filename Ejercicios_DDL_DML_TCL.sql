##EJERCICIOS

DROP DATABASE IF EXISTS tienda;
CREATE DATABASE tienda CHARACTER SET utf8mb4;
USE tienda;

CREATE TABLE fabricante (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL
);

CREATE TABLE producto (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  precio DOUBLE NOT NULL,
  codigo_fabricante INT UNSIGNED NOT NULL,
  FOREIGN KEY (codigo_fabricante) REFERENCES fabricante(codigo)
);

INSERT INTO fabricante VALUES(1, 'Asus');
INSERT INTO fabricante VALUES(2, 'Lenovo');
INSERT INTO fabricante VALUES(3, 'Hewlett-Packard');
INSERT INTO fabricante VALUES(4, 'Samsung');
INSERT INTO fabricante VALUES(5, 'Seagate');
INSERT INTO fabricante VALUES(6, 'Crucial');
INSERT INTO fabricante VALUES(7, 'Gigabyte');
INSERT INTO fabricante VALUES(8, 'Huawei');
INSERT INTO fabricante VALUES(9, 'Xiaomi');

INSERT INTO producto VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO producto VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO producto VALUES(3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO producto VALUES(4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO producto VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO producto VALUES(6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO producto VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO producto VALUES(8, 'Portátil Yoga 520', 559, 2);
INSERT INTO producto VALUES(9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO producto VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO producto VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);


select * from fabricante;
select * from producto;

/*Lista el nombre de todos los productos que hay en la tabla producto.*/
select nombre from producto;

/* 2- Lista los nombres y los precios de todos los productos de la tabla producto.*/

select nombre,precio from producto;


/*3-Lista todas las columnas de la tabla producto.*/
select * from producto;

/*4-Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD).*/
select nombre,precio as USD, precio as euro from producto;

/*5-Lista los nombres y los precios de todos los productos de la tabla producto, 
truncando el valor del precio para mostrarlo sin ninguna cifra decimal.*/

select nombre,round(precio ,0)as USD, round(precio ,0)as euro from producto;



select * from fabricante;
select * from producto;
/*Lista el código de los fabricantes que tienen productos en la tabla producto,
 eliminando los códigos que aparecen repetidos.*/
 
 
 
 
 
/*Lista los nombres de los fabricantes ordenados de forma ascendente.*/
select * from fabricante order by nombre asc;

/*Lista los nombres de los fabricantes ordenados de forma descendente.*/
select * from fabricante order by nombre desc;

/*Lista los nombres de los productos ordenados en primer lugar por el nombre de forma ascendente
 y en segundo lugar por el precio de forma descendente.*/
 
 SELECT 
    *
FROM
    producto p
ORDER BY nombre ASC, precio DESC;
 
/*Devuelve una lista con las 5 primeras filas de la tabla fabricante.*/
select *from fabricante;
SELECT 
    *
FROM
    fabricante
LIMIT 5;

/*Devuelve una lista con 2 filas a partir de la cuarta fila de la tabla fabricante. 
La cuarta fila también se debe incluir en la respuesta.*/
/*Lista el nombre y el precio del producto más barato. (Utilice solamente las cláusulas ORDER BY y LIMIT)*/
SELECT 
    nombre, min(precio)
    FROM
    producto
ORDER BY precio 
LIMIT 8;

/*Lista el nombre y el precio del producto más caro. (Utilice solamente las cláusulas ORDER BY y LIMIT)*/

SELECT 
    nombre, max(precio)
    FROM
    producto
ORDER BY precio 
LIMIT 8;

/*Lista el nombre de todos los productos del fabricante cuyo código de fabricante es igual a 2.*/
SELECT 
    *
    FROM
   fabricante
where codigo = 2;


/*Lista el nombre de los productos que tienen un precio menor o igual a 120€.*/

SELECT 
    nombre, precio as euro
    FROM
    producto
    where precio <= 120
ORDER BY precio;

/*Lista el nombre de los productos que tienen un precio mayor o igual a 400€.*/

SELECT 
    nombre, precio as euro
    FROM
    producto
    where precio >= 400
ORDER BY precio;

/*Lista el nombre de los productos que no tienen un precio mayor o igual a 400€.*/

SELECT 
    nombre, precio as euro
    FROM
    producto
    where precio <= 400
ORDER BY precio;


/*Lista todos los productos que tengan un precio entre 80€ y 300€. Sin utilizar el operador BETWEEN.*/


SELECT 
    nombre, precio as euro
    FROM
    producto
    where precio >=80 and precio <=300
ORDER BY precio;


/*Lista todos los productos que tengan un precio entre 60€ y 200€. Utilizando el operador BETWEEN.*/

SELECT 
    nombre, precio as euro
    FROM
    producto
    where precio between 60 and 200
ORDER BY precio;

/*Lista todos los productos que tengan un precio mayor que 200€ y que el código de fabricante sea igual a 6.*/
SELECT 
    *
    FROM
    producto
    where precio >=200 and codigo_fabricante = 6
ORDER BY precio;

/*Lista todos los productos donde el código de fabricante sea 1, 3 o 5. Sin utilizar el operador IN./*/
SELECT 
    *
    FROM
    producto
    where codigo_fabricante= 1 or codigo_fabricante=3 or codigo_fabricante=5
ORDER BY codigo_fabricante;

/*Lista todos los productos donde el código de fabricante sea 1, 3 o 5. Utilizando el operador IN.*/
seleCT 
    *
    FROM
    producto
    where codigo_fabricante in (1,3,5)
ORDER BY codigo_fabricante;

/*Lista el nombre y el precio de los productos en céntimos 
(Habrá que multiplicar por 100 el valor del precio). Cree un alias para la columna que contiene el precio que se llame céntimos.*/


/*Lista los nombres de los fabricantes cuyo nombre empiece por la letra S.*/
SELECT 
    *
    FROM
  fabricante
    where  nombre like("S%")
ORDER BY nombre;

/*Lista los nombres de los fabricantes cuyo nombre termine por la vocal e.*/

SELECT 
    *
    FROM
  fabricante
    where  nombre like("%e")
ORDER BY nombre;

/*Lista los nombres de los fabricantes cuyo nombre contenga el carácter w.*/
SELECT 
    *
    FROM
  fabricante
    where  nombre like("%w%")
ORDER BY nombre;

/*Lista los nombres de los fabricantes cuyo nombre sea de 4 caracteres.*/
SELECT 
    *
    FROM
  fabricante
    where  nombre like("____")
ORDER BY nombre;

/*Devuelve una lista con el nombre de todos los productos que contienen la cadena Portátil en el nombre.*/

SELECT 
    *
    FROM
  producto
    where  nombre like("%portatil%")
ORDER BY nombre;

select * from producto
order by nombre;
/*Devuelve una lista con el nombre de todos los productos que contienen 
la cadena Monitor en el nombre y tienen un precio inferior a 215 €.*/

SELECT 
    *
    FROM
producto
    where  nombre like("%monitor%")
    and precio < 215
ORDER BY nombre;

/*Lista el nombre y el precio de todos los productos que tengan un precio mayor o igual a 180€. 
Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente).*/

SELECT 
 nombre, precio
    FROM
producto
    where  precio >=180
ORDER BY precio desc, nombre asc;



