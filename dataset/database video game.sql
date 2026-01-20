-- Tạo database
create database VideoGameSales;

-- Tạo bảng genre
CREATE TABLE genre (
    id INT PRIMARY KEY,
    genre_name VARCHAR(100)
);

--Tạo bảng game
CREATE TABLE game (
    id INT PRIMARY KEY,
    genre_id INT,
    game_name VARCHAR(255),
    CONSTRAINT FK_game_genre 
        FOREIGN KEY (genre_id) REFERENCES genre(id)
);

--Tạo bảng publisher
CREATE TABLE publisher (
    id INT PRIMARY KEY,
    publisher_name VARCHAR(255)
);


-- Tạo bảng game_publisher
CREATE TABLE game_publisher (
    id INT PRIMARY KEY,
    game_id INT,
    publisher_id INT,
    CONSTRAINT FK_gp_game 
        FOREIGN KEY (game_id) REFERENCES game(id),
    CONSTRAINT FK_gp_publisher 
        FOREIGN KEY (publisher_id) REFERENCES publisher(id)
);

--Tạo bảng platform
CREATE TABLE platform (
    id INT PRIMARY KEY,
    platform_name VARCHAR(100)
);


-- Tạo bảng game_platform
CREATE TABLE game_platform (
    id INT PRIMARY KEY,
    game_publisher_id INT,
    platform_id INT,
    release_year INT,
    CONSTRAINT FK_gp_gamepublisher 
        FOREIGN KEY (game_publisher_id) REFERENCES game_publisher(id),
    CONSTRAINT FK_gp_platform 
        FOREIGN KEY (platform_id) REFERENCES platform(id)
);

-- Tạo bảng region
CREATE TABLE region (
    id INT PRIMARY KEY,
    region_name VARCHAR(100)
);


-- Tạo bảng region_sales
CREATE TABLE region_sales (
    region_id INT,
    game_platform_id INT,
    num_sales INT,
    PRIMARY KEY (region_id, game_platform_id),
    CONSTRAINT FK_rs_region 
        FOREIGN KEY (region_id) REFERENCES region(id),
    CONSTRAINT FK_rs_gameplatform 
        FOREIGN KEY (game_platform_id) REFERENCES game_platform(id)
);
