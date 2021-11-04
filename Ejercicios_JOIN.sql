
#EJERCICIOS

# 1-
/*Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los productos que tiene cada uno de ellos. 
El listado deberá mostrar también aquellos fabricantes que no tienen productos asociados.*/

use tienda;
 select * from fabricante;
 
  select * from producto;
  
select f.codigo, f. nombre as nombre_fabrico, p.nombre as nombre_producto
from fabricante f
left join producto p on f.codigo = p.codigo_fabricante
group by f.codigo;


/*Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen ningún producto asociado.
¿Pueden*/


select f.codigo, f. nombre as nombre_fabrico, p.nombre as nombre_producto
from fabricante f
cross join producto p 
group by f.codigo; 

select f.codigo, f. nombre as nombre_fabrico, p.nombre as nombre_producto
from fabricante f
left join producto p on f.codigo = p.codigo_fabricante
where  p.nombre is null
group by f.codigo;


