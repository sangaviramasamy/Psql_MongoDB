CREATE TABLE manufacturers (
    id int PRIMARY KEY,
    manufact_id varchar(10) NOT NULL,
    manufact_name VARCHAR(25) NOT NULL,
    manufact_location VARCHAR(25),
    manufact_contact VARCHAR(12) NOT null,
    created_by VARCHAR(20),
	updated_by VARCHAR(20),
	created_date DATE,
	updated_date DATE
);

CREATE TABLE products (
	id int PRIMARY KEY,
    product_id varchar(10) NOT NULL,
    product_name VARCHAR(25) NOT NULL,
    product_desc VARCHAR(100),
    product_price INT NOT NULL,
    product_stock INT NOT NULL,
    created_by VARCHAR(20),
	updated_by VARCHAR(20),
	created_date DATE,
	updated_date DATE,
    manufact_id INT REFERENCES manufacturers(id)
);

CREATE TABLE customers (
    id int PRIMARY KEY,
    custo_id varchar(10),
    custo_name VARCHAR(25) NOT NULL,
    custo_email VARCHAR(25),
    custo_address VARCHAR(50),
    custo_phone VARCHAR(12),
    created_by VARCHAR(20),
	updated_by VARCHAR(20),
	created_date DATE,
	updated_date DATE
);

CREATE TABLE orders (
    id int PRIMARY KEY,
    order_id varchar(10),
    customer_id INT REFERENCES customers(id),
    created_by VARCHAR(20),
	updated_by VARCHAR(20),
	created_date DATE,
	updated_date DATE,
    order_date DATE NOT NULL,
    order_amt NUMERIC(12, 2) NOT NULL
);


-- OrderDetails Table
CREATE TABLE order_details (
    id int PRIMARY KEY,
    order_id INT REFERENCES orders(id),
    product_id INT REFERENCES products(id),
    quantity INT NOT NULL,
    unit_price NUMERIC(10, 2) NOT null,
    created_by VARCHAR(20),
	updated_by VARCHAR(20),
	created_date DATE,
	updated_date DATE
);

INSERT INTO manufacturers (id, manufact_id, manufact_name, manufact_location, manufact_contact, created_by, updated_by, created_date, updated_date)
VALUES
    (1, 'M001', 'ABC Manufacturing', 'CityA', '123-456-7890', 'AdminUser', 'AdminUser', '2023-01-01', '2023-01-01'),
    (2, 'M002', 'XYZ Company', 'CityB', '987-654-3210', 'AdminUser', 'AdminUser', '2023-01-02', '2023-01-02'),
    (3, 'M003', '123 Industries', 'CityC', '111-222-3333', 'AdminUser', 'AdminUser', '2023-01-03', '2023-01-03');

INSERT INTO products (id, product_id, product_name, product_desc, product_price, product_stock, created_by, updated_by, created_date, updated_date, manufact_id)
VALUES
    (1, 'P001', 'Laptop', 'High-performance laptop', 90000, 50, 'AdminUser', 'AdminUser', '2023-01-01', '2023-01-01', 1),
    (2, 'P002', 'Smartphone', 'Feature-rich smartphone', 80000, 100, 'AdminUser', 'AdminUser', '2023-01-02', '2023-01-02', 2),
    (3, 'P003', 'Headphones', 'Noise-canceling headphones', 1500, 30, 'AdminUser', 'AdminUser', '2023-01-03', '2023-01-03', 3);

INSERT INTO customers (id, custo_id, custo_name, custo_email, custo_address, custo_phone, created_by, updated_by, created_date, updated_date)
VALUES
    (1, 'C001', 'John Doe', 'john@example.com', '123 Main St, CityA', '555-1234', 'AdminUser', 'AdminUser', '2023-01-01', '2023-01-01'),
    (2, 'C002', 'Jane Smith', 'jane@example.com', '456 Oak St, CityB', '555-5678', 'AdminUser', 'AdminUser', '2023-01-02', '2023-01-02'),
    (3, 'C003', 'Bob Johnson', 'bob@example.com', '789 Pine St, CityC', '555-9012', 'AdminUser', 'AdminUser', '2023-01-03', '2023-01-03');

INSERT INTO orders (id, order_id, customer_id, created_by, updated_by, created_date, updated_date, order_date, order_amt)
VALUES
    (1, 'O001', 1, 'AdminUser', 'AdminUser', '2023-01-01', '2023-01-01', '2023-01-10', 100.50),
    (2, 'O002', 2, 'AdminUser', 'AdminUser', '2023-01-02', '2023-01-02', '2023-01-15', 75.25),
    (3, 'O003', 3, 'AdminUser', 'AdminUser', '2023-01-03', '2023-01-03', '2023-01-20', 120.75);

INSERT INTO order_details (id, order_id, product_id, quantity, unit_price, created_by, updated_by, created_date, updated_date)
VALUES
    (1, 1, 1, 2, 25.00, 'AdminUser', 'AdminUser', '2023-01-01', '2023-01-01'),
    (2, 1, 2, 1, 50.00, 'AdminUser', 'AdminUser', '2023-01-02', '2023-01-02'),
    (3, 2, 3, 3, 30.00, 'AdminUser', 'AdminUser', '2023-01-03', '2023-01-03');

select * from order_details;

-- Index on the custo_name column (assuming it's frequently used in queries)
CREATE INDEX idx_custo_name ON customers(custo_name);

CREATE INDEX idx_manufact_name ON manufacturers(manufact_name);

CREATE INDEX idx_orders_customer_id ON orders(customer_id);

select * from products p
join manufacturers m ON p.manufact_id = m.id;

-- Performing a LEFT JOIN between customers and orders tables
SELECT
    c.id AS customer_id,
    c.custo_id,
    c.custo_name,
    c.custo_email,
    c.custo_address,
    c.custo_phone,
    o.order_id,
    o.order_date,
    o.order_amt
FROM
    customers c
LEFT JOIN
    orders o ON c.id = o.customer_id;


-- Add a new column 'custo_gender' to the 'customers' table
ALTER TABLE customers ADD COLUMN custo_gender VARCHAR(10);



