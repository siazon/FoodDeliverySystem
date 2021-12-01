 -- mysql
 DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `user_email` varchar(64)  NOT NULL,
  `user_password` varchar(6) DEFAULT NULL,
  `user_role` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`user_email`)
) ;

DROP TABLE IF EXISTS `tb_user_address`;
CREATE TABLE `tb_user_address` (
  `address_id` int NOT NULL AUTO_INCREMENT,
  `user_email` varchar(64) DEFAULT NULL,
  `county` varchar(64) DEFAULT NULL,
  `street` varchar(64) DEFAULT NULL,
  `address` varchar(64) DEFAULT NULL,
  `phone` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`address_id`)
) ;
alter table tb_user_address add foreign key useraddress_ibfk2(user_email) references tb_user(user_email);


DROP DATABASE IF EXISTS onlinetus;
CREATE DATABASE onlinetus;
USE onlinetus;


DROP TABLE IF EXISTS food_group;
CREATE TABLE food_group (
		group_id INT AUTO_INCREMENT NOT NULL,
        group_name TEXT NOT NULL,
        PRIMARY KEY(group_id) );
        
	INSERT INTO food_group VALUES (null, 'Starter');
    INSERT INTO food_group VALUES (null, 'Main');
    INSERT INTO food_group VALUES (null, 'Dessert');
    INSERT INTO food_group VALUES (null, 'Side Order');
    INSERT INTO food_group VALUES (null, 'Drinks');

DROP TABLE IF EXISTS menu;
CREATE TABLE menu (
		food_id INT AUTO_INCREMENT NOT NULL,
        PRIMARY KEY(food_id),
        group_id INT NOT NULL,
        FOREIGN KEY (group_id) REFERENCES food_group(group_id),
        name TEXT NOT NULL,
        description TEXT NOT NULL,
        allergies TEXT NOT NULL,
        price DOUBLE NOT NULL,
        stock INT NOT NULL
        );
        
	INSERT INTO menu VALUES (null, 1, 'Bruchetta', 'Toasted bruchetta with homemade tomato salsa', '1, 3, 5, 4', 5.00, 8);
	INSERT INTO menu VALUES ( null, 1, 'Cheesy Garlic Bread', 'garlic toasted pizza bread loaded with cheese', '1, 3, 5, 4', 5.00, 3);
    INSERT INTO menu VALUES ( null, 1, 'Soup', 'veg', '1, 3, 5, 4', 5.00, 1);
    INSERT INTO menu VALUES ( null, 1, 'Garlic Mushrooms', 'deep fried breaded mushrooms with garlic aoli', '1, 3, 5, 4', 5.00, 1);
    INSERT INTO menu VALUES ( null, 2, 'Cheese Burger', 'local beef and cheese', '1, 3, 5, 4', 17.00, 1);
    INSERT INTO menu VALUES ( null, 2, 'Vegetable Curry', 'aromatic with rice', '1, 3, 5, 4', 15.00, 1);
    INSERT INTO menu VALUES ( null, 2, 'Pizza', 'Hawaiian', '1, 3, 5, 4', 12.95, 1);
    INSERT INTO menu VALUES ( null, 2, 'Goats Cheese & Walnut Salad', 'salad', '1, 3, 5, 4', 5.05, 1);
    INSERT INTO menu VALUES ( null, 3, 'Cheescake', 'Smashed Honeycomb', '1, 3, 5, 4', 5.00, 1);
    INSERT INTO menu VALUES ( null, 3, 'Brownie', 'Chocolate', '1, 3, 5, 4', 5.00, 1);
    INSERT INTO menu VALUES ( null, 4, 'Sweet Potato Fries', 'Thinly sliced homemade sweet potato fries with sea slat', '1, 3, 5, 4', 5.00, 1);
INSERT INTO menu VALUES ( null, 4, 'Side Salad', 'Fresh garden salad', '1, 3, 5', 3.00, 1);
	INSERT INTO menu VALUES ( null, 5, 'coke', 'can', '1, 3, 5, 4', 1.20,1);
     
    



