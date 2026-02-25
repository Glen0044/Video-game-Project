CREATE DATABASE VideoGameDW;
GO

USE VideoGameDW;
GO

-- Bảng Dim
CREATE TABLE DimGame (
    game_key INT IDENTITY(1,1) PRIMARY KEY,
    game_name NVARCHAR(255)
);

CREATE TABLE DimGenre (
    genre_key INT IDENTITY(1,1) PRIMARY KEY,
    genre_name NVARCHAR(100)
);

CREATE TABLE DimPlatform (
    platform_key INT IDENTITY(1,1) PRIMARY KEY,
    platform_name NVARCHAR(50)
);

CREATE TABLE DimPublisher (
    publisher_key INT IDENTITY(1,1) PRIMARY KEY,
    publisher_name NVARCHAR(255)
);

CREATE TABLE DimRegion (
    region_key INT IDENTITY(1,1) PRIMARY KEY,
    region_name NVARCHAR(50)
);

-- Bảng Fact
CREATE TABLE FactSales (
    game_key INT NOT NULL,
    genre_key INT NOT NULL,
    platform_key INT NOT NULL,
    publisher_key INT NOT NULL,
    region_key INT NOT NULL,
    num_sales DECIMAL(10,2),

    CONSTRAINT FK_Fact_Game FOREIGN KEY (game_key) 
        REFERENCES DimGame(game_key),

    CONSTRAINT FK_Fact_Genre FOREIGN KEY (genre_key) 
        REFERENCES DimGenre(genre_key),

    CONSTRAINT FK_Fact_Platform FOREIGN KEY (platform_key) 
        REFERENCES DimPlatform(platform_key),

    CONSTRAINT FK_Fact_Publisher FOREIGN KEY (publisher_key) 
        REFERENCES DimPublisher(publisher_key),

    CONSTRAINT FK_Fact_Region FOREIGN KEY (region_key) 
        REFERENCES DimRegion(region_key)
);

