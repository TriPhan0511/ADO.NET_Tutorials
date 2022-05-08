USE pharmacyApp_DB
GO

SELECT * FROM store
SELECT * FROM employee

SELECT employee_id, first_name, last_name, gender, email, phone_number, address FROM employee

---- Insert a satff
--INSERT INTO employee (employee_id, first_name, last_name, password, gender, email, phone_number, address, store_id)
--VALUES ('emp002', 'Hillary', 'Clinton', '987654321', 'f', 'hillaryclinton@gmail.com', '123', '894 NCT street', 'store001')

SELECT employee_id, first_name, last_name, gender, email, phone_number, address FROM employee WHERE employee_id='emp001' AND password='123456789'

SELECT supervisor_id FROM employee WHERE employee_id='emp002'

EXEC usp_Login 'emp001', '123456789'

EXEC usp_Get_An_Employee 'emp001'

EXEC usp_Get_SupervisorID 'emp001'
EXEC usp_Get_SupervisorID 'emp002'
EXEC usp_Get_SupervisorID 'emp003'

SELECT * FROM employee WHERE supervisor_id IS NULL

SELECT * 
FROM employee 
WHERE supervisor_id IN (SELECT employee_id  FROM employee WHERE supervisor_id IS NULL)

---------------------------------------------------------------------------------------

----Staff screen
EXEC usp_GetStoreBasedOnEmployeeID 'emp003'

---------------------------------------------------------------------------------------

---- Customer Screen
SELECT * FROM customer


SELECT * FROM customer
SELECT customer_id, first_name, last_name, gender, email, phone_number, address, zip_code FROM customer

EXEC usp_Get_Customers


--- Insert some customers
INSERT INTO customer (customer_id, first_name, last_name, gender, email, phone_number, address, zip_code)
VALUES ('cus001', 'Harry', 'Potter', 'm', 'harrypotter@yahoo.com', '0905977654', '235 Tran Binh Trong', '5000')
INSERT INTO customer (customer_id, first_name, last_name, gender, email, phone_number, address, zip_code)
VALUES ('cus002', 'Kelly', 'Brigde', 'f', 'kellybrigde@yahoo.com', '0935788216', '547 Ly Thai To', '5000')
INSERT INTO customer (customer_id, first_name, last_name, gender, email, phone_number, address, zip_code)
VALUES ('cus003', 'Kurt', 'Cobain', 'm', 'kurtcobain@gmai.com', '0987566248', '98 Hoang Dieu', '5000')
INSERT INTO customer (customer_id, first_name, last_name, gender, email, phone_number, address, zip_code)
VALUES ('cus004', 'David', 'Cooperfield', 'm', 'davidcooperfield@gmail.com', '0989159753', '105 Hoang Dieu', '5000')
INSERT INTO customer (customer_id, first_name, last_name, gender, email, phone_number, address, zip_code)
VALUES ('cus005', 'Pink', 'Rose', 'f', 'pinkrose@yahoo.com', '0903654852', '90 Le Lai', '5000')

EXEC usp_Get_Customers


-- Delete all customers
EXEC usp_Delete_All_Customers

-- Insert a new customer
EXEC usp_Insert_A_Customer 'cus100', 'Johnny', 'Walker', 'm', 'johnnywlaker@gmail.com', '0905123456', 'Vietnam', '12345'


-- Update a customer
EXEC usp_Update_A_Customer 'cus001', 'Ankle' ,'Duke', 'f', 'ankle@yahoo.com', '0865', 'Danang', '12354'

-- Delete a customer
EXEC usp_Delete_A_Customer_Based_On_ID 'cus006'

---------------------------------------------------------------------------------------

-- Insert a category
EXEC usp_Insert_A_Category 'cat006', 'Category Six'

SELECT * FROM category

-- Get all of categories
EXEC usp_Get_Categories

-- Update a category
EXEC usp_Update_A_Category 'cat006', 'Category One Hundred'

-- Delete a catecory
EXEC usp_Delete_A_Category 'cat006'

---------------------------------------------------------------------------------------

-- Get all of products
EXEC usp_Get_Products

-- Insert a product
EXEC usp_Insert_A_Product 'pro002', 'Product Two', 10.99, '2024-10-10', 'pill', 'cat001'
EXEC usp_Insert_A_Product 'pro003', 'Product Three', 20.99, '2024-10-10', 'pill', 'cat002'
EXEC usp_Insert_A_Product 'pro004', 'Product Four', 40.99, '2024-10-10', 'box', 'cat002'
EXEC usp_Insert_A_Product 'pro005', 'Product Five', 25.99, '2024-10-10', 'pill', 'cat003'
EXEC usp_Insert_A_Product 'pro006', 'Product Six', 31.99, '2024-10-10', 'box', 'cat003'
EXEC usp_Insert_A_Product 'pro007', 'Product Seven', 18.99, '2024-10-10', 'pill', 'cat003'
EXEC usp_Insert_A_Product 'pro008', 'Product Eight', 36.99, '2024-10-10', 'box', 'cat003'
EXEC usp_Insert_A_Product 'pro009', 'Product Nine', 24.99, '2024-10-10', 'pill', 'cat004'
EXEC usp_Insert_A_Product 'pro010', 'Product Ten', 11.99, '2024-10-10', 'pill', 'cat004'
EXEC usp_Insert_A_Product 'pro011', 'Product Eleven', 39.99, '2024-10-10', 'box', 'cat005'
EXEC usp_Insert_A_Product 'pro012', 'Product Twelve', 20.99, '2024-10-10', 'pill', 'cat005'
EXEC usp_Insert_A_Product 'pro013', 'Product Thirteen', 27.99, '2024-10-10', 'pill', 'cat005'
EXEC usp_Insert_A_Product 'pro014', 'Product Fourteen', 19.99, '2024-10-10', 'pill', 'cat005'
EXEC usp_Insert_A_Product 'pro015', 'Product Fifteen', 17.99, '2024-10-10', 'pill', 'cat005'

-- Update a product
EXEC usp_Update_A_Product 'pro015', 'Product Hundred', 100.99, '2030-10-05', 'box', 'cat001'

-- Delete a product
EXEC usp_Delete_A_Product 'pro014'

---------------------------------------------------------------------------------------

-- Get all suppliers
EXEC usp_Get_Suppliers

-- Insert a suppiler
EXEC usp_Insert_A_Supplier 'sup001', 'Supplier One', 'supplierone@yahoo.com', '0236984567', '865 Ngo Quyen', '5000'
EXEC usp_Insert_A_Supplier 'sup002', 'Supplier Two', 'suppliertwo@yahoo.com', '0236789258', '65 Tran Phu', '5000'
EXEC usp_Insert_A_Supplier 'sup003', 'Supplier Three', 'supplierthree@yahoo.com', '0236159357', '45 Le Lai', '5000'
EXEC usp_Insert_A_Supplier 'sup004', 'Supplier Four', 'supplierfour@gmail.com', '0236147789', '37 Tran Quoc Toan', '5000'
EXEC usp_Insert_A_Supplier 'sup005', 'Supplier Five', 'supplierfive@gmail.com', '0236963125', '78 Ly Thai To', '5000'

-- Update a supplier
EXEC usp_Update_A_Supplier 'sup005', 'Supplier Hundred', 'hundred@hotmail.com', '0236111111', '99 Hai Phong', '5000'

-- Delete a supplier
EXEC usp_Delete_A_Supplier 'sup005'

---------------------------------------------------------------------------------------

-- Get all of items from the stock table
EXEC usp_Get_Items_From_Stock

-- Insert a item to the stock table
EXEC usp_Insert_An_Item_To_Stock 'store001', 'pro001', 100
EXEC usp_Insert_An_Item_To_Stock 'store001', 'pro002', 200
EXEC usp_Insert_An_Item_To_Stock 'store001', 'pro003', 300
EXEC usp_Insert_An_Item_To_Stock 'store002', 'pro001', 150
EXEC usp_Insert_An_Item_To_Stock 'store002', 'pro002', 250

-- Update the quantity of an item in the stock table
EXEC usp_Update_An_Item_In_Stock 'store002', 'pro002', 500

SELECT * FROM store
SELECT * FROM product

----------------------------------------------------------------------

-- Get employees
EXEC usp_Get_Employees

----------------------------------------------------------------------

-- Get stores
EXEC usp_Get_Stores

----------------------------------------------------------------------

SELECT
	store.store_id,
	store.store_name,
	product.product_id,
	product.product_name,
	stock.quantity
FROM stock INNER JOIN store ON stock.store_id = store.store_id 
		INNER JOIN product ON stock.product_id = product.product_id

SELECT
	store.store_id,
	store.store_name,
	product.product_id,
	product.product_name,
	stock.quantity
FROM 
	stock INNER JOIN store ON stock.store_id = store.store_id 
	INNER JOIN product ON stock.product_id = product.product_id
WHERE product_name = 'Product one'

EXEC usp_Get_Information_From_Stock_Store_Category_And_Product

----------------------------------------------------------------------

EXEC usp_Get_Categories
EXEC usp_Get_Products

SELECT *
FROM product
WHERE category_id = 'cat006'


DELETE FROM category
WHERE category_id = 'cat006'
GO

CREATE OR ALTER PROC usp_Test
AS
BEGIN
	EXEC usp_Get_Products
END
GO

EXEC usp_Test

EXEC usp_Get_Employees

-- Get managers
SELECT employee_id FROM employee WHERE supervisor_id is NULL

-- Get supervisors
SELECT employee_id FROM employee WHERE supervisor_id IN (SELECT employee_id FROM employee WHERE supervisor_id is NULL)

EXEC usp_Get_Supervisor_IDs

SELECT * FROM store

EXEC usp_Get_Stores

SELECT employee_id FROM employee WHERE supervisor_id IS NULL AND store_id = 'store001'
SELECT employee_id FROM employee WHERE supervisor_id IN (SELECT employee_id FROM employee WHERE supervisor_id IS NULL AND store_id = 'store001')

EXEC usp_Get_Supervisor_IDs_Base_On_Store_ID 'store001'
EXEC usp_Get_Supervisor_IDs_Base_On_Store_ID 'store002'

----------------------------------------------------------------------------------------------------------------

EXEC usp_Get_Employees






EXEC usp_Get_Supervisor_IDs_Base_On_Store_ID 'store001'
EXEC usp_Get_Supervisor_IDs_Base_On_Store_ID 'store002'


 
EXEC usp_Get_Supervisor_IDs_Base_On_Store_ID 'store001'
EXEC usp_Get_Supervisor_IDs_Base_On_Store_ID_2 'store001'

SELECT employee_id FROM employee WHERE supervisor_id IS NULL AND store_id = 'store001'

SELECT employee_id
FROM employee
WHERE (supervisor_id IS NULL OR supervisor_id IN (SELECT employee_id FROM employee WHERE supervisor_id IS NULL))
AND store_id = 'store001'

SELECT * FROM employee WHERE store_id = 'store002'
SELECT * FROM employee WHERE employee_id = 'emp017'

EXEC usp_GetStoreBasedOnEmployeeID 'emp001'
EXEC usp_GetStoreBasedOnEmployeeID 'emp009'

SELECT password FROM employee WHERE employee_id = 'emp001'

EXEC usp_Get_Password_Base_On_Employee_ID 'emp001'

UPDATE employee SET password = '123456' WHERE employee_id = 'emp001'

EXEC usp_Change_Password 'emp001', '123456789'

------------------------------------------------------------------------------------

SELECT * FROM supplier

EXEC usp_Get_Suppliers

INSERT INTO supplier (supplier_id, suplier_name, email, phone_number, address, zip_code)
VALUES ('sup100', 'One hundred', 'onehundred@gmail.com', '0905144234', '302 NCT', '50000')

usp_Insert_A_Supplier 'sup101', '101', 'abcdef@ga.com' , '090', '123nct' , '50000'

----------------------------------------------------------------------------------------------------- 

EXEC usp_Get_Categories

EXEC usp_Get_Products

SELECT category_id, category_name FROM category WHERE category_id = 'cat001'
EXEC usp_Get_A_Category_Base_On_Category_ID 'cat001'

EXEC usp_Get_Products

SELECT store_id FROM employee WHERE employee_id = 'emp002'

SELECT *	
FROM employee 
WHERE store_id IN (SELECT store_id FROM employee WHERE employee_id = 'emp002') 
		AND supervisor_id IS NOT NULL
		AND employee_id <> 'emp002'
		AND supervisor_id = 'emp002'

EXEC usp_Get_Supervisees_Base_On_Supervisor_ID 'emp002'

EXEC usp_Get_Employee_IDs

EXEC usp_Get_Employee_Emails

EXEC usp_Get_Employees_Base_On_Store_ID 'store001'

--------------------------------------------------------------------------------------------------------------------------------------------

-- Selling : sales_order, sales_order_detail, stock

SELECT * FROM customer
SELECT * FROM store
SELECT * FROM employee WHERE store_id = 'store001'

SELECT * FROM sales_order

INSERT INTO sales_order(sales_order_id, customer_id, store_id, employee_id, total, created_at)
VALUES ('sales001', 'cus001', 'store001', 'emp005', 10000, GETDATE())

--INSERT INTO sales_order(sales_order_id, customer_id, store_id, employee_id, total, created_at)
--VALUES ()
--INSERT INTO sales_order(sales_order_id, customer_id, store_id, employee_id, total, created_at)
--VALUES ()

EXEC usp_Insert_A_Sales_Order 'sales001', 'cus001', 'store001', 'emp005', 10000
EXEC usp_Insert_A_Sales_Order 'sales002', 'cus001', 'store001', 'emp005', 20000

EXEC usp_Insert_A_Sales_Order 'sales003', 'cus002', 'store001', 'emp005', 20000
EXEC usp_Insert_A_Sales_Order 'sales004', 'cus002', 'store001', 'emp006', 20000

EXEC usp_Insert_A_Sales_Order 'sales005', 'cus003', 'store001', 'emp004', 20000
EXEC usp_Insert_A_Sales_Order 'sales006', 'cus004', 'store001', 'emp004', 20000
EXEC usp_Insert_A_Sales_Order 'sales007', 'cus005', 'store001', 'emp004', 20000
EXEC usp_Insert_A_Sales_Order 'sales008', 'cus001', 'store001', 'emp004', 20000
EXEC usp_Insert_A_Sales_Order 'sales009', 'cus002', 'store001', 'emp004', 20000
EXEC usp_Insert_A_Sales_Order 'sales010', 'cus003', 'store001', 'emp004', 20000

EXEC usp_Get_Sales_Order_Base_On_Store_ID_And_Employee_ID 'store001', 'emp004'


SELECT 
	sales_order_id,
	product_id,
	quantity,
	discount
FROM sales_order_detail
WHERE sales_order_id = 'sales005'

EXEC usp_Get_Details_Base_On_Order_ID 'sales005'

EXEC usp_Insert_A_Sales_Order_Detail


EXEC usp_Get_Sales_Order_Base_On_Sales_Order_ID 'sales005'














