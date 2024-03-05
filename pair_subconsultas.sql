/*1. Extraed los pedidos con el máximo "order_date" para cada empleado.
Nuestro jefe quiere saber la fecha de los pedidos más recientes que ha gestionado cada empleado. Para eso nos pide que lo hagamos con una query correlacionada.
Los resultados de esta query serán:
*/

SELECT * 
	FROM orders;
    
SELECT employee_id, order_id, customer_id, order_date, required_date
	FROM orders AS ord-- consulta principal
	WHERE ord.order_date = (SELECT MAX(ord2.order_date)
    FROM orders AS ord2-- consulta correlacionada
    WHERE ord2.employee_id = ord.employee_id);


/*2. Extraed el precio unitario máximo (unit_price) de cada producto vendido.
Supongamos que ahora nuestro jefe quiere un informe de los productos vendidos y su precio unitario. De nuevo lo tendréis que hacer con queries correlacionadas.
Los resultados deberán ser:
*/

SELECT *
	FROM `order_details`;


SELECT MAX(`unit_price`)
	FROM `order_details`
    WHERE `product_id` =1;
    
SELECT product_id, unit_price AS max_producto
	FROM order_details AS ord1-- consulta principal
	WHERE unit_price=(SELECT MAX(unit_price)
							FROM order_details AS ord2-- consulta correlacionada
							WHERE ord1.product_id = ord2.product_id);
	

SELECT 
    product_id, 
    unit_price AS max_producto
FROM 
    order_details AS ord1
WHERE unit_price = (SELECT MAX(unit_price)
					FROM order_details AS ord1
					WHERE ord1.product_id = ord2.product_id AS max_unit_price 
                    GROUP BY product_id);
                    
                    
SELECT 
    product_id,
    (SELECT MAX(unit_price) 
     FROM order_details AS od2 
     WHERE od1.product_id = od2.product_id) AS max_unit_price
FROM 
    order_details AS od1
GROUP BY 
    product_id;
    
/*3. Extraed información de los productos "Beverages"
En este caso nuestro jefe nos pide que le devolvamos toda la información 
necesaria para identificar un tipo de producto. En concreto, 
tienen especial interés por los productos con categoría "Beverages". 
Devuelve el ID del producto, el nombre del producto y su ID de categoría.
La query debería resultar en una tabla como esta:
*/
SELECT *
	FROM categories;
    
SELECT category_id
	FROM categories
    WHERE category_name = "Beverages"; 
    
SELECT product_id, product_name, category_id
	FROM products
    WHERE category_id = 1;

SELECT product_id, product_name, category_id
	FROM products
    WHERE category_id = (SELECT category_id
							FROM categories
							WHERE category_name = "Beverages");



/*4.Extraed la lista de países donde viven los clientes, pero no hay ningún proveedor ubicado en ese país
Suponemos que si se trata de ofrecer un mejor tiempo de entrega a los clientes, entonces podría dirigirse a estos países para buscar proveedores adicionales.
Los resultados de esta query son:
*/

SELECT *
	FROM customers;
SELECT *
	FROM suppliers;
    
SELECT country
	FROM customers;
    
SELECT country
	FROM suppliers;
    
SELECT country
	FROM customers
    WHERE country NOT IN (SELECT country FROM suppliers)
	GROUP BY country;
    
    
/* 5. Extraer los clientes que compraron mas de 20 articulos "Grandma's Boysenberry Spread"
Extraed el OrderId y el nombre del cliente que pidieron más de 20 artículos del producto "Grandma's Boysenberry Spread" (ProductID 6) en un solo pedido.
Resultado de nuestra query deberíamos tener una tabla como esta:
*/

SELECT *
	FROM order_details;
SELECT *
	FROM orders;
SELECT *
	FROM customers;
SELECT customer
	FROM products;
    
SELECT *
	FROM products
    WHERE product_name= "Grandma's Boysenberry Spread";
    


/*6. Extraed los 10 productos más caros
Nos siguen pidiendo más queries correlacionadas. En este caso queremos saber cuáles son los 10 productos más caros.
Los resultados esperados de esta query son:
*/

/*BONUS 7.Qué producto es más popular
Extraed cuál es el producto que más ha sido comprado y la cantidad que se compró.
El resultado de esta query es:
/*




