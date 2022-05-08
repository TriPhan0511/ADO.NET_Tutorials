USE pharmacyApp_DB
GO

-- Insert a store whose id is 'store001'
EXEC usp_Insert_A_Store 'store001', 'Get Well Pharmacy Store', 'getwellpharmacy@gmail.com', '0236123456', '123 Yen Bay', '50000'

-- Insert a manager
EXEC usp_Insert_An_Employee 'emp001', 'Alex', 'Ferguson', 'm', 'alexferguson@gmail.com', '0905123456', '321 Ly Tu Trong', null, 'store001'

-- Update the manage for the store whose id is 'store001'
EXEC usp_Update_Manager_Of_A_Store 'store001', 'emp001', '2022-02-09'

---- Insert two supervisor
EXEC usp_Insert_An_Employee 'emp002', 'Hillary', 'Clinton', 'f', 'hillaryclinton@gmail.com', '0935789654', '894 Nguyen Chi Thanh street', 'emp001', 'store001'
EXEC usp_Insert_An_Employee 'emp003', 'Brad', 'Pitt', 'm', 'bradpitt@gmail.com', '0908258789', '268 Le Duan street', 'emp001', 'store001'

---- Insert some staffs
EXEC usp_Insert_An_Employee 'emp004', 'Will', 'Smith', 'm', 'willsmith@gmail.com', '0908756234', '252 Phan Thanh', 'emp002', 'store001'
EXEC usp_Insert_An_Employee 'emp005', 'Sandra', 'Bullock', 'f', 'sandrabullock@hotmail.com', '0935844562', '78 Ngo Quyen', 'emp002', 'store001'
EXEC usp_Insert_An_Employee 'emp006', 'Julia', 'Roberts', 'f', 'juliaroberts@gmail.com', '0915789654', '115 Le Dinh Duong', 'emp002', 'store001'
EXEC usp_Insert_An_Employee 'emp007', 'Tom', 'Hanks', 'm', 'tomhanks@yahoo.com', '0905159753', '321 Thai Thi Boi', 'emp003', 'store001'
EXEC usp_Insert_An_Employee 'emp008', 'Scarlett', 'Johansson', 'f', 'scarlettjohansson@gmail.com', '0918741258', '854 Ngo Quyen', 'emp003', 'store001'



--------------------------------------------------------------------------------------------------------------------------------------------

-- Insert a store whose id is 'store002'
EXEC usp_Insert_A_Store 'store002', 'The Better Life Pharmacy Store', 'thebetterlifepharmacy@gmail.com', '0236222222', '789 To Hien Thanh', '50000'

-- Insert a manager
EXEC usp_Insert_An_Employee 'emp009', 'Natalie', 'Nakase', 'f', 'natalienakase@gmail.com', '0983456852', '456 Ton That Thuyet', null, 'store002'

-- Update the manage for the store whose id is 'store001'
EXEC usp_Update_Manager_Of_A_Store 'store002', 'emp009', '2022-02-28'

---- Insert two supervisor
EXEC usp_Insert_An_Employee 'emp010', 'Megan', 'Rapinoe', 'f', 'meganrapinoe@gmail.com', '0985741258', '894 Nguye Chi Thanh', 'emp009', 'store002'
EXEC usp_Insert_An_Employee 'emp011', 'Kazim', 'Benzema', 'm', 'kazimbenzema@hotmail.com', '0913654123', '113 Le Duan street', 'emp009', 'store002'

---- Insert some staffs
EXEC usp_Insert_An_Employee 'emp012', 'Julie', 'Foudy', 'f', 'juliefoudy@gmail.com', '0918753258', '434 Le Loi', 'emp010', 'store002'
EXEC usp_Insert_An_Employee 'emp013', 'Hope', 'Solo', 'f', 'hopesolo@hotmail.com', '0938654128', '75 Le Lai', 'emp010', 'store002'
EXEC usp_Insert_An_Employee 'emp014', 'Abby', 'Wambach', 'f', 'abbywambach@yahoo.com', '0916258456', '146 Tran Phu', 'emp010', 'store002'
EXEC usp_Insert_An_Employee 'emp015', 'Robert', 'Lewandowski', 'm', 'robertlewandowski@yahoo.com', '0918452369', '01 Tran Phu', 'emp011', 'store002'
EXEC usp_Insert_An_Employee 'emp016', 'Erling', 'Haaland', 'm', 'erlinghaaland@gmail.com', '0608741258', '745 Vo Van Kiet', 'emp011', 'store002'

EXEC usp_Insert_An_Employee 'emp017', 'Happy', 'Morning', 'm', 'happymorning@gmail.com', '090577584', '100 Le Loi', 'emp011', 'store002'
UPDATE employee
SET is_locked = 1
WHERE employee_id = 'emp017'

--------------------------------------------------------------------------------------------------------------------------------------------

EXEC usp_Insert_A_Customer 'cus001', 'Harry', 'Potter', 'm', 'harrypotter@yahoo.com', '0905977654', '235 Tran Binh Trong', '50000'
EXEC usp_Insert_A_Customer 'cus002', 'Kelly', 'Brigde', 'f', 'kellybrigde@yahoo.com', '0935788216', '547 Ly Thai To', '50000'
EXEC usp_Insert_A_Customer 'cus003', 'Kurt', 'Cobain', 'm', 'kurtcobain@gmai.com', '0987566248', '98 Hoang Dieu', '50000'
EXEC usp_Insert_A_Customer 'cus004', 'David', 'Cooperfield', 'm', 'davidcooperfield@gmail.com', '0989159753', '105 Hoang Dieu', '50000'
EXEC usp_Insert_A_Customer 'cus005', 'Pink', 'Rose', 'f', 'pinkrose@yahoo.com', '0903654852', '90 Le Lai', '50000'

--------------------------------------------------------------------------------------------------------------------------------------------

-- Inser some categories

EXEC usp_Insert_A_Category 'cat001', 'Category One'
EXEC usp_Insert_A_Category 'cat002', 'Category Two'
EXEC usp_Insert_A_Category 'cat003', 'Category Three'
EXEC usp_Insert_A_Category 'cat004', 'Category Four'
EXEC usp_Insert_A_Category 'cat005', 'Category Five'

EXEC usp_Insert_A_Category 'cat006', 'Painkillers'
EXEC usp_Insert_A_Category 'cat007', 'Antiallergic'
EXEC usp_Insert_A_Category 'cat008', 'Antidote'

--------------------------------------------------------------------------------------------------------------------------------------------

-- Insert some products
EXEC usp_Insert_A_Product 'pro001', 'Product One', 11.99, '2025-10-20', 'pill', 'cat001'
EXEC usp_Insert_A_Product 'pro002', 'Product Two', 10.99, '2024-05-13', 'pill', 'cat001'
EXEC usp_Insert_A_Product 'pro003', 'Product Three', 20.99, '2023-11-15', 'pill', 'cat002'
EXEC usp_Insert_A_Product 'pro004', 'Product Four', 40.99, '2027-12-09', 'box', 'cat002'
EXEC usp_Insert_A_Product 'pro005', 'Product Five', 25.99, '2024-10-22', 'pill', 'cat003'
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

EXEC usp_Insert_A_Product 'pro016', 'Acid Acetylsaticylic', 21.99, '2024-10-10', 'pill', 'cat006'
EXEC usp_Insert_A_Product 'pro017', 'Diclofenac', 22.99, '2024-09-10', 'pill', 'cat006'
EXEC usp_Insert_A_Product 'pro018', 'Paracetamon', 10.99, '2025-01-10', 'pill', 'cat006'


EXEC usp_Insert_A_Product 'pro019', 'Cetirizine', 35.99, '2024-10-20', 'box', 'cat007'
EXEC usp_Insert_A_Product 'pro020', 'Chlopheniramin', 25.99, '2024-10-10', 'pill', 'cat007'

EXEC usp_Insert_A_Product 'pro021', 'Morphin (chlohydrat)', 35.99, '2024-10-10', 'pill', 'cat008'
EXEC usp_Insert_A_Product 'pro022', 'Adrenalin', 17.99, '2024-10-10', 'pill', 'cat008'
EXEC usp_Insert_A_Product 'pro023', 'Alverin (citrat)', 15.99, '2024-10-10', 'pill', 'cat008'
EXEC usp_Insert_A_Product 'pro024', 'Atropin (sulfat)', 16.99, '2024-10-10', 'pill', 'cat008'
EXEC usp_Insert_A_Product 'pro025', 'Depersolon', 17.99, '2024-10-10', 'pill', 'cat008'
EXEC usp_Insert_A_Product 'pro026', 'Papaverin', 17.99, '2024-10-10', 'pill', 'cat008'
EXEC usp_Insert_A_Product 'pro027', 'Methionin', 17.99, '2024-10-10', 'pill', 'cat008'


--------------------------------------------------------------------------------------------------------------------------------------------

-- Insert a suppiler
EXEC usp_Insert_A_Supplier 'sup001', 'Supplier One', 'supplierone@yahoo.com', '0236984567', '865 Ngo Quyen', '5000'
EXEC usp_Insert_A_Supplier 'sup002', 'Supplier Two', 'suppliertwo@yahoo.com', '0236789258', '65 Tran Phu', '5000'
EXEC usp_Insert_A_Supplier 'sup003', 'Supplier Three', 'supplierthree@yahoo.com', '0236159357', '45 Le Lai', '5000'
EXEC usp_Insert_A_Supplier 'sup004', 'Supplier Four', 'supplierfour@gmail.com', '0236147789', '37 Tran Quoc Toan', '5000'
EXEC usp_Insert_A_Supplier 'sup005', 'Supplier Five', 'supplierfive@gmail.com', '0236963125', '78 Ly Thai To', '5000'
--------------------------------------------------------------------------------------------------------------------------------------------

-- Insert some items to the stock table
EXEC usp_Insert_An_Item_To_Stock 'store001', 'pro001', 100
EXEC usp_Insert_An_Item_To_Stock 'store001', 'pro002', 200
EXEC usp_Insert_An_Item_To_Stock 'store001', 'pro003', 300
EXEC usp_Insert_An_Item_To_Stock 'store002', 'pro001', 150
EXEC usp_Insert_An_Item_To_Stock 'store002', 'pro002', 250

EXEC usp_Insert_An_Item_To_Stock 'store001', 'pro016', 400
EXEC usp_Insert_An_Item_To_Stock 'store001', 'pro017', 250
EXEC usp_Insert_An_Item_To_Stock 'store001', 'pro018', 152

EXEC usp_Insert_An_Item_To_Stock 'store002', 'pro016', 400
EXEC usp_Insert_An_Item_To_Stock 'store002', 'pro017', 100
EXEC usp_Insert_An_Item_To_Stock 'store002', 'pro018', 200

EXEC usp_Insert_An_Item_To_Stock 'store001', 'pro019', 100
EXEC usp_Insert_An_Item_To_Stock 'store001', 'pro020', 120

EXEC usp_Insert_An_Item_To_Stock 'store002', 'pro019', 200
EXEC usp_Insert_An_Item_To_Stock 'store002', 'pro020', 220

EXEC usp_Insert_An_Item_To_Stock 'store001', 'pro021', 150
EXEC usp_Insert_An_Item_To_Stock 'store001', 'pro022', 120
EXEC usp_Insert_An_Item_To_Stock 'store001', 'pro023', 220
EXEC usp_Insert_An_Item_To_Stock 'store001', 'pro024', 280
EXEC usp_Insert_An_Item_To_Stock 'store001', 'pro025', 365
EXEC usp_Insert_An_Item_To_Stock 'store001', 'pro026', 125
EXEC usp_Insert_An_Item_To_Stock 'store001', 'pro027', 120

EXEC usp_Insert_An_Item_To_Stock 'store002', 'pro021', 355
EXEC usp_Insert_An_Item_To_Stock 'store002', 'pro022', 200
EXEC usp_Insert_An_Item_To_Stock 'store002', 'pro023', 180
EXEC usp_Insert_An_Item_To_Stock 'store002', 'pro024', 150
EXEC usp_Insert_An_Item_To_Stock 'store002', 'pro025', 350
EXEC usp_Insert_An_Item_To_Stock 'store002', 'pro026', 245
EXEC usp_Insert_An_Item_To_Stock 'store002', 'pro027', 250

-------------------------------------------------------------------------------------------------

-- Insert some saler order (Only for testing)
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

-- Insert some saler order detail (Only for testing)
EXEC usp_Insert_A_Sales_Order_Detail 'sales005', 'pro002', 20, 0.0
EXEC usp_Insert_A_Sales_Order_Detail 'sales005', 'pro003', 30, 0.0
EXEC usp_Insert_A_Sales_Order_Detail 'sales005', 'pro004', 40, 0.0
EXEC usp_Insert_A_Sales_Order_Detail 'sales005', 'pro005', 50, 0.0

EXEC usp_Insert_A_Sales_Order_Detail 'sales006', 'pro001', 20, 0.0
EXEC usp_Insert_A_Sales_Order_Detail 'sales006', 'pro002', 23, 0.0
EXEC usp_Insert_A_Sales_Order_Detail 'sales006', 'pro003', 25, 0.0
EXEC usp_Insert_A_Sales_Order_Detail 'sales006', 'pro004', 30, 0.0






