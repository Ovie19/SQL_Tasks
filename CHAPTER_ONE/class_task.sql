CREATE DATABASE ecommerce_db;

CREATE TABLE users (
    userID INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(50) UNIQUE,
    firstname VARCHAR(30),
    lastname VARCHAR(30),
    address VARCHAR(300)
);

CREATE TABLE products (
    productID INT AUTO_INCREMENT PRIMARY KEY,
    price DECIMAL(50,2),
    quantity_available INT,
    quantity_sold INT ,
    product_category VARCHAR(15),
    product_description VARCHAR(150)
);

CREATE TABLE orders (
    orderID INT AUTO_INCREMENT PRIMARY KEY,
    amount DECIMAL (50,2),
    quantity INT,
    userID INT,
    productID INT,
    FOREIGN KEY (userID) REFERENCES users(userID),
    FOREIGN KEY (productID) REFERENCES products(productID)
);