/* Query 1: How many Teufel Products were bought before March 2021 */

SELECT SUM(orders.product_amount) AS 'Number of Teufel Products bought before March 2021'
FROM `orders`
INNER JOIN `products` ON orders.product_id = products.product_id
INNER JOIN `brands` ON products.b_id = brands.b_id
WHERE b_name = 'Teufel' AND orders.oder_date < '2021-03-01';

/* Query 2: How many Teufel Products were bought in total */

SELECT SUM(orders.product_amount) AS 'Number of Teufel Products bought total'
FROM `orders`
INNER JOIN `products` ON orders.product_id = products.product_id
INNER JOIN `brands` ON products.b_id = brands.b_id
WHERE b_name = 'Teufel';

/* Query 3: Who ordered Teufel Products, when did they buy them and how many did they buy */

SELECT f_name, l_name, oder_date, orders.product_amount, products.p_name, brands.b_name
FROM `orders`
INNER JOIN `products` ON orders.product_id = products.product_id
INNER JOIN `brands` ON products.b_id = brands.b_id
INNER JOIN `accounts` ON orders.account_id = accounts.account_id
WHERE b_name = 'Teufel';

/* Query 4: How many times was each payment processor used */
SELECT processor_name, COUNT(payment_data.processor_id) AS 'No. of times used'
FROM `orders`
INNER JOIN `payment_status` ON orders.payment_id = payment_status.payment_id
INNER JOIN `payment_data` ON payment_status.pay_id = payment_data.pay_id
INNER JOIN `payment_processor` ON payment_data.processor_id = payment_processor.processor_id
GROUP BY payment_processor.processor_id;

/* Query 5: How many times did each customer use which payment processor */

SELECT f_name, l_name, processor_name, COUNT(payment_data.processor_id) AS 'No. of times used'
FROM `orders`
INNER JOIN `accounts` ON orders.account_id = accounts.account_id
INNER JOIN `payment_status` ON orders.payment_id = payment_status.payment_id
INNER JOIN `payment_data` ON payment_status.pay_id = payment_data.pay_id
INNER JOIN `payment_processor` ON payment_data.processor_id = payment_processor.processor_id
GROUP BY accounts.account_id;

/* Query 6: What is the total sum of revenue generated by each product sold */

SELECT p_name, SUM(p_price * product_amount) AS 'Revenue'
FROM `products`
RIGHT JOIN orders ON products.product_id = orders.product_id
GROUP BY products.product_id;

/* Query 7: What is the total sum of revenue generated by each product sold in 2021 */

SELECT p_name, SUM(p_price * product_amount) AS 'Revenue'
FROM `products`
INNER JOIN orders ON products.product_id = orders.product_id
WHERE oder_date > '2020-12-31'
GROUP BY products.product_id;