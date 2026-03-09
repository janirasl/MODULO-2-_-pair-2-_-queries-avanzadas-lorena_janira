-- EJERCICIOS SUBCONSULTAS PAIR--
USE northwind;


-- 2 Extraed información de los productos "Beverages"

-- En este caso nuestro jefe nos pide que le devolvamos toda la información necesaria para identificar un tipo de producto. En concreto, tienen especial interés por los productos con categoría "Beverages". Devuelve el ID del producto, el nombre del producto y su ID de categoría.

-- La query debería resultar en una tabla como esta:
-- ¿que queremos? id producto, nombre del producto y id,categoria de   los productos (beverages).
-- donde se haya esta informacion?--id_producto,nombreproducto en la tabla prodcuts y la categoria es la que esta en comun.
-- necesitamos de category id ver cual es beverage  y de ahi extraer //

SELECT productid,productname,categoryID
FROM products
WHERE categoryid IN
                    (SELECT  categoryid FROM categories
                                       WHERE categoryname ="beverages"); -- vamos a comprobar que la categoria 1  es  beverages!
                                       
SELECT  categoryID, categoryname FROM categories; -- 1 -- de esta manera sabemos a que  equivale la categoria 1.

-- 3 Extraed la lista de países donde viven los clientes, pero no hay ningún proveedor ubicado en ese país

-- Suponemos que si se trata de ofrecer un mejor tiempo de entrega a los clientes, 
-- entonces podría dirigirse a estos países para buscar proveedores adicionales.
-- lista  de paises donde vivien los clientes ( buscar en tabla

SELECT country FROM suppliers; -- aqui vemos en los paises que hay provedores.

SELECT DISTINCT country  -- 22 results // -- aqui veo los paises  de los clientes
FROM customers      WHERE country NOT IN  (SELECT country  FROM  suppliers); -- para mejorar esta busqueda estaria bien añadir el company_name!


SELECT country
FROM customers;


-- Extraed los pedidos con el máximo "order_date" para cada empleado.

-- Nuestro jefe quiere saber la fecha de los pedidos más recientes que ha gestionado cada empleado.
 -- Para eso nos pide que lo hagamos con una query correlacionada.
 -- OBJETIVO:  POR CADA EMPLEADO FECHA MAXIMA DE PEDIDOS DE CADA EMPLEADO!( TABLAS  ORDERS, EMPLOYEES)
  
  SELECT * 
  FROM orders 
             WHERE orderdate max(orderdate)
             FROM orders
             WHERE employeeID = employeeID ); -- ALGO FALLA!
   


