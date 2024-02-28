USE `tienda`;

SELECT * 
	FROM `customers`
    WHERE `country`= "USA" AND `city`="Las Vegas";
    
SELECT DISTINCT `country`
	FROM  `customer`
    WHERE `credit_limit`> "100000"
    ORDER BY `country` DESC;
    
SELECT `customer_number`AS `NUMERO`, `