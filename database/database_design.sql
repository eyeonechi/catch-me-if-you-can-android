-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema oz1zlgdxpvc102hu
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema oz1zlgdxpvc102hu
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `oz1zlgdxpvc102hu` DEFAULT CHARACTER SET utf8 ;
USE `oz1zlgdxpvc102hu` ;

-- -----------------------------------------------------
-- Table `oz1zlgdxpvc102hu`.`account`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oz1zlgdxpvc102hu`.`account` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `user_level` INT NOT NULL,
  `location` VARCHAR(45) NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oz1zlgdxpvc102hu`.`user_chatlog`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oz1zlgdxpvc102hu`.`user_chatlog` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `content` VARCHAR(300) NOT NULL,
  `to_user` INT NOT NULL,
  `read_status` INT NOT NULL,
  `from_user` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_user_chatlog_account1_idx` (`to_user` ASC),
  CONSTRAINT `fk_user_chatlog_account1`
    FOREIGN KEY (`to_user`)
    REFERENCES `oz1zlgdxpvc102hu`.`account` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oz1zlgdxpvc102hu`.`friend`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oz1zlgdxpvc102hu`.`friend` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `self_id` INT NOT NULL,
  `friend_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_friend_account1_idx` (`self_id` ASC),
  INDEX `fk_friend_account2_idx` (`friend_id` ASC),
  CONSTRAINT `fk_friend_account1`
    FOREIGN KEY (`self_id`)
    REFERENCES `oz1zlgdxpvc102hu`.`account` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_friend_account2`
    FOREIGN KEY (`friend_id`)
    REFERENCES `oz1zlgdxpvc102hu`.`account` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oz1zlgdxpvc102hu`.`game`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oz1zlgdxpvc102hu`.`game` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oz1zlgdxpvc102hu`.`account_in_game`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oz1zlgdxpvc102hu`.`account_in_game` (
  `game_id` INT NOT NULL,
  `account_id` INT NOT NULL,
  `is_owner` INT NOT NULL,
  `x` DOUBLE NOT NULL,
  `y` DOUBLE NOT NULL,
  PRIMARY KEY (`game_id`, `account_id`),
  INDEX `fk_game_has_account_account1_idx` (`account_id` ASC),
  INDEX `fk_game_has_account_game1_idx` (`game_id` ASC),
  CONSTRAINT `fk_game_has_account_game1`
    FOREIGN KEY (`game_id`)
    REFERENCES `oz1zlgdxpvc102hu`.`game` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_game_has_account_account1`
    FOREIGN KEY (`account_id`)
    REFERENCES `oz1zlgdxpvc102hu`.`account` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oz1zlgdxpvc102hu`.`waypoint`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oz1zlgdxpvc102hu`.`waypoint` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `x` DOUBLE NOT NULL,
  `y` DOUBLE NOT NULL,
  `game_id` INT NOT NULL,
  `info` VARCHAR(300) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_waypoint_game1_idx` (`game_id` ASC),
  CONSTRAINT `fk_waypoint_game1`
    FOREIGN KEY (`game_id`)
    REFERENCES `oz1zlgdxpvc102hu`.`game` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
