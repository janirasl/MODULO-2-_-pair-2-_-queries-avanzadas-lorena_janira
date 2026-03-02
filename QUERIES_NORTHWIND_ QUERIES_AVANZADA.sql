USE northwind;
SELECT * FROM PRODUCTS
LIMIT 5;
 -- seleccionamos  el producto con el precio unitario mas alto.
SELECT MAX(unitprice) as hiighestprice  -- 263.500
FROM products;

-- seleccionoamos el producto con el precio unitario mas bajo.
SELECT MIN(unitprice) as lowestprice -- 2.5000
FROM products;

-- SACAR EL NUMERO  DE PRODUCTO Y SU PRECIO MEDIO:

SELECT COUNT(*)productiD ,AVG(unitprice) -- tenemos 77 productos y la media de precio es 28866.

-- sacar la maxima y minima carga de los pedidos uk.

-- USAMOS LA TABLA DE ORDERS PARA ESTE EJERCICIO.


SELECT MAX(freight) AS max_freight, -- maxima carga 288.43
       MIN(freight)AS  min_freight  -- carga minima 0.9 
       FROM orders
       WHERE shipcountry = 'uk';
 -- que productos se venden por encima del precio medio, usamos la consulta anterior para conocer la media.
 
SELECT COUNT(*)productiD ,AVG(unitprice)
FROM products; -- LLAMAMOS DE NUEVO A LA TABLA DE PRODCUCTOS.  -- tenemos 77 productos y la media de precio es 28866.

SELECT productname, unitprice
FROM products
WHERE unitprice >avg(unitprice) 
FROM  product;

