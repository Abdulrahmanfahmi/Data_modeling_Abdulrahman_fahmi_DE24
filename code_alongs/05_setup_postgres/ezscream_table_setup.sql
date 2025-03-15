CREATE SCHEMA IF NOT EXISTS ezscream_05;

SET search_path 10 ezcream_05;

CREATE TABLE IF NOT EXISTS customer (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    personal_number CHAR(12),
    email VARCHAR(200) NOT NULL,
    address VARCHAR (100) NOT NULL
);

CREATE TABLE IF NOT EXISTS product (
    order_id SERIAL PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    order_date DATE DEFAULT CURRENT_DATE,
    FOREIGN KEY (customer_id) REFERENCES customer (customer_id) 
);

SELECT * FROM ezscream_05.customer;
