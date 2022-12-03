CREATE DATABASE [COURSE]
GO

USE [COURSE]
GO
CREATE SCHEMA [C01]
GO

CREATE TABLE [C01].[Students]
(
[ID] [INT] NOT NULL,
[Name] [NVARCHAR] (50) NOT NULL,
[Description] [NVARCHAR](100) NULL
)


CREATE TABLE [C01].[Teachers]
(
[ID] [INT] NOT NULL,
[Name] [NVARCHAR] (50) NOT NULL,
[Description] [NVARCHAR] (100) NULL
)


CREATE TABLE [C01].[Group]
(
[ID] [INT] NOT NULL,
[Name] [NVARCHAR](50) NOT NULL
[Description] [NVARCHAR] (100) NULL
)


CREATE TABLE [C01].[Groups_Info]
(
[ID] [INT] NOT NULL,
[Group_ID] [INT] NOT NULL,
[Teachers_ID] [INT] NOT NULL,
[Students_ID] [INT] NOT NULL,
[Description] [NVARCHAR] (200) NULL

)


CREATE TABLE [C01].[Lessons]
(
[ID] [INT] NOT NULL,
[Group_Info_ID] [INT] NOT NULL,
[Begin_Date] [DATETIME] NOT NULL,
[End_Date] [DATETIME] NOT NULL,
[Description] [NVARCHAR] (200) NULL
)


INSERT INTO [C01].[Students] ([ID], [Name])
VALUES (201,N'Nərgiz');

INSERT INTO [C01].[Students] ([ID], [Name])
VALUES (202, N'Saleh');

INSERT INTO [C01].[Students] ([ID], [Name])
VALUES (203,N'Rüfət');

INSERT INTO [C01].[Students] ([ID], [Name])
VALUES (204, N'Lamiyə');




INSERT INTO [C01].[Teachers] ([ID],[Name])
VALUES (101,N'Nazim');

INSERT INTO [C01].[Teachers] ([ID],[Name])
VALUES (102, N'Vaqif');




INSERT INTO [C01].[Group] ([ID],[Name])
VALUES (401,'Group1');

INSERT INTO [C01].[Group] ([ID],[Name])
VALUES (402,'Group2');



INSERT INTO [C01].[Groups_Info] ([ID],[Group_ID],[Teachers_ID],[Students_ID])
VALUES (51,401,101,201);

INSERT INTO [C01].[Groups_Info] ([ID],[Group_ID],[Teachers_ID],[Students_ID])
VALUES (52,401,101,203);

INSERT INTO [C01].[Groups_Info] ([ID],[Group_ID],[Teachers_ID],[Students_ID])
VALUES (53,402,102,202);

INSERT INTO [C01].[Groups_Info] ([ID],[Group_ID],[Teachers_ID],[Students_ID])
VALUES (54,402,102,204);



INSERT INTO [C01].[Lessons] ([ID],[Group_Info_ID],[Begin_Date],[End_Date])
VALUES (605,51,'01/05/2021  18:30' , '01/05/2021 20:30');


INSERT INTO [C01].[Lessons] ([ID],[Group_Info_ID],[Begin_Date],[End_Date])
VALUES (606,53,'01/05/2021 18:30', '01/05/2021 20:30');


INSERT INTO [C01].[Lessons] ([ID],[Group_Info_ID],[Begin_Date],[End_Date])
VALUES (607,52,'01/05/2021 18:30','01/05/2021 19:30');


INSERT INTO [C01].[Lessons] ([ID],[Group_Info_ID],[Begin_Date],[End_Date])
VALUES (608,54,'02/05/2021 18:30', '02/02/2021 20:30') ;


INSERT INTO [C01].[Lessons] ([ID],[Group_Info_ID],[Begin_Date],[End_Date])
VALUES (609,53, '02/05/2021 18:30', '02/05/2021 19:30');




SELECT * FROM[C01].[Group]
SELECT * FROM [C01].[Groups_Info]
SELECT * FROM [C01].[Students]
SELECT * FROM [C01].[Teachers]


--Hansi telebe hansi qrupdadir?
SELECT 
G.Name as 'Qrup' , S.Name 'Telebe'
FROM 
[C01].[Group] G 
join 
[C01].[Groups_Info] GI on GI.Group_ID=G.ID
join
[C01].[Students] S on S.ID=GI.Students_ID;


---------------------------------------------------------


--Hansi muellim hansi telebeye ders kecir?

SELECT
T.Name 'Muellim', S.Name 'Telebe'
FROM
[C01].[Teachers] T
join
[C01].[Groups_Info] G on G.Teachers_ID=T.ID
join
[C01].[Students] S on G.Students_ID=S.ID;


----------------------------------------------------------

--Telebenin qrupu ve muellimi?

SELECT 
G.Name 'Qrup', T.Name 'Muellim', S.Name 'Telebe'
FROM
[C01].[Group] G 
JOIN
[C01].[Groups_Info] GI ON GI.Group_ID=G.ID
JOIN
[C01].[Teachers] T ON GI.Teachers_ID=T.ID
JOIN 
[C01].[Students] S ON GI.Students_ID=S.ID;