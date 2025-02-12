CREATE TABLE products (
productCode text PRIMARY KEY NOT NULL,
productName text NOT NULL,
productLine text NOT NULL,
productScale text NOT NULL,
productVendor text NOT NULL,
productDescription text NOT NULL,
quantityInStock INTEGER NOT NULL,
buyPrice REAL NOT NULL,
MSRP REAL NOT NULL,
FOREIGN KEY(productLine) REFERENCES productlines(productLine)
);


INSERT INTO products (productCode, productName, productScale, productVendor, productDescription, quantityInStock, buyPrice, MSRP)
VALUES 
('S10_1678','1969 Harley Davidson Ultimate Chopper','Motorcycles','1:10','Min Lin Diecast','This replica features working kickstand, front suspension, gear-shift lever, footbrake lever, drive chain, wheels and steering. All parts are particularly delicate due to their precise scale and require special care and attention.',7933,48.81,95.7);
