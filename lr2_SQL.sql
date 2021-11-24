CREATE TABLE `Employees` (
	`IDEmployee` INT NOT NULL AUTO_INCREMENT,
	`FirstName` varchar(255) NOT NULL,
	`LastName` varchar(255) NOT NULL,
	`Phone` varchar(255) NOT NULL,
	`Address` varchar(255) NOT NULL,
	`Position` varchar(255) NOT NULL,
	PRIMARY KEY (`IDEmployee`)
);

CREATE TABLE `Positions` (
	`IDPosition` INT NOT NULL AUTO_INCREMENT,
	`Name` varchar(255) NOT NULL AUTO_INCREMENT,
	`Responsibilities` varchar(255) NOT NULL,
	`Salary` INT NOT NULL,
	PRIMARY KEY (`IDPosition`)
);

CREATE TABLE `Order` (
	`IDOrder` INT NOT NULL AUTO_INCREMENT,
	`Date` DATE NOT NULL,
	`Customer` INT NOT NULL,
	`Employee` INT NOT NULL,
	`Comment` varchar(255) NOT NULL,
	`OrderCost` INT NOT NULL,
	`DateOfReadiness` DATE NOT NULL,
	PRIMARY KEY (`IDOrder`)
);

CREATE TABLE `Services` (
	`IDService` INT NOT NULL AUTO_INCREMENT,
	`Name` varchar(255) NOT NULL,
	`ServicePrice` INT NOT NULL,
	PRIMARY KEY (`IDService`)
);

CREATE TABLE `ServiceOrder` (
	`IDServiceOrder` INT NOT NULL AUTO_INCREMENT,
	`OrderNumber` INT NOT NULL,
	`SelectedServices` INT NOT NULL,
	PRIMARY KEY (`IDServiceOrder`)
);

CREATE TABLE `Customers` (
	`IDCustomer` INT NOT NULL AUTO_INCREMENT,
	`FirstName` varchar(255) NOT NULL,
	`LastName` varchar(255) NOT NULL,
	`Phone` varchar(255) NOT NULL,
	`Address` varchar(255) NOT NULL,
	PRIMARY KEY (`IDCustomer`)
);

CREATE TABLE `ClientsBelongings` (
	`IDBelonging` INT NOT NULL AUTO_INCREMENT,
	`IDOrder` INT NOT NULL,
	`Name` varchar(255) NOT NULL,
	`Description` varchar(255) NOT NULL,
	PRIMARY KEY (`IDBelonging`)
);

ALTER TABLE `Employees` ADD CONSTRAINT `Employees_fk0` FOREIGN KEY (`Position`) REFERENCES `Positions`(`IDPosition`);

ALTER TABLE `Order` ADD CONSTRAINT `Order_fk0` FOREIGN KEY (`Customer`) REFERENCES `Customers`(`IDCustomer`);

ALTER TABLE `Order` ADD CONSTRAINT `Order_fk1` FOREIGN KEY (`Employee`) REFERENCES `Employees`(`IDEmployee`);

ALTER TABLE `ServiceOrder` ADD CONSTRAINT `ServiceOrder_fk0` FOREIGN KEY (`OrderNumber`) REFERENCES `Order`(`IDOrder`);

ALTER TABLE `ServiceOrder` ADD CONSTRAINT `ServiceOrder_fk1` FOREIGN KEY (`SelectedServices`) REFERENCES `Services`(`IDService`);

ALTER TABLE `ClientsBelongings` ADD CONSTRAINT `ClientsBelongings_fk0` FOREIGN KEY (`IDOrder`) REFERENCES `Order`(`IDOrder`);








