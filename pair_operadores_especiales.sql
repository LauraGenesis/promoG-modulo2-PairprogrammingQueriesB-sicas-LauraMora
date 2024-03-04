/* 1. Ciudades que empiezan con "A" o "B"
Por un extraño motivo, nuestro jefe quiere que le devolvamos una tabla con aquelas compañias
 que están afincadas en ciudades que empiezan por "A" o "B". Necesita que le devolvamos la ciudad, el nombre de la compañia 
 y el nombre de contacto.
*/
USE `northwind`;

SELECT *
	FROM `customers`;
    
SELECT `company_name` AS `Compañía`, `contact_name` AS `Contacto`, `city` AS `Ciudad`
	FROM `customers`
    WHERE `city` LIKE 'A%' OR `city` LIKE 'B%';

/* 2. Número de pedidos que han hecho en las ciudades que empiezan con L.
En este caso, nuestro objetivo es devolver los mismos campos que en la query anterior el 
número de total de pedidos que han hecho todas las ciudades que empiezan por "L".
*/
SELECT *
	FROM `customers`;

SELECT `city` AS `Ciudad`, `company_name` AS `Compañía`, `contact_name` AS `Contacto`, COUNT(`orders`.`order_id`) AS `Total pedidos`
	FROM `customers`
    INNER JOIN `orders`
    ON `customers`.`customer_id` = `orders`.`customer_id`
    WHERE `city` LIKE 'L%'
    GROUP BY `city`, `company_name`, `contact_name`;


/* 3. Todos los clientes cuyo "contact_title" no incluya "Sales"
Nuestro objetivo es extraer los clientes que no tienen el contacto "Sales" en su "contact_title". 
Extraer el nombre de contacto, su posisión (contact_title) y el nombre de la compañia.
*/

SELECT *
	FROM `customers`;
    
SELECT `contact_name` AS `contacto`, `contact_title` AS `posicion`, `company_name` AS `nombre de la compañía`
	FROM `customers`
    WHERE `contact_title` NOT LIKE 'Sales%';
    
/* 4. Todos los clientes que no tengan una "A" en segunda posición en su nombre.
Devolved unicamente el nombre de contacto.
*/
SELECT `contact_name` AS `contacto`
	FROM `customers`
    WHERE `contact_name` NOT REGEXP '^.[aA]';
    
SELECT `contact_name` AS `contacto`
	FROM `customers`
    WHERE `contact_name` NOT LIKE '_a%';
    
/* 5. Extraer toda la información sobre las compañias que tengamos en la BBDD
Nuestros jefes nos han pedido que creemos una query que nos devuelva todos los clientes y
proveedores que tenemos en la BBDD. Mostrad la ciudad a la que pertenecen, el nombre de la 
empresa y el nombre del contacto, además de la relación (Proveedor o Cliente). Pero
importante! No debe haber duplicados en nuestra respuesta. La columna Relationship no 
existe y debe ser creada como columna temporal. Para ello añade el valor que le quieras dar al 
campo y utilizada como alias Relationship.
*/

SELECT *
	FROM `customers`;
    
SELECT `city` AS `Ciudad`, `company_name` AS `Compañía`, `contact_name` AS `Contacto`, 'Cliente' AS `relationship`
	FROM `customers`
UNION
SELECT `city` AS `Ciudad`, `company_name` AS `Compañía`, `contact_name` AS `Contacto`, 'Proveedor' AS `relationship`
	FROM `suppliers`;

/* 6. Extraer todas las categorías de la tabla categories que contengan en la descripción "sweet" o "Sweet".
*/
SELECT *
	FROM `categories`;
    
SELECT *
	FROM `categories`
    WHERE `description` LIKE '%sweet%';
    
/* 7. Extraed todos los nombres y apellidos de los clientes y empleados que tenemos en la BBDD:
*/
SELECT `contact_name` AS `Nombre`
	FROM `customers`
UNION ALL
SELECT CONCAT(`first_name`,' ', `last_name`) AS `Nombre`
	FROM `employees`