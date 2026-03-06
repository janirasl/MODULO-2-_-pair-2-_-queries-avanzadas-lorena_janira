USE NORTHWIND;

-- 1 Ciudades que empiezan con "A" o "B".Por un extraño motivo, nuestro jefe quiere que le devolvamos una tabla con aquellas compañías que están afincadas 
-- en ciudades que empiezan por "A" o "B". Necesita que le devolvamos la ciudad, el nombre de la compañía y el nombre de contacto.

SELECT	*
	FROM customers;
    
SELECT CompanyName as compañia,
	   contactName as representante_compañia,
	   City as ciudad
       from customers
       where city like "A%" or city like "B%";
       
-- 2 Número de pedidos que han hecho en las ciudades que empiezan con L.
-- En este caso, nuestro objetivo es devolver los mismos campos que en la query anterior el número de total de pedidos que han hecho todas las ciudades que empiezan por "L".

SELECT  City as ciudad,
		CompanyName as compañia,
	   contactName as representante_compañia,
       count(OrderID) as numero_de_ordenes
       from customers as c
       inner join orders as o
       on c.customerId = o.customerId
       where c.city like "L%"
       group by c.City, c.CompanyName,c.contactName;
       
        
-- 3 Todos los clientes cuyo "country" no incluya "Sales".
-- objetivo es extraer los clientes que no tengan el titulo de "Sales" en "ContactTitle" . Extraer el nombre de contacto, su titulo de contacto y el nombre de la compañía.

select ContactName
		Contacttitle,
        CompanyName,
        country -- revisar
        from customers
        where Contacttitle not like "%Sales%";
        
        
-- 4  Todos los clientes que no tengan una "A" en segunda posición en su nombre. Devolved unicamente el nombre de contacto.

select ContactName as contacto
	from customers
    where ContactName not like "_A%";
    
-- 5 Extraer toda la información sobre las compañías que tengamos en la bases de datos
-- customer: city, companyname, contactname
-- suppliers: city, companyname, contacName

select city, companyname, contactname, "Cliente" as Relationship
		from customers
		union

		select city, companyname, contactname, "Proveedor" as Relationship
		from suppliers;
		
       