USE `northwind`;

-- 1. Extraer en una CTE todos los nombres de las compañias y los id de los clientes.
-- Para empezar nos han mandado hacer una CTE muy sencilla el id del cliente y el nombre de la compañia de la tabla Customers.

SELECT *
	FROM `customers`;

SELECT `customer_id`, `company_name`
	FROM `customers`;
    
WITH `clientes` AS (SELECT `customer_id`, `company_name`  -- aquí hemos creado una nueva tabla temporal llamada clientes
						FROM `customers`)
SELECT * -- aquí tenemos que 'llamarla'
	FROM `clientes`; 

-- 2. Selecciona solo los de que vengan de "Germany"
-- Ampliemos un poco la query anterior. En este caso, queremos un resultado similar al anterior, pero solo queremos los que pertezcan a "Germany".

SELECT *
	FROM `customers`;
    
WITH `clientes` AS (SELECT `customer_id`, `company_name`
						FROM `customers`)
SELECT *
	FROM `clientes`
    WHERE `country` = 'Germany'; 

-- 3. Extraed el id de las facturas y su fecha de cada cliente.
-- En este caso queremos extraer todas las facturas que se han emitido a un cliente, su fecha la compañia a la que pertenece.
SELECT *
	FROM `orders`;
    
SELECT `order_id`, `customer_id`, `order_date`
	FROM `orders`;
    
WITH `facturas` AS (SELECT `order_id`, `customer_id`, `order_date`
						FROM `orders`)

SELECT `customers`.`customer_id`, `company_name`, `facturas`.`order_id`, `facturas`.`order_date`
	FROM `customers`
INNER JOIN `facturas`
ON `customers`.`customer_id` = `facturas`.`customer_id`;

--
WITH `facturas` AS (SELECT `order_id`, `customer_id`, `order_date`
						FROM `orders`)
SELECT `company_name`, `facturas`.* -- poniendo * nos sale toda la tabla de facturas
	FROM `customers`
INNER JOIN `facturas`
ON `customers`.`customer_id` = `facturas`.`customer_id`;


-- 4. Contad el número de facturas por cliente
-- Mejoremos la query anterior. En este caso queremos saber el número de facturas emitidas por cada cliente.

SELECT *
	FROM `orders`;

WITH `facturas` AS (SELECT `order_id`, `customer_id`, `order_date`
						FROM `orders`)

SELECT `customers`.`customer_id`, `company_name`, COUNT(`facturas`.`order_id`) AS `total`
	FROM `customers`
INNER JOIN `facturas`
ON `customers`.`customer_id` = `facturas`.`customer_id`
GROUP BY `customers`.`customer_id`;

    
-- 5. Cuál la cantidad media pedida de todos los productos ProductID.
-- Necesitaréis extraer la suma de las cantidades por cada producto y calcular la media.

SELECT *
	FROM `order_details`;
    
SELECT *
	FROM `products`;

WITH `cantidad` AS (SELECT `product_id`, `quantity`
						FROM `order_details`)
SELECT `product_name`, AVG(`cantidad`.`quantity`)
FROM `products`
INNER JOIN `cantidad`
    ON `products`.`product_id` = `cantidad`.`product_id`
GROUP BY `products`.`product_name`;
