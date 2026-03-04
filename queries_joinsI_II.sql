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

SELECT 
    c.CompanyName,
    o.OrderID,
    o.OrderDate
FROM Customers c
INNER JOIN Orders o
    ON c.CustomerID = o.CustomerID
ORDER BY c.CompanyName, o.OrderDate;







-- 4 Tipos de producto vendidos:
--     Ahora nos piden una lista con cada tipo de producto que se han vendido, sus categorías, nombre de la categoría y el nombre del producto, 
--     y el total de dinero por el que se ha vendido cada tipo de producto (teniendo en cuenta los descuentos).
--     Pista Necesitaréis usar 3 joins.




-- joins parte dos--

-- 2. El equipo de marketing necesita una lista con todas las categorías de productos, incluso si no tienen productos asociados.
-- Queremos obtener el nombre de la categoría y el nombre de los productos dentro de cada categoría. 
-- Podriamos usar un RIGTH JOIN con 'categories'?, usemos tambien la tabla 'products'

SELECT * FROM products;

SELECT c.categoryname,p.productname
FROM products  AS p
RIGHT JOIN categories AS c
ON c.categoryid =p.categoryid; -- // me salen 77 resultados pero no hay ningun producto sin ningun resultado estara bien?

-- 3  Desde el equipo de ventas nos piden obtener una lista de todos los pedidos junto con los datos de las empresas clientes. 
--   Sin embargo, hay algunos pedidos que pueden no tener un cliente asignado.
 --  Necesitamos asegurarnos de incluir todos los pedidos, incluso si no tienen cliente registrado.
 
 SELECT * FROM orders;
 SELECT * FROM customers;
 
 SELECT o.orderid,c.companyname
 FROM orders as o
 LEFT JOIN customers as c
 ON o.customerid= c.customerid;  -- me dan 830 results queremos ver si el r4esultado esta bien, no hay ningun nulo?
SELECT COUNT(*) FROM orders;


-- 4 El equipo de Recursos Humanos quiere saber qué empleadas han gestionado pedidos y cuáles no. 
-- Queremos obtener una lista con todas las empleadas y, 
-- si han gestionado pedidos, mostrar los detalles del pedido.
SELECT 
e. firstname,
e. lastname,
o.orderid
FROM  employees e
LEFT JOIN orders o 
ON e.employeeid = o.employeeid;
                                   -- // 830 results // todos los empleados han gestionado pedidos // son 9 empleados 



-- 5 Desde el área de logística nos piden una lista de todos los transportistas (shippers) y los pedidos que han enviado.
 -- Queremos asegurarnos de incluir todos los transportistas, 
 -- incluso si no han enviado pedidos.
 
SELECT * FROM shippers;
SELECT * FROM orders;

SELECT s.companyname,o.orderID
FROM Shippers s
LEFT JOIN orders o
ON s.shipperid = o.shipvia;




-- 1 Desde recursos humanos nos piden realizar una consulta que muestre por pantalla los datos de todas las empleadas y sus supervisoras.
 -- Concretamente nos piden: la ubicación, nombre, y apellido tanto de las empleadas como de las jefas. 
-- Investiga el resultado, ¿sabes decir quién es el director?


