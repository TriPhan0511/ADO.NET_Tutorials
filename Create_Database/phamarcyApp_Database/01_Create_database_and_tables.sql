-- Create a database named pharmacyApp_DB
USE master
GO

DROP DATABASE IF EXISTS pharmacyApp_DB
GO
 
CREATE DATABASE pharmacyApp_DB
GO

-- Create tables
USE pharmacyApp_DB
GO

CREATE TABLE category
(
	category_id CHAR(9) PRIMARY KEY NOT NULL,
	category_name NVARCHAR(255) NOT NULL
)

CREATE TABLE product
(
	product_id CHAR(9) PRIMARY KEY NOT NULL,
	product_name NVARCHAR(255) NOT NULL,
	price DECIMAL(10,2) NOT NULL DEFAULT 0,
	expiration_date DATE NULL,
	unit NVARCHAR(50) NULL,
	category_id CHAR(9) NOT NULL,
	CONSTRAINT fk_product_category
		FOREIGN KEY (category_id)
		REFERENCES category (category_id)
		ON DELETE CASCADE
		ON UPDATE CASCADE
)

CREATE TABLE employee
(
	employee_id CHAR(9) PRIMARY KEY NOT NULL,
	first_name NVARCHAR(255) NOT NULL,
	last_name NVARCHAR(255) NOT NULL,
	password VARCHAR(255) NOT NULL,
	gender CHAR(1) NOT NULL DEFAULT 'm', -- 'm': Male, 'f': Female
	email VARCHAR(255) NOT NULL,
	phone_number VARCHAR(255) NULL,
	address NVARCHAR(255) NULL,
	is_locked BIT NOT NULL DEFAULT 0, -- 0: Not locked, 1: Locked
	supervisor_id CHAR(9) NULL,
	store_id CHAR(9) NOT NULL,
	CONSTRAINT chk_length_of_password 
		CHECK (LEN(password) >= 6),
	CONSTRAINT chk_gender
		CHECK (gender LIKE '[mf]'),
	CONSTRAINT unique_employe_email
		UNIQUE (email),
	CONSTRAINT chk_locked
		CHECK (is_locked = 0 OR is_locked = 1),
	CONSTRAINT fk_employee_supervisor
		FOREIGN KEY (supervisor_id)
		REFERENCES employee (employee_id)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
)

CREATE TABLE store
(
	store_id CHAR(9) PRIMARY KEY NOT NULL,
	store_name NVARCHAR(255) NOT NULL,
	email VARCHAR(255) NOT NULL,
	phone_number VARCHAR(255) NULL,
	address NVARCHAR(255) NULL,
	zip_code VARCHAR(50) NULL,
	manager_id CHAR(9) NULL, 
	manager_start_date DATE NULL,
	CONSTRAINT unique_store_name
		UNIQUE (store_name),
	CONSTRAINT unique_store_email
		UNIQUE (email),
	CONSTRAINT fk_store_employee_manager
		FOREIGN KEY (manager_id)
		REFERENCES employee (employee_id)
		ON DELETE CASCADE
		ON UPDATE CASCADE
)

ALTER TABLE employee
	ADD CONSTRAINT fk_employee_store
		FOREIGN KEY (store_id)
		REFERENCES store (store_id)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION

CREATE TABLE stock
(
	store_id CHAR(9) NOT NULL,
	product_id CHAR(9) NOT NULL,
	quantity INT NOT NULL DEFAULT 0
	CONSTRAINT pk_stock
		PRIMARY KEY (store_id, product_id),
	CONSTRAINT fk_stock_store
		FOREIGN KEY (store_id)
		REFERENCES store (store_id)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	CONSTRAINT fk_stock_product
		FOREIGN KEY (product_id)
		REFERENCES product (product_id)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	CONSTRAINT chk_quantity
		CHECK (quantity >= 0)
)

CREATE TABLE customer
(
	customer_id CHAR(9) PRIMARY KEY NOT NULL,
	first_name NVARCHAR(255) NOT NULL,
	last_name NVARCHAR(255) NOT NULL,
	gender CHAR(1) NOT NULL DEFAULT 'm', -- 'm': Male, 'f': Female
	email VARCHAR(255) NOT NULL,
	phone_number VARCHAR(255) NULL,
	address NVARCHAR(255) NULL,
	zip_code VARCHAR(50) NULL,
	CONSTRAINT unique_customer_email
		UNIQUE (email),
	CONSTRAINT chk_customer_gender
		CHECK (gender LIKE '[mf]'),
)

CREATE TABLE sales_order
(
	sales_order_id CHAR(9) PRIMARY KEY NOT NULL,
	customer_id CHAR(9) NOT NULL,
	store_id CHAR(9) NOT NULL,
	employee_id CHAR(9) NOT NULL,
	total DECIMAL(10,2) NOT NULL DEFAULT 0,
	created_at DATE NOT NULL DEFAULT CONVERT (DATE, GETDATE()),
	CONSTRAINT chk_total
		CHECK (total >= 0),
	CONSTRAINT fk_sales_order_customer
		FOREIGN KEY (customer_id)
		REFERENCES customer (customer_id)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	CONSTRAINT fk_sales_order_store
		FOREIGN KEY (store_id)
		REFERENCES store (store_id)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	CONSTRAINT fk_sales_order_employee
		FOREIGN KEY (employee_id)
		REFERENCES employee (employee_id)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION

)

CREATE TABLE sales_order_detail
(
	sales_order_id CHAR(9) NOT NULL,
	product_id CHAR(9) NOT NULL,
	quantity INT NOT NULL DEFAULT 0,
	discount DECIMAL(4,2) NOT NULL DEFAULT 0,
	CONSTRAINT pk_sales_order_detail
		PRIMARY KEY (sales_order_id, product_id),
	CONSTRAINT fk_sales_order_detail_sales_order
		FOREIGN KEY (sales_order_id)
		REFERENCES sales_order (sales_order_id)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	CONSTRAINT fk_sales_order_detail_product
		FOREIGN KEY (product_id)
		REFERENCES product (product_id)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	CONSTRAINT chk_sales_order_detail_quantity
		CHECK (quantity >= 0),
	CONSTRAINT chk_discount
		CHECK (discount >= 0)
)

CREATE TABLE supplier
(
	supplier_id CHAR(9) PRIMARY KEY NOT NULL,
	suplier_name NVARCHAR(255) NOT NULL,
	email VARCHAR(255) NOT NULL,
	phone_number VARCHAR(255) NULL,
	address NVARCHAR(255) NULL,
	zip_code VARCHAR(50) NULL,
	CONSTRAINT unique_supplier_email
		UNIQUE (email)
)

CREATE TABLE import_order
(
	import_order_id CHAR(9) PRIMARY KEY NOT NULL,
	supplier_id CHAR(9) NOT NULL,
	store_id CHAR(9) NOT NULL,
	employee_id CHAR(9) NOT NULL,
	total DECIMAL(10,2) NOT NULL DEFAULT 0,
	created_date DATE NOT NULL DEFAULT CONVERT (DATE, GETDATE()),
	CONSTRAINT fk_import_order_supplier
		FOREIGN KEY (supplier_id)
		REFERENCES supplier (supplier_id)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	CONSTRAINT fk_import_order_store
		FOREIGN KEY (store_id)
		REFERENCES store (store_id)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	CONSTRAINT fk_import_order_employee
		FOREIGN KEY (employee_id)
		REFERENCES employee (employee_id)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
	CONSTRAINT chk_import_order_total
		CHECK (total >= 0)
)

CREATE TABLE import_order_detail
(
	import_order_id CHAR(9) NOT NULL,
	product_id CHAR(9) NOT NULL,
	quantity INT NOT NULL DEFAULT 0,
	import_price DECIMAL(10,2) NOT NULL DEFAULT 0,
	CONSTRAINT pk_import_order_detail
		PRIMARY KEY (import_order_id, product_id),
	CONSTRAINT fk_import_order_detail_import_order
		FOREIGN KEY (import_order_id)
		REFERENCES import_order (import_order_id)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	CONSTRAINT fk_import_order_detail_product
		FOREIGN KEY (product_id)
		REFERENCES product (product_id)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	CONSTRAINT chk_import_order_detail_quantity
		CHECK (quantity >= 0),
	CONSTRAINT chk_import_price
		CHECK (import_price >= 0)
)
GO

----------------------------------------------------------------------------------------------------------

-- Create some stored procedures

----- Login

----1.
CREATE OR ALTER PROC usp_Login
(
	@employeeID CHAR(9),
	@password VARCHAR(255)
)
AS
BEGIN
	SELECT employee_id, 
			first_name,
			last_name,
			gender, 
			email,
			phone_number,
			address,
			store_id,
			supervisor_id
	FROM employee 
	WHERE employee_id = @employeeID AND password = @password AND is_locked = 0
END
GO

-- 2
CREATE OR ALTER PROC usp_Get_SupervisorID
(
	@employeeID CHAR(9)
)
AS
BEGIN
	SELECT supervisor_id FROM employee 
	WHERE employee_id = @employeeID
END
GO

----------------------------------------------------------------------------------

---- Staff Screen


CREATE OR ALTER PROC usp_GetStoreBasedOnEmployeeID
(
	@employee_id CHAR(9)
)
AS
BEGIN 
	SELECT store_id,
			store_name,
			email,
			phone_number,
			address,
			zip_code, 
			manager_id,
			manager_start_date
	FROM store 
	WHERE store_id IN 
		(SELECT store_id FROM employee WHERE employee_id = @employee_id)
END
GO

--SELECT * FROM store WHERE store_id IN (SELECT store_id FROM employee WHERE employee_id = 'emp003')
--SELECT store_id FROM employee WHERE employee_id = 'emp003'

----------------------------------------------------------------------------------

---- Customer screen

-- 1. Get all customers
CREATE OR ALTER PROC usp_Get_Customers
AS
BEGIN
	SELECT customer_id, 
			first_name, 
			last_name, 
			gender, 
			email, 
			phone_number, 
			address, 
			zip_code 
	FROM customer
END
GO

-- 1.1 Get a customer base on id
CREATE OR ALTER PROC usp_Get_A_Customer
(
	@customer_id CHAR(9)
)
AS
BEGIN
	SELECT 
		customer_id, 
		first_name, 
		last_name, 
		gender, 
		email, 
		phone_number, 
		address, 
		zip_code 
	FROM customer
	WHERE customer_id = @customer_id
END
GO

-- 2. Delete all customers
CREATE OR ALTER PROC usp_Delete_All_Customers
AS
BEGIN
	DELETE FROM customer
END
GO

-- 3. Insert a customer
CREATE OR ALTER PROC usp_Insert_A_Customer
(
	@customer_id CHAR(9),
	@first_name NVARCHAR(255),
	@last_name NVARCHAR(255),
	@gender CHAR(1),
	@email VARCHAR(255),
	@phone_number VARCHAR(255),
	@address NVARCHAR(255),
	@zip_code VARCHAR(50)

)
AS
BEGIN
	INSERT INTO customer (customer_id, first_name, last_name, gender, email, phone_number, address, zip_code)
	VALUES (@customer_id, @first_name, @last_name, @gender, @email, @phone_number, @address, @zip_code)
END
GO

-- 4. Updated a customer
CREATE OR ALTER PROC usp_Update_A_Customer
(
	@customer_id CHAR(9),
	@first_name NVARCHAR(255),
	@last_name NVARCHAR(255),
	@gender CHAR(1),
	@email VARCHAR(255),
	@phone_number VARCHAR(255),
	@address NVARCHAR(255),
	@zip_code VARCHAR(50)

)
AS
BEGIN
	UPDATE customer
	SET first_name = @first_name,
		last_name = @last_name,
		gender = @gender,
		email = @email,
		phone_number = @phone_number,
		address = @address,
		zip_code = @zip_code
	WHERE customer_id = @customer_id
END
GO

-- 5. Delete a customer base on id
CREATE OR ALTER PROC usp_Delete_A_Customer_Based_On_ID
(
	@customer_id CHAR(9)
)
AS
BEGIN
	DELETE FROM customer WHERE customer_id = @customer_id
END
GO

--------------------------------------------------------------------------------------------------------------------------------------------

-- CATEGORY

-- 1. Get all of categories
CREATE OR ALTER PROC usp_Get_Categories
AS
BEGIN
	SELECT category_id,
		category_name
	FROM category
END
GO

-- 2. Insert a category
CREATE OR ALTER PROC usp_Insert_A_Category
(
	@category_id CHAR(9),
	@category_name NVARCHAR(255)
)
AS
BEGIN 
	INSERT INTO category (category_id, category_name)
	VALUES (@category_id, @category_name)
END
GO

--3 . Update a category
CREATE OR ALTER PROC usp_Update_A_Category
(
	@category_id CHAR(9),
	@category_name NVARCHAR(255)
)
AS
BEGIN 
	UPDATE category
	SET category_name = @category_name
	WHERE category_id = @category_id
END
GO

-- 4. Delete a category
CREATE OR ALTER PROC usp_Delete_A_Category
(
	@category_id CHAR(9)
)
AS
BEGIN 
	DELETE FROM category
	WHERE category_id = @category_id
END
GO

-- 5. Get a categrory base on a category id
CREATE OR ALTER PROC usp_Get_A_Category_Base_On_Category_ID
(
	@category_id CHAR(9)
)
AS
BEGIN 
	SELECT 
		category_id, 
		category_name 
	FROM category 
	WHERE category_id = @category_id
END
GO

-- 6. Get all category ids
CREATE OR ALTER PROC usp_Get_Category_IDs
AS
BEGIN
	SELECT category_id
	FROM category
END
GO

--------------------------------------------------------------------------------------------------------------------------------------------

-- PRODUCT

-- 1. Get all of products
CREATE OR ALTER PROC usp_Get_Products
AS
BEGIN
	SELECT product_id,
		product_name, 
		price,
		expiration_date, 
		unit, 
		category_id
	FROM product
END
GO

-- 1.1 Get all of products
CREATE OR ALTER PROC usp_Get_A_Product
(
	@product_id CHAR(9)
)
AS
BEGIN
	SELECT product_id,
		product_name, 
		price,
		expiration_date, 
		unit, 
		category_id
	FROM product
	WHERE product_id = @product_id
END
GO

-- 2. Insert a product
CREATE OR ALTER PROC usp_Insert_A_Product
(
	@product_id CHAR(9),
	@product_name NVARCHAR(255),
	@price DECIMAL(10,2),
	@expiration_date DATE,
	@unit NVARCHAR(50),
	@category_id CHAR(9)
)
AS
BEGIN
	INSERT INTO product (product_id, product_name, price, expiration_date, unit, category_id)
	VALUES (@product_id, @product_name, @price, @expiration_date, @unit, @category_id)
END
GO

-- 3. Update a product
CREATE OR ALTER PROC usp_Update_A_Product
(
	@product_id CHAR(9),
	@product_name NVARCHAR(255),
	@price DECIMAL(10,2),
	@expiration_date DATE,
	@unit NVARCHAR(50),
	@category_id CHAR(9)
)
AS
BEGIN 
	UPDATE product
	SET product_name = @product_name,
		price = @price,
		expiration_date = @expiration_date,
		unit = @unit,
		category_id = @category_id
	WHERE product_id = @product_id
END
GO


-- 4. Delete a product
CREATE OR ALTER PROC usp_Delete_A_Product
(
	@product_id CHAR(9)
)
AS
BEGIN 
	DELETE FROM product
	WHERE product_id = @product_id
END
GO

--------------------------------------------------------------------------------------------------------------------------------------------

-- SUPPLIER

-- 1. Get all of suppliers
CREATE OR ALTER PROC usp_Get_Suppliers
AS
BEGIN
	SELECT 
		supplier_id,
		suplier_name, 
		email,
		phone_number, 
		address, 
		zip_code
	FROM supplier
END
GO

-- 2. Insert a supplier
CREATE OR ALTER PROC usp_Insert_A_Supplier
(
	@supplier_id CHAR(9),
	@suplier_name NVARCHAR(255), 
	@email VARCHAR(255),
	@phone_number VARCHAR(255), 
	@address NVARCHAR(255), 
	@zip_code VARCHAR(50)
)
AS
BEGIN
	INSERT INTO supplier(
		supplier_id,
		suplier_name, 
		email,
		phone_number, 
		address, 
		zip_code
		)
	VALUES (@supplier_id, @suplier_name, @email, @phone_number, @address, @zip_code)
END
GO

-- 3. Update a supplier
CREATE OR ALTER PROC usp_Update_A_Supplier
(
	@supplier_id CHAR(9),
	@suplier_name NVARCHAR(255), 
	@email VARCHAR(255),
	@phone_number VARCHAR(255), 
	@address NVARCHAR(255), 
	@zip_code VARCHAR(50)
)
AS
BEGIN 
	UPDATE supplier
	SET 
		suplier_name = @suplier_name,
		email = @email,
		phone_number = @phone_number,
		address = @address,
		zip_code = @zip_code
	WHERE supplier_id = @supplier_id
END
GO


-- 4. Delete a supplier
CREATE OR ALTER PROC usp_Delete_A_Supplier
(
	@supplier_id CHAR(9)
)
AS
BEGIN 
	DELETE FROM supplier
	WHERE supplier_id = @supplier_id
END
GO

--------------------------------------------------------------------------------------------------------------------------------------------

-- STOCK

-- 1. Get all of items from the stock table
CREATE OR ALTER PROC usp_Get_Items_From_Stock
AS
BEGIN
	SELECT 
		store_id,
		product_id,
		quantity
	FROM stock
END
GO

-- 2. Insert an item to the stock table
CREATE OR ALTER PROC usp_Insert_An_Item_To_Stock
(
	@store_id CHAR(9),
	@product_id CHAR(9),
	@quantity INT
)
AS
BEGIN
	INSERT INTO stock(
		store_id,
		product_id,
		quantity
		)
	VALUES (@store_id, @product_id, @quantity)
END
GO

-- 3. Update the quantity of an item in the stock table
CREATE OR ALTER PROC usp_Update_An_Item_In_Stock
(
	@store_id CHAR(9),
	@product_id CHAR(9),
	@quantity INT
)
AS
BEGIN 
	UPDATE stock
	SET quantity = @quantity
	WHERE store_id = @store_id 
		AND product_id = @product_id
END
GO

--------------------------------------------------------------------------------------------------------------------------------------------

-- Employee

-- 1. Get all of empplyees
CREATE OR ALTER PROC usp_Get_Employees
AS
BEGIN
	SELECT 
		employee_id,
		first_name,
		last_name, 
		gender,
		email,
		phone_number,
		address,
		is_locked,
		supervisor_id, 
		store_id
	FROM employee
END
GO

-- 2.1 Insert an employee (default password: 123456789)
CREATE OR ALTER PROC usp_Insert_An_Employee
(
	@employee_id CHAR(9),
	@first_name NVARCHAR(255),
	@last_name NVARCHAR(255), 
	@gender CHAR(1),
	@email VARCHAR(255),
	@phone_number VARCHAR(255),
	@address NVARCHAR(255),
	@supervisor_id CHAR(9), 
	@store_id CHAR(9)
)
AS
BEGIN
	INSERT INTO employee(
		employee_id,
		first_name,
		last_name, 
		password,
		gender,
		email,
		phone_number,
		address,
		supervisor_id, 
		store_id
		)
	VALUES (@employee_id, @first_name, @last_name, 
	'123456789', @gender, @email, @phone_number,
	@address, @supervisor_id, @store_id)
END
GO

-- 2.2
CREATE OR ALTER PROC usp_Insert_An_Employee_2
(
	@employee_id CHAR(9),
	@first_name NVARCHAR(255),
	@last_name NVARCHAR(255), 
	@gender CHAR(1),
	@email VARCHAR(255),
	@phone_number VARCHAR(255),
	@address NVARCHAR(255),
	@is_locked BIT,
	@store_id CHAR(9),
	@supervisor_id CHAR(9)
)
AS
BEGIN
	INSERT INTO employee(
		employee_id,
		first_name,
		last_name, 
		password,
		gender,
		email,
		phone_number,
		address,
		is_locked,
		store_id,
		supervisor_id
		)
	VALUES (@employee_id, @first_name, @last_name, 
	'123456789', @gender, @email, @phone_number, @address,
	@is_locked, @store_id, @supervisor_id)
END
GO

-- 3. Update an employee
CREATE OR ALTER PROC usp_Update_An_Employee
(
	@employee_id CHAR(9),
	@first_name NVARCHAR(255),
	@last_name NVARCHAR(255), 
	@gender CHAR(1),
	@email VARCHAR(255),
	@phone_number VARCHAR(255),
	@address NVARCHAR(255),
	@is_locked BIT,
	@store_id CHAR(9),
	@supervisor_id CHAR(9)
)
AS
BEGIN 
	UPDATE employee
	SET 
		first_name = @first_name,
		last_name = @last_name, 
		gender = @gender,
		email = @email,
		phone_number = @phone_number,
		address = @address,
		is_locked = @is_locked,
		store_id = @store_id,
		supervisor_id = @supervisor_id
	WHERE employee_id = @employee_id
END
GO

-- 4. Get An Employee
CREATE OR ALTER PROC usp_Get_An_Employee
(
	@employee_id CHAR(9)
)
AS
BEGIN
	SELECT 
	employee_id, 
			first_name,
			last_name,
			gender, 
			email,
			phone_number,
			address,
			store_id,
			supervisor_id
	FROM employee 
	WHERE employee_id = @employee_id
END
GO

-- 5. Get all of supervisor's id base on a store ID
CREATE OR ALTER PROC usp_Get_Supervisor_IDs_Base_On_Store_ID
(
	@store_id CHAR(9)
)
AS
BEGIN
	SELECT employee_id
	FROM employee
	WHERE (supervisor_id IS NULL OR supervisor_id IN (SELECT employee_id FROM employee WHERE supervisor_id IS NULL))
	AND store_id = @store_id
END
GO

-- 6. Get the password base on the employee's id
CREATE OR ALTER PROC usp_Get_Password_Base_On_Employee_ID
(
	@employee_id CHAR(9)
)
AS
BEGIN
	SELECT password FROM employee WHERE employee_id = @employee_id
END
GO

-- 7. Change the password of an employee
CREATE OR ALTER PROC usp_Change_Password
(
	@employee_id CHAR(9),
	@password VARCHAR(255) 
)
AS
BEGIN
	UPDATE employee SET password = @password WHERE employee_id = @employee_id
END
GO

-- 8. Get all employees who are the supervisees of a specified supervisor
CREATE OR ALTER PROC usp_Get_Supervisees_Base_On_Supervisor_ID
(
	@employee_id CHAR(9)
)
AS
BEGIN
	SELECT 
		employee_id, 
		first_name,
		last_name,
		gender, 
		email,
		phone_number,
		address,
		is_locked,
		store_id,
		supervisor_id
	FROM employee 
	WHERE store_id IN (SELECT store_id FROM employee WHERE employee_id = @employee_id)
		AND supervisor_id IS NOT NULL
		AND employee_id <> @employee_id
		AND supervisor_id = @employee_id
END
GO

-- 9. Get all ids of the employees 
CREATE OR ALTER PROC usp_Get_Employee_IDs
AS
BEGIN
	SELECT employee_id FROM employee 
END
GO

-- 10. Get all email addresses of the employees
CREATE OR ALTER PROC usp_Get_Employee_Emails
AS
BEGIN
	SELECT email FROM employee 
END
GO

-- 11. Get all of employees (except the manager) base on store id 
CREATE OR ALTER PROC usp_Get_Employees_Base_On_Store_ID
(
	@store_id CHAR(9)
)
AS
BEGIN
	SELECT 
		employee_id,
		first_name,
		last_name, 
		gender,
		email,
		phone_number,
		address,
		is_locked,
		supervisor_id, 
		store_id
	FROM employee
	WHERE supervisor_id IS NOT NULL
		AND store_id = @store_id
END
GO

--------------------------------------------------------------------------------------------------------------------------------------------

-- Store

-- 1. Get all of stores
CREATE OR ALTER PROC usp_Get_Stores
AS
BEGIN
	SELECT 
		store_id,
		store_name,
		email, 
		phone_number,
		address, 
		zip_code,
		manager_id,
		manager_start_date
	FROM store
END
GO

-- 2. Insert a store

CREATE OR ALTER PROC usp_Insert_A_Store
(
	@store_id CHAR(9),
	@store_name NVARCHAR(255),
	@email VARCHAR(255), 
	@phone_number VARCHAR(255),
	@address NVARCHAR(255), 
	@zip_code VARCHAR(50)
)
AS
BEGIN
	INSERT INTO store(
		store_id,
		store_name,
		email, 
		phone_number,
		address, 
		zip_code
		)
	VALUES (@store_id, @store_name, @email, @phone_number, @address, @zip_code)
END
GO


-- 3. Update a store
CREATE OR ALTER PROC usp_Update_A_Store
(
	@store_id CHAR(9),
	@store_name NVARCHAR(255),
	@email VARCHAR(255), 
	@phone_number VARCHAR(255),
	@address NVARCHAR(255), 
	@zip_code VARCHAR(50)
)
AS
BEGIN 
	UPDATE store
	SET 
		store_name = @store_name,
		email = @email, 
		phone_number = @phone_number,
		address = @address, 
		zip_code = @zip_code
	WHERE store_id = @store_id
END
GO

-- 4. Get A Store
CREATE OR ALTER PROC usp_Get_A_Store
(
	@store_id CHAR(9)
)
AS
BEGIN
	SELECT 
		store_id,
		store_name,
		email, 
		phone_number,
		address, 
		zip_code
	FROM store 
	WHERE store_id = @store_id
END
GO

-- 5. Update the manager of a store
CREATE OR ALTER PROC usp_Update_Manager_Of_A_Store
(
	@store_id CHAR(9),
	@manager_id CHAR(9),
	@manager_start_date DATE
)
AS
BEGIN
	UPDATE store
	SET manager_id = 'emp001',
		manager_start_date = '2022-02-09'
	WHERE store_id = 'store001'
END
GO	

--------------------------------------------------------------------------------------------------------------------------------------------

-- Stock, Store, and Product
CREATE OR ALTER PROC usp_Get_Information_From_Stock_Store_Category_And_Product
AS
BEGIN
	SELECT
		store.store_id,
		store.store_name,
		category.category_id,
		category.category_name,
		product.product_id,
		product.product_name,
		stock.quantity
	FROM stock INNER JOIN store ON store.store_id  = stock.store_id 
			INNER JOIN product ON product.product_id = stock.product_id 
			INNER JOIN category ON category.category_id = product.category_id
END
GO

--------------------------------------------------------------------------------------------------------------------------------------------

-- Sales Order

-- 1. Get sales order base on store id and employee id
CREATE OR ALTER PROC usp_Get_Sales_Order_Base_On_Store_ID_And_Employee_ID
(
	@store_id CHAR(9), 
	@employee_id CHAR(9)
)
AS
BEGIN
	SELECT 
		sales_order_id, 
		customer_id, 
		store_id, 
		employee_id, 
		total, 
		created_at
	FROM sales_order
	WHERE store_id = @store_id
		AND employee_id = @employee_id
END
GO

-- 1.1 Get sales order base on sales order id
CREATE OR ALTER PROC usp_Get_Sales_Order_Base_On_Sales_Order_ID
(
	@sales_order_id CHAR(9)
)
AS
BEGIN
	SELECT 
		sales_order_id, 
		customer_id, 
		store_id, 
		employee_id, 
		total, 
		created_at
	FROM sales_order
	WHERE sales_order_id = @sales_order_id
END
GO

-- 2. Insert a row to the sales_order table
CREATE OR ALTER PROC usp_Insert_A_Sales_Order
(
	@sales_order_id CHAR(9), 
	@customer_id CHAR(9), 
	@store_id CHAR(9), 
	@employee_id CHAR(9), 
	@total DECIMAL(10,2)
)
AS
BEGIN
	INSERT INTO sales_order(
		sales_order_id, 
		customer_id, 
		store_id, 
		employee_id, 
		total, 
		created_at
		)
	VALUES (@sales_order_id, @customer_id, @store_id, @employee_id, @total, GETDATE())
END
GO

-- Sales Order Detail

-- 1. Get sales order details base on sales order's id
CREATE OR ALTER PROC usp_Get_Details_Base_On_Order_ID
(
	@sales_order_id CHAR(9)
)
AS
BEGIN
	SELECT 
		sales_order_id,
		product_id,
		quantity,
		discount
	FROM sales_order_detail
	WHERE sales_order_id = @sales_order_id
END
GO

-- 2. Insert a sales order detail
CREATE OR ALTER PROC usp_Insert_A_Sales_Order_Detail
(
	@sales_order_id CHAR(9),
	@product_id CHAR(9), 
	@quantity INT, 
	@discount DECIMAL(4,2)
)
AS
BEGIN
	INSERT INTO sales_order_detail(
		sales_order_id,
		product_id, 
		quantity, 
		discount
		)
	VALUES (@sales_order_id, @product_id, @quantity, @discount)
END
GO






