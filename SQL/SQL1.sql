-- create DB
CREATE DATABASE IF NOT EXISTS UserDB;

USE UserDB;

-- Create table orders
CREATE TABLE orders(
order_id INT primary key,
cust_id INT Not Null,
order_date date,
order_time time,
cust_name varchar(100),
is_paid boolean,
city varchar(100)
);


-- create store procedures for insert data
DELIMITER $$
Create procedure InsertData (
IN order_id INT,
IN cust_id INT,
IN order_date DATE,
IN order_time TIME,
IN cust_name VARCHAR(100),
IN is_paid BOOLEAN,
IN city varchar(100)
)

BEGIN
    INSERT INTO orders (order_id, cust_id, order_date, order_time, cust_name, is_paid, city)
    VALUES (order_id, cust_id, order_date, order_time, cust_name, is_paid, city);
END $$

DELIMITER ;


-- Insert values by procedure
CALL InsertData(1, 101, '2025-01-25', '10:15:00', 'name1', TRUE, 'city1');
CALL InsertData(2, 102, '2025-01-26', '11:30:00', 'name2', FALSE, 'city2');
CALL InsertData(3, 103, '2025-01-27', '12:45:00', 'name1', TRUE, 'city3');
CALL InsertData(4, 104, '2025-01-28', '13:55:00', 'name2', TRUE, 'city1');
CALL InsertData(5, 105, '2025-01-29', '14:20:00', 'name1', FALSE, 'city2');
CALL InsertData(6, 106, '2025-01-30', '15:30:00', 'name2', TRUE, 'city3');




-- update store procedure
DELIMITER $$
Create procedure UpdateData (
IN new_order_id INT,
IN new_cust_id INT,
IN new_order_date DATE,
IN new_order_time TIME,
IN new_cust_name VARCHAR(100),
IN new_is_paid BOOLEAN,
IN new_city varchar(100)
)

BEGIN
    update orders
    set 
		cust_id = new_cust_id,        
        order_date = new_order_date, 
        order_time = new_order_time, 
        cust_name = new_cust_name,    
        is_paid = new_is_paid,       
        city = new_city              
        WHERE order_id = new_order_id; 
END $$

DELIMITER ;


-- create procedure for Fetchin data
DELIMITER $$

CREATE PROCEDURE FETCHDATA()
BEGIN
    SELECT * FROM orders;
END $$

DELIMITER ;


-- store procedure for deleting user
DELIMITER $$

CREATE PROCEDURE CLEAR_DATA (
 ID INT
 )

BEGIN
    DELETE FROM orders 
    WHERE order_id = ID;
END $$

DELIMITER ;


-- Insert data
CALL InsertData(8, 108, '2024-09-30', '01:15:55', 'name8', FALSE, 'city8');

-- Update data
CALL UpdateData(8,111,'2024-12-20','10:10:10','user111',FALSE,'city111');

-- Delete data
CALL CLEAR_DATA(111)

-- calling fetch store procedure
CALL FETCHDATA




