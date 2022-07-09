/* showing which company has which products*/
SELECT company.company_name, product.name FROM company INNER JOIN famazon_table on company.ID = famazon_table.fk_company_id INNER JOIN product on famazon_table.fk_product_id = product.ID;
/* showing products on ShoopiCompi company*/
SELECT product.* FROM product inner JOIN famazon_table ON product.ID = famazon_table.fk_product_id INNER JOIN company on famazon_table.fk_company_id = company.ID WHERE company.company_name = "ShoopingCompi";
/* showing customer names who ordered on the specific day*/
SELECT customer.first_name, customer.last_name, customer.ID FROM customer INNER JOIN `ordering` on customer.fk_ordering_id = `ordering`.`ID` WHERE `ordering`.`order_date` = "2022-02-15";
/*showing which items got ordered between two specific days*/
SELECT product.*, `ordering`.`ship_date` FROM product inner JOIN famazon_table ON product.ID = famazon_table.fk_product_id INNER JOIN customer ON famazon_table.fk_customer_id = customer.ID INNER JOIN `ordering` on customer.fk_ordering_id = `ordering`.`ID` WHERE `ordering`.`ship_date` BETWEEN "2022-01-01" and "2022-09-10";

/*showing which items got ordered between the specific day and today*/
SELECT product.*, `ordering`.`ship_date` FROM product inner JOIN famazon_table ON product.ID = famazon_table.fk_product_id INNER JOIN customer ON famazon_table.fk_customer_id = customer.ID INNER JOIN `ordering` on customer.fk_ordering_id = `ordering`.`ID` WHERE `ordering`.`ship_date` BETWEEN "2022-01-01" and CURRENT_DATE;

--how many products were sent to a specific city 
SELECT COUNT(product.ID) FROM product inner JOIN famazon_table ON product.ID = famazon_table.fk_product_id INNER JOIN customer on famazon_table.fk_customer_id = customer.ID INNER JOIN `ordering` on customer.fk_ordering_id = `ordering`.`ID` INNER JOIN shipping on `ordering`.`fk_ship_id` = shipping.ID WHERE shipping.start_location = "Vienna";

SELECT product.name, product.price, `ordering`.`order_date`, `ordering`.`deliver_date`, shipping.end_location FROM product INNER JOIN famazon_table ON product.ID = famazon_table.fk_product_id INNER JOIN customer on famazon_table.fk_customer_id = customer.ID INNER JOIN `ordering` on customer.fk_ordering_id = `ordering`.`ID` INNER JOIN shipping on `ordering`.`fk_ship_id` = shipping.ID WHERE shipping.end_location = "New York";
SELECT product.name, product.price, `ordering`.`order_date`, `ordering`.`deliver_date`, shipping.end_location FROM product LEFT JOIN famazon_table ON product.ID = famazon_table.fk_product_id LEFT JOIN customer on famazon_table.fk_customer_id = customer.ID LEFT JOIN `ordering` on customer.fk_ordering_id = `ordering`.`ID` LEFT JOIN shipping on `ordering`.`fk_ship_id` = shipping.ID;


/* subquery*/

SELECT * FROM `product_set` WHERE `product_set`.`ID` in(SELECT p.fk_product_set_id from product p WHERE `product_set`.`ID` = 3);

SELECT * FROM `ordering` WHERE `ordering`.`ID` in(SELECT c.fk_ordering_id from customer c WHERE `ordering`.`priceSum`>= 20);