--USE master
--GO

--DROP DATABASE IF EXISTS CRUD_IN_ADO_NET_DB
--GO

--CREATE DATABASE CRUD_IN_ADO_NET_DB
--GO

--USE CRUD_IN_ADO_NET_DB
--GO

--CREATE TABLE dbo.person
--(
--	person_id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
--	person_name VARCHAR(50) NULL,
--	person_state VARCHAR(50) NULL
--)

--INSERT INTO dbo.person(person_name, person_state) VALUES ('Alex Ferguson', 'Manchester')
--INSERT INTO dbo.person(person_name, person_state) VALUES ('Peter Pan', 'Liverpool')
--INSERT INTO dbo.person(person_name, person_state) VALUES ('Hillary Duff', 'New York')
--INSERT INTO dbo.person(person_name, person_state) VALUES ('Mary Rose', 'Washington')
--INSERT INTO dbo.person(person_name, person_state) VALUES ('Bobby Charlton', 'London')

--------------------------------------------------------------------------------------------

USE CRUD_IN_ADO_NET_DB
GO

SELECT person_id, person_name, person_state FROM dbo.person

UPDATE dbo.person SET person_name = 'David', person_state = 'Portland' WHERE person_id = '1' 

