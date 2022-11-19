-- ************************************** [Category]
CREATE TABLE [Category]
(
 [CategoryID]  tinyint NOT NULL ,
 [Name]        varchar(50) NOT NULL ,
 [Description] varchar(500) NULL ,


 CONSTRAINT [PK_category] PRIMARY KEY CLUSTERED ([CategoryID] ASC)
);
GO

-- ************************************** [SubCategory]
CREATE TABLE [SubCategory]
(
 [SubCategoryID] smallint NOT NULL ,
 [CategoryID]    tinyint NOT NULL ,
 [Name]          varchar(50) NOT NULL ,


 CONSTRAINT [PK_subcategory] PRIMARY KEY CLUSTERED ([SubCategoryID] ASC),
 CONSTRAINT [FK_33] FOREIGN KEY ([CategoryID])  REFERENCES [Category]([CategoryID])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_34] ON [SubCategory] 
 (
  [CategoryID] ASC
 )

GO

-- ************************************** [Author]
CREATE TABLE [Author]
(
 [AuthorID] smallint NOT NULL ,
 [Name]     varchar(100) NOT NULL ,
 [LastName] varchar(100) NOT NULL ,


 CONSTRAINT [PK_author] PRIMARY KEY CLUSTERED ([AuthorID] ASC)
);
GO

-- ************************************** [Book]
CREATE TABLE [Book]
(
 [ISBN]    varchar(50) NOT NULL ,
 [Title]   varchar(250) NOT NULL ,
 [Author]  varchar(50) NOT NULL ,
 [Edition] int NOT NULL ,


 CONSTRAINT [PK_56] PRIMARY KEY CLUSTERED ([ISBN] ASC)
);
GO