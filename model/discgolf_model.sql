SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `discgolf` DEFAULT CHARACTER SET latin1 ;
USE `discgolf` ;

-- -----------------------------------------------------
-- Table `discgolf`.`tournaments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `discgolf`.`tournaments` (
  `tournament_id` INT(11) NOT NULL,
  `name` VARCHAR(45) NULL,
  `date` DATE NULL DEFAULT NULL,
  `location` VARCHAR(45) NULL DEFAULT NULL,
  `nmbr_of_round` INT(11) NULL DEFAULT NULL,
  `nmbr_of_fnl_laps` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`tournament_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `discgolf`.`laps`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `discgolf`.`laps` (
  `lap_id` INT(11) NOT NULL,
  `nmbr_of_bskts` INT(11) NULL,
  `order` VARCHAR(45) NULL DEFAULT NULL,
  `tournament_id` INT(11) NOT NULL,
  PRIMARY KEY (`lap_id`),
  INDEX `fk_LAPS_TOURNAMENTS` (`tournament_id` ASC),
  CONSTRAINT `fk_LAPS_TOURNAMENTS`
    FOREIGN KEY (`tournament_id`)
    REFERENCES `discgolf`.`tournaments` (`tournament_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `discgolf`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `discgolf`.`users` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `role` VARCHAR(20) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT 'user',
  `username` VARCHAR(50) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL,
  `password` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL,
  `email` VARCHAR(100) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL,
  `activated` TINYINT(1) NOT NULL DEFAULT '1',
  `banned` TINYINT(1) NOT NULL DEFAULT '0',
  `ban_reason` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL,
  `new_password_key` VARCHAR(50) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL,
  `new_password_requested` DATETIME NULL DEFAULT NULL,
  `new_email` VARCHAR(100) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL,
  `new_email_key` VARCHAR(50) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL,
  `last_ip` VARCHAR(40) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL,
  `last_login` DATETIME NOT NULL,
  `created` DATETIME NOT NULL,
  `modified` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 12
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `discgolf`.`user_profiles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `discgolf`.`user_profiles` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `country` VARCHAR(20) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL,
  `website` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL,
  `first_name` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL,
  `last_name` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL,
  `birth_date` DATE NULL DEFAULT NULL,
  `email` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL,
  `photo` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL,
  `gender` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL,
  `club` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL,
  `user_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `user_id`),
  INDEX `fk_user_profiles_users1` (`user_id` ASC),
  CONSTRAINT `fk_user_profiles_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `discgolf`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `discgolf`.`baskets`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `discgolf`.`baskets` (
  `basket_id` INT(11) NOT NULL,
  `order` INT(11) NULL,
  `points` VARCHAR(45) NULL DEFAULT NULL,
  `lap_id` INT(11) NOT NULL,
  `user_profiles_id` INT(11) NOT NULL,
  PRIMARY KEY (`basket_id`, `user_profiles_id`),
  INDEX `fk_BASKETS_LAPS1` (`lap_id` ASC),
  INDEX `fk_BASKETS_user_profiles1` (`user_profiles_id` ASC),
  CONSTRAINT `fk_BASKETS_LAPS1`
    FOREIGN KEY (`lap_id`)
    REFERENCES `discgolf`.`laps` (`lap_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_BASKETS_user_profiles1`
    FOREIGN KEY (`user_profiles_id`)
    REFERENCES `discgolf`.`user_profiles` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `discgolf`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `discgolf`.`categories` (
  `category_id` INT(11) NOT NULL,
  `category` VARCHAR(45) NULL,
  PRIMARY KEY (`category_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `discgolf`.`ci_sessions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `discgolf`.`ci_sessions` (
  `session_id` VARCHAR(40) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '0',
  `ip_address` VARCHAR(16) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '0',
  `user_agent` VARCHAR(150) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL,
  `last_activity` INT(10) UNSIGNED NOT NULL DEFAULT '0',
  `user_data` TEXT CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL,
  PRIMARY KEY (`session_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `discgolf`.`login_attempts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `discgolf`.`login_attempts` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `ip_address` VARCHAR(40) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL,
  `login` VARCHAR(50) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL,
  `time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `discgolf`.`players_has_tournaments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `discgolf`.`players_has_tournaments` (
  `tournament_id` INT(11) NOT NULL,
  `category_id` INT(11) NOT NULL,
  `user_profiles_id` INT(11) NOT NULL,
  PRIMARY KEY (`tournament_id`, `user_profiles_id`),
  INDEX `fk_PLAYERS_has_TOURNAMENTS_TOURNAMENTS1` (`tournament_id` ASC),
  INDEX `fk_PLAYERS_has_TOURNAMENTS_CATEGORIES1` (`category_id` ASC),
  INDEX `fk_PLAYERS_has_TOURNAMENTS_user_profiles1` (`user_profiles_id` ASC),
  CONSTRAINT `fk_PLAYERS_has_TOURNAMENTS_CATEGORIES1`
    FOREIGN KEY (`category_id`)
    REFERENCES `discgolf`.`categories` (`category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PLAYERS_has_TOURNAMENTS_TOURNAMENTS1`
    FOREIGN KEY (`tournament_id`)
    REFERENCES `discgolf`.`tournaments` (`tournament_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PLAYERS_has_TOURNAMENTS_user_profiles1`
    FOREIGN KEY (`user_profiles_id`)
    REFERENCES `discgolf`.`user_profiles` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `discgolf`.`registered_players`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `discgolf`.`registered_players` (
  `tournaments_tournament_id` INT(11) NOT NULL,
  `categories_category_id` INT(11) NOT NULL,
  `accommodation` TINYINT(1) NULL,
  `nutrition` TINYINT(1) NULL DEFAULT NULL,
  `user_profiles_id` INT(11) NOT NULL,
  PRIMARY KEY (`user_profiles_id`),
  INDEX `fk_REGISTERED_PLAYERS_TOURNAMENTS1` (`tournaments_tournament_id` ASC),
  INDEX `fk_REGISTERED_PLAYERS_CATEGORIES1` (`categories_category_id` ASC),
  CONSTRAINT `fk_REGISTERED_PLAYERS_CATEGORIES1`
    FOREIGN KEY (`categories_category_id`)
    REFERENCES `discgolf`.`categories` (`category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_REGISTERED_PLAYERS_TOURNAMENTS1`
    FOREIGN KEY (`tournaments_tournament_id`)
    REFERENCES `discgolf`.`tournaments` (`tournament_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_REGISTERED_PLAYERS_user_profiles1`
    FOREIGN KEY (`user_profiles_id`)
    REFERENCES `discgolf`.`user_profiles` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `discgolf`.`user_autologin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `discgolf`.`user_autologin` (
  `key_id` CHAR(32) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL,
  `user_agent` VARCHAR(150) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL,
  `last_ip` VARCHAR(40) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL,
  `last_login` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` INT(11) NOT NULL,
  PRIMARY KEY (`key_id`, `user_id`),
  INDEX `fk_user_autologin_users1` (`user_id` ASC),
  CONSTRAINT `fk_user_autologin_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `discgolf`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;