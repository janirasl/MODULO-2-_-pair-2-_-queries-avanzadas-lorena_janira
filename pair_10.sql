use northwind;

-- 1 Pedidos por empresa en UK:
--    Desde las oficinas en UK nos han pedido con urgencia que realicemos una consulta a la base de datos con la que podamos conocer cuántos pedidos ha realizado cada 
--    empresa cliente de UK.

--  Nos piden el ID del cliente y el nombre de la empresa y el número de pedidos.

select	c.customerid,  -- paso 1
		c.companyname,
		o.orderid
	from customers as c
    inner join  orders as o
		on c.customerid = o.customerid;
	

select	c.customerid, -- paso 2 / 56 resultados compañias a UK
		c.companyname,
		count(o.orderid) as total_pedido
	from customers as c
    inner join  orders as o
		on c.customerid = o.customerid
	where c.country = "UK"
    group by  c.customerid, c.companyname; -- 7 compañias registradas y nos muestra el total de pedido de cada compañia


  
-- 2 Productos pedidos por empresa en UK por año:
--    Desde Reino Unido se quedaron muy contentas con nuestra rápida respuesta a su petición anterior y han decidido pedirnos una serie de consultas adicionales.
--    La primera de ellas consiste en una query que nos sirva para conocer cuántos objetos ha pedido cada empresa cliente de UK durante cada año.
 
--    Nos piden concretamente conocer el nombre de la empresa, el año, y la cantidad de objetos que han pedido. Para ello hará falta hacer 2 joins.
-- nombre de la empresa = custumers
-- año = orders
-- objetos =orderdetails / orderdetails =orderID
 
select c.companyname as nombre_empresa,        	 -- seleccionamos las columnas que queremos analizar
		year(o.orderdate) as año,                	-- year buscado en internet / extraemos el año de la fecha del pedido
        sum(od.quantity) as cantidad_de_objetos  	-- sumar las cantidad de productos pedidos
from customers as c                         			 -- tabla origen
inner join orders as o                       			 -- con la cual queremos cruzarla 
	on c.customerid	= o.customerid	        			  -- puente / conexion entre tablas 
inner join orderdetails as od                   		 -- segunda vuelta ...con la cual queremos cruzarla
	on	od.orderid = o.orderid             			 -- puente / conexion entre tablas 
where c.country = "UK"                      		-- pais del cual queremos saber la información
group by c.companyname, year(o.orderdate);

        
 
 

-- 3  Pedidos que han realizado cada compañía y su fecha:
--    Después de estas solicitudes desde UK y gracias a la utilidad de los resultados que se han obtenido, desde la central nos han pedido una consulta que indique 
--     el nombre de cada compañía cliente junto con cada pedido que han realizado y su fecha.









-- 4 Tipos de producto vendidos:
--     Ahora nos piden una lista con cada tipo de producto que se han vendido, sus categorías, nombre de la categoría y el nombre del producto, 
--     y el total de dinero por el que se ha vendido cada tipo de producto (teniendo en cuenta los descuentos).
--     Pista Necesitaréis usar 3 joins.