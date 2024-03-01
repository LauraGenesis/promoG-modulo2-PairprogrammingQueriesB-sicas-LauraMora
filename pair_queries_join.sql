/*Pedidos por empresa en UK:
Desde las oficinas en UK nos han pedido con urgencia que realicemos una consulta a la base de datos con la que podamos conocer cuántos pedidos ha realizado cada empresa cliente de UK. Nos piden el ID del cliente y el nombre de la empresa y el número de pedidos.
Deberéis obtener una tabla similar a esta:
*/
     
USE `northwind`;

SELECT  *
	FROM `customers`
    INNER JOIN `orders`
    ON `orders`.`customer_id`= `customers`.`customer_id`;

SELECT  `customers`.`customer_id` AS `cliente_id`, `customers`.`company_name` AS `company`, COUNT( `orders`.`order_id`) AS `numero_orden`
	FROM `customers`
    INNER JOIN `orders`
    ON `orders`.`customer_id`= `customers`.`customer_id`
    WHERE `orders`.`ship_country`= 'uk'
    GROUP BY `customers`.`customer_id`, `customers`.`company_name`;
    
    
SELECT *
	FROM `orders`;
    
    
SELECT   `customers`.`company_name` AS `company`, YEAR(`orders`.`order_date`) AS año, SUM(`order_details`.`quantity`)
	FROM `customers`
    INNER JOIN `orders`
    ON `orders`.`customer_id`= `customers`.`customer_id`
    INNER JOIN `order_details`
    ON `order_details`.`order_id`= `orders`.`order_id`
    WHERE `orders`.`ship_country`= 'uk'
    GROUP BY `customers`.`company_name`, YEAR(`orders`.`order_date`);
    

SELECT   `customers`.`company_name` AS `company`, YEAR(`orders`.`order_date`) AS año, SUM((`order_details`.`quantity`* `order_details`.`unit_price`)-(`order_details`.`quantity`* `order_details`.`unit_price`* `order_details`.`discount`)) AS `total`
	FROM `customers`
    INNER JOIN `orders`
    ON `orders`.`customer_id`= `customers`.`customer_id`
    INNER JOIN `order_details`
    ON `order_details`.`order_id`= `orders`.`order_id`
    WHERE `orders`.`ship_country`= 'uk'
    GROUP BY `customers`.`company_name`, YEAR(`orders`.`order_date`); 
    
SELECT `customers`.`company_name`, `orders`.`order_id`, `orders`.`order_date`
	FROM `customers`
    INNER JOIN `orders`
    ON `orders`.`customer_id`= `customers`.`customer_id`;

SELECT  `customers`.`company_name` AS `company`, COUNT( `orders`.`order_id`) AS `numero_orden`
	FROM `customers`
    INNER JOIN `orders`
    ON `orders`.`customer_id`= `customers`.`customer_id`
    WHERE `orders`.`ship_country`= 'uk'
    GROUP BY `customers`.`customer_id`, `customers`.`company_name`;

/*Empresas de UK y sus pedidos:
También nos han pedido que obtengamos todos los nombres de las empresas cliente de Reino Unido (tengan pedidos o no) junto con los ID de todos los pedidos que han realizado y la fecha del pedido.
Los resultados de la query deberán ser:
*/

SELECT  `customers`.`company_name` AS `company`,  `orders`.`order_id` AS `numero_orden` , `orders`.`order_date`
	FROM `customers`
    LEFT JOIN `orders`
    ON `orders`.`customer_id`= `customers`.`customer_id`
    WHERE `orders`.`ship_country`= 'uk'

SELECT  `customers`.`company_name` AS `company`,  `orders`.`order_id` AS `numero_orden` , `orders`.`order_date`
	FROM `customers`
    LEFT JOIN `orders`
    ON `orders`.`customer_id`= `customers`.`customer_id`
    WHERE `orders`.`ship_country`= 'uk';

SELECT 
    `employees`.`city` AS `ciudad`,
    `employees`.`first_name` AS `nombre_empleada`,
    `employees`.`last_name` AS `apellido_empleada`,
    e2.first_name AS nombre_supervisora,
    e2.last_name AS apellido_supervisora
FROM 
    employees e1
LEFT JOIN 
    employees e2 ON e1.manager_id = e2.employee_id;