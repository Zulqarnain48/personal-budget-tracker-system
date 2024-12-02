-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema PersonalBudget
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema PersonalBudget
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `PersonalBudget` ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`user` (
  `username` VARCHAR(16) NOT NULL,
  `email` VARCHAR(255) NULL,
  `password` VARCHAR(32) NOT NULL,
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP);


-- -----------------------------------------------------
-- Table `mydb`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`category` (
  `category_id` INT NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`category_id`));

USE `PersonalBudget` ;

-- -----------------------------------------------------
-- Table `PersonalBudget`.`Users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PersonalBudget`.`Users` (
  `user_id` INT NULL AUTO_INCREMENT,
  `Name` VARCHAR(50) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX (`Name` ASC) VISIBLE,
  UNIQUE INDEX (`email` ASC) VISIBLE);


-- -----------------------------------------------------
-- Table `PersonalBudget`.`Income`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PersonalBudget`.`Income` (
  `user_id` INT NOT NULL,
  `amount` DECIMAL(10,2) NOT NULL,
  `source` VARCHAR(100) NULL DEFAULT NULL,
  `Income_date` DATE NOT NULL,
  `Description` TEXT NULL DEFAULT NULL,
  INDEX (`user_id` ASC) VISIBLE,
  CONSTRAINT ``
    FOREIGN KEY (`user_id`)
    REFERENCES `PersonalBudget`.`Users` (`user_id`));


-- -----------------------------------------------------
-- Table `PersonalBudget`.`Budget`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PersonalBudget`.`Budget` (
  `User_ID` INT NOT NULL,
  `Monthly_Budget` DECIMAL(10,2) NOT NULL,
  `Budget_Date` DATE NOT NULL,
  INDEX (`User_ID` ASC) VISIBLE,
  CONSTRAINT ``
    FOREIGN KEY (`User_ID`)
    REFERENCES `PersonalBudget`.`Users` (`user_id`));


-- -----------------------------------------------------
-- Table `PersonalBudget`.`Expense`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PersonalBudget`.`Expense` (
  `User_ID` INT NOT NULL,
  `Amount` DECIMAL(10,2) NOT NULL,
  `Expense_Date` DATE NOT NULL,
  `Description` TEXT NULL DEFAULT NULL,
  INDEX (`User_ID` ASC) VISIBLE,
  CONSTRAINT ``
    FOREIGN KEY (`User_ID`)
    REFERENCES `PersonalBudget`.`Users` (`user_id`));


-- -----------------------------------------------------
-- Table `PersonalBudget`.`Saving`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PersonalBudget`.`Saving` (
  `User_ID` INT NOT NULL,
  `Amount` DECIMAL(10,2) NOT NULL,
  `Saving_Date` DATE NULL DEFAULT NULL,
  `Goal` TEXT NULL DEFAULT NULL,
  INDEX (`User_ID` ASC) VISIBLE,
  CONSTRAINT ``
    FOREIGN KEY (`User_ID`)
    REFERENCES `PersonalBudget`.`Users` (`user_id`)
    ON DELETE CASCADE);


-- -----------------------------------------------------
-- Table `PersonalBudget`.`Report`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PersonalBudget`.`Report` (
  `User_ID` INT NOT NULL,
  `Report_Type` VARCHAR(50) NOT NULL,
  `General_Date` DATE NOT NULL,
  `Details` TEXT NULL DEFAULT NULL,
  INDEX (`User_ID` ASC) VISIBLE,
  CONSTRAINT ``
    FOREIGN KEY (`User_ID`)
    REFERENCES `PersonalBudget`.`Users` (`user_id`)
    ON DELETE CASCADE);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
