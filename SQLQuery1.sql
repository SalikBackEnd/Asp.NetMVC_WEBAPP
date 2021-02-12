CREATE DATABASE mvcdb
GO
Use mvcdb
GO
CREATE TABLE Users(
Id int NOT NULL Identity(1,1),
Username nvarchar(40) NOT NULL,
Email nvarchar(40) NOT NULL UNIQUE,
Password nvarchar(40) NOT NULL,
Status varchar(10) DEFAULT 'InActive' NOT NULL,
PRIMARY KEY(Id),
);
GO
CREATE TABLE Roles(
Id int NOT NULL Identity(1,1),
Name varchar(40) NOT NULL,
PRIMARY KEY(Id),
);
GO
CREATE TABLE UserRoles(
Id int NOT NULL Identity(1,1),
UserId int NOT NULL,
RoleId int NOT NULL ,
PRIMARY KEY(Id),
FOREIGN KEY(UserId) REFERENCES Users(Id),
FOREIGN KEY(RoleId) REFERENCES Roles(Id),
);
Go
CREATE TABLE HistoryMark(
Id int NOT NULL IDENTITY(1,1),
UserId int NOT NULL,
ActionDate DATE NOT NULL DEFAULT GETDATE(),
ActionTime TIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
Active bit NOT NULL,
PRIMARY KEY(Id),
FOREIGN Key(UserId) REFERENCES Users(Id),
);
GO
INSERT INTO Users(Username,Email,Password) VALUES('Admin','admin@email.com','admin123');
GO

DECLARE @USERID AS INT
SET @USERID=SCOPE_IDENTITY();
IF OBJECT_ID('tempdb..#TempTbl') IS NOT NULL DROP TABLE #TempTbl1
SELECT @USERID AS userid into #TempTbl1
GO
INSERT INTO Roles(Name) VALUES('SuperAdmin');
GO
DECLARE @ROLEID AS INT
SET @ROLEID=SCOPE_IDENTITY()
IF OBJECT_ID('tempdb..#TempTbl') IS NOT NULL DROP TABLE #TempTbl
SELECT @ROLEID AS roleid into #TempTbl
GO
DECLARE @ROLEID AS INT
SELECT @ROLEID = roleid FROM #TempTbl
DECLARE @USERID AS INT
SELECT @USERID=userid FROM #TempTbl1
INSERT INTO UserRoles(UserId,RoleId) Values(@USERID,@ROLEID);