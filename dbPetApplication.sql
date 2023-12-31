CREATE DATABASE PetApplication
GO

USE PetApplication
GO

CREATE TABLE Pet
(
	IdPet CHAR(10)NOT NULL,
	IdPetCategory CHAR(10)NOT NULL,
	CategoryPet NVARCHAR(100)NOT NULL,
	NamePet NVARCHAR(100)NOT NULL,
	Price INT ,
	PRIMARY KEY (IdPet,IdPetCategory)
)
GO



INSERT INTO Pet (IdPet, IdPetCategory, CategoryPet, NamePet, Price) VALUES ('A01', 'D01', N'Dog', N'Husky',2000)
INSERT INTO Pet (IdPet, IdPetCategory, CategoryPet, NamePet, Price) VALUES ('A02', 'D01', N'Dog', N'Alaska',2000)
INSERT INTO Pet (IdPet, IdPetCategory, CategoryPet, NamePet, Price) VALUES ('A03', 'D01', N'Dog', N'Pitbull',2000)
INSERT INTO Pet (IdPet, IdPetCategory, CategoryPet, NamePet, Price) VALUES ('A04', 'D01', N'Dog', N'Corgi',2000)
INSERT INTO Pet (IdPet, IdPetCategory, CategoryPet, NamePet, Price) VALUES ('A05', 'C01', N'Cat', N'Ragdoll',2000)

UPDATE dbo.Pet SET IdPetCategory=,IdPetCategory,NamePet,PRICE  WHERE IdPet= 

UPDATE Pet SET NamePet = N'{0}', IdPetCategory = {1} , PRICE '{2}' WHERE Id = {3})

CREATE TABLE PetCategory
(
	IdPet CHAR(10)NOT NULL,
	IdPetCategory CHAR(10)NOT NULL,
	CategoryPet NVARCHAR(100)NOT NULL,
	PRIMARY KEY (IdPet,IdPetCategory)
)



INSERT INTO PetCategory (IdPet, IdPetCategory, CategoryPet) VALUES ('A01', 'D01', N'Dog')
INSERT INTO PetCategory (IdPet, IdPetCategory, CategoryPet) VALUES ('A02', 'D01', N'Dog')
INSERT INTO PetCategory (IdPet, IdPetCategory, CategoryPet) VALUES ('A03', 'D01', N'Dog')
INSERT INTO PetCategory (IdPet, IdPetCategory, CategoryPet) VALUES ('A04', 'D01', N'Dog')
INSERT INTO PetCategory (IdPet, IdPetCategory, CategoryPet) VALUES ('A05', 'C01', N'Cat')


SELECT * FROM PetCategory

CREATE TABLE Account
(
	IdUser CHAR(10)NOT NULL,
	Displayname NVARCHAR(100) NOT NULL,
	Username NVARCHAR(100) NOT NULL,
	Password NVARCHAR(100) NOT NULL,
	Type INT NOT NULL,
	Role NVARCHAR(100) NOT NULL,
	PRIMARY KEY (IdUser)
)
GO

SELECT * FROM Account
INSERT INTO Account (IdUser, Displayname, Username, Password, Type, Role) VALUES ('U01', N'Hoang Son', N'hs', N'1',1, N'admin')
INSERT INTO Account (IdUser, Displayname, Username, Password, Type, Role) VALUES ('U02', N'Gia Han', N'gh', N'0',1, N'user')

UPDATE dbo.Account SET Type='0'  WHERE IdUser='3'	

SELECT * FROM dbo.Account WHERE Username='hs' AND password='1'

CREATE TABLE PetService
(
	IdService CHAR(10),
	NameService CHAR(10),
	Price INT,
	PRIMARY KEY (IdService)
)
GO
INSERT dbo.PetService(IdService,NameService,Price) VALUES ('S01',N'Shower',50)
INSERT dbo.PetService(IdService,NameService,Price) VALUES ('T01',N'Take Care',150)
INSERT dbo.PetService(IdService,NameService,Price) VALUES ('F01',N'Food',250)



CREATE TABLE PetList
(
	IdPet CHAR(10),
	NamePet NVARCHAR(100),
	Status NVARCHAR(100),
	PRIMARY KEY (IdPet)
)
GO

INSERT dbo.PetList(IdPet,N	amePet,Status) VALUES ('A01',N'Husky',N'Ready')
INSERT dbo.PetList(IdPet,NamePet,Status) VALUES ('A02',N'Alaska',N'Ready')
INSERT dbo.PetList(IdPet,NamePet,Status) VALUES ('A03',N'Pitbull',N'Ready')
INSERT dbo.PetList(IdPet,NamePet,Status) VALUES ('A04',N'Corgi',N'Ready')
INSERT dbo.PetList(IdPet,NamePet,Status) VALUES ('A05',N'Ragdoll',N'Ready')


UPDATE dbo.PetList SET Status = 'Not Ready' WHERE NamePet = N'Husky'



UPDATE dbo.PetList SET Status = 1 WHERE NamePet=N'Dog4'

CREATE TABLE Bill
(
	IdBill CHAR(10),
	IdPet CHAR(10),
	DateCheckIn DATETIME,
	DateCheckOut DATETIME,
	Status NVARCHAR(100),
	PRIMARY KEY (IdBill,IdPet)
)
GO

INSERT INTO Bill (IdBill, IdPet, DateCheckIn, DateCheckOut, Status) VALUES ('B01', 'A01',GETDATE(), null, N'Unpaid')
INSERT INTO Bill (IdBill, IdPet, DateCheckIn, DateCheckOut, Status) VALUES ('B02', 'A02',GETDATE(), null, N'Unpaid')
INSERT INTO Bill (IdBill, IdPet, DateCheckIn, DateCheckOut, Status) VALUES ('B03', 'A03',GETDATE(), null, N'Unpaid')
INSERT INTO Bill (IdBill, IdPet, DateCheckIn, DateCheckOut, Status) VALUES ('B04', 'A04',GETDATE(), null, N'Paid')
INSERT INTO Bill (IdBill, IdPet, DateCheckIn, DateCheckOut, Status) VALUES ('B05', 'A05',GETDATE(), null, N'Paid')


CREATE TABLE BillInfo
(
	IdBill CHAR(10),
	IdPet CHAR(10),
	count INT,
	PRIMARY KEY (IdBill,IdPet)
)
GO



INSERT dbo.BillInfo(IdBill,IdPet,count) VALUES ('B01','A01',1)
INSERT dbo.BillInfo(IdBill,IdPet,count) VALUES ('B02','A02',1)
INSERT dbo.BillInfo(IdBill,IdPet,count) VALUES ('B03','A03',1)
INSERT dbo.BillInfo(IdBill,IdPet,count) VALUES ('B04','A04',1)
INSERT dbo.BillInfo(IdBill,IdPet,count) VALUES ('B05','A05',1)

SELECT p.NamePet, bi.count,p.PRICE AS totalPrice FROM BillInfo AS bi, Bill AS b,Pet AS p 
WHERE bi.IdBill = b.IdBill AND bi.IdPet= p.IdPet AND b.Status='UnPaid' AND b.IdPet = 'A01'	

	
SELECT * FROM PetCategory
SELECT * FROM PetList
SELECT * FROM Bill
SELECT * FROM BillInfo
SELECT * FROM PetService , Account

SELECT * FROM dbo.Account WHERE Username=N'hs' AND PassWord='1'
----
---
DECLARE @i	INT = 0
WHILE @i <=4
BEGIN
	INSERT dbo.PetList(IdPet,NamePet,Status) VALUES ('A01',N'A0'+ CAST (@i AS NVARCHAR(100)),0) 
SET @i = @i + 1
END 

---Storeproc
----
----
CREATE PROCEDURE USP_GetAccountByUserName
@username nvarchar(100)
AS
BEGIN 
	SELECT * FROM dbo.Account WHERE Username = N'hs'
END
GO
EXEC USP_GetAccountByUserName @username = N'hs' 
---
----
CREATE PROCEDURE USP_GetPetList
AS
	BEGIN
		SELECT * FROM PetList
	END

exec USP_GetPetList
----
----
CREATE PROCEDURE USP_InsertBill
@idpet INT, @i INT = 0
AS
	BEGIN
		INSERT dbo.Bill(IdBill,IdPet,DateCheckIn,DateCheckOut,Status) VALUES ('B06',@idpet,GETDATE(),null,0)
	END
exec USP_InsertBill @idpet = ''
----
----
CREATE PROCEDURE USP_InsertBillInfo
@idbill INT, @idpet INT, @count INT
AS
BEGIN
	DECLARE @isExitsBillInfo INT;
	DECLARE @petCount INT = 1;
	SELECT @isExitsBillInfo = IdPet FROM dbo.BillInfo WHERE IdBill = @idbill AND IdPet = @idpet
	IF(@isExitsBillInfo >0)
	BEGIN
		UPDATE dbo.BillInfo SET count = @petCount + @count WHERE IdPet = IdPet
	END 
	ELSE 
	BEGIN
		INSERT dbo.BillInfo(IdBill,IdPet,count) VALUES (@idbill,@idpet,@count)
	END

END
	
exec USP_InsertBillInfo @idbill , @idpet , @count 
----
----
CREATE PROC USP_UpdateAccount
@username NVARCHAR(100),@displayname NVARCHAR(100),@password NVARCHAR(100),@newpassword NVARCHAR(100)
AS 
BEGIN 
	DECLARE @isRightPass INT =0
	SELECT @isRightPass = COUNT(*) FROM dbo.Account WHERE Username = @username AND Password = @password

	IF(@isRightPass =1)
	BEGIN
		IF(@newpassword = null OR @newpassword ='')
		BEGIN
			UPDATE dbo.Account SET Displayname= @displayname,Password=@newpassword  WHERE Username=@username
		END

	END
END

