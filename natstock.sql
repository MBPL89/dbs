CREATE TABLE nation (
  natcode text PRIMARY KEY NOT NULL,
  natname text,
  exchrate REAL
);


INSERT INTO nation VALUES ('AUS','Australia',0.46000),
('IND','India',0.02280),
('UK','United Kingdom',1.00000),
('USA','United States',0.67000);



CREATE TABLE stock (
  stkcode text PRIMARY KEY NOT NULL,
  stkfirm text DEFAULT NULL,
  stkprice REAL DEFAULT NULL,
  stkqty REAL DEFAULT NULL,
  stkdiv REAL DEFAULT NULL,
  stkpe REAL DEFAULT NULL,
  natcode text DEFAULT NULL,
  FOREIGN KEY (natcode) REFERENCES nation (natcode)
);


INSERT INTO stock VALUES ('AR','Abyssinian Ruby',31.82,22010,1.32,13,'UK'),
('BD','Bombay Duck',25.55,167382,1.00,12,'IND'),
('BE','Burmese Elephant',0.07,154713,0.01,3,'UK'),
('BS','Bolivian Sheep',12.75,231678,1.78,11,'UK'),
('CS','Canadian Sugar',52.78,4716,2.50,15,'UK'),
('FC','Freedonia Copper',27.50,10529,1.84,16,'UK'),
('GP','Georgia Peach',2.35,387333,0.20,5,'USA'),
('ILZ','Indian Lead & Zinc',37.75,6390,3.00,12,'UK'),
('IR','Indooroopilly Ruby',15.92,56147,0.50,20,'AUS'),
('MG','Minnesota Gold',53.87,816122,1.00,25,'USA'),
('NE','Narembeen Emu',12.34,45619,1.00,8,'AUS'),
('NG','Nigerian Geese',35.00,12323,1.68,10,'UK'),
('PT','Patagonian Tea',55.25,12635,2.50,10,'UK'),
('QD','Queensland Diamond',6.73,89251,0.50,7,'AUS'),
('ROF','Royal Ostrich Farms',33.75,1234923,3.00,6,'UK'),
('SLG','Sri Lankan Gold',50.37,32868,2.68,16,'UK');
