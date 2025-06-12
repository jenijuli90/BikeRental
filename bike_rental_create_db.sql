-- Create the BikeRental Database
IF NOT EXISTS (SELECT name 
               FROM sys.databases 
               WHERE name = 'BikeRental')
BEGIN
    CREATE DATABASE BikeRental
END

-- Switch to the BikeRental Database
USE BikeRental

-- Drop and recreate the customer table
DROP TABLE IF EXISTS customer

CREATE TABLE customer (
    id          INT PRIMARY KEY,
    name        VARCHAR(100),  
    email       VARCHAR(50)
)

-- Drop and recreate the bike table
DROP TABLE IF EXISTS bike

CREATE TABLE bike (
    id              INT PRIMARY KEY,
    model           VARCHAR(50),
    category        VARCHAR(50),
    price_per_hour  DECIMAL(10, 2),
    price_per_day   DECIMAL(10, 2),
    status          VARCHAR(20)
)

-- Drop and recreate the rental table
DROP TABLE IF EXISTS rental

CREATE TABLE rental (
    id              INT PRIMARY KEY,
    customer_id     INT,
    bike_id         INT,
    start_datetime  DATETIME,
    duration        INT,
    total_paid      DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (bike_id) REFERENCES bike(id)
)

-- Drop and recreate the membership_type table
DROP TABLE IF EXISTS membership_type

CREATE TABLE membership_type (
    id          INT PRIMARY KEY,
    name        VARCHAR(50),
    description VARCHAR(500),
    price       DECIMAL(10, 2)
)

-- Drop and recreate the membership table
DROP TABLE IF EXISTS membership

CREATE TABLE membership (
    id                  INT PRIMARY KEY,
    membership_type_id  INT,
    customer_id         INT,
    start_date          DATE,
    end_date            DATE,
    total_paid          DECIMAL(10, 2),
    FOREIGN KEY (membership_type_id) REFERENCES membership_type(id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
)