SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`TOURNAMENTS`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`TOURNAMENTS` (
  `TOURNAMENT_ID` INT NOT NULL ,
  `NAME` VARCHAR(45) NULL ,
  `DATE` DATE NULL ,
  `LOCATION` VARCHAR(45) NULL ,
  `NMBR_OF_ROUND` INT NULL ,
  `NMBR_OF_FNL_LAPS` INT NULL ,
  PRIMARY KEY (`TOURNAMENT_ID`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`LAPS`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`LAPS` (
  `LAP_ID` INT NOT NULL ,
  `NMBR_OF_BSKTS` INT NULL ,
  `ORDER` VARCHAR(45) NULL ,
  `TOURNAMENT_ID` INT NOT NULL ,
  PRIMARY KEY (`LAP_ID`) ,
  INDEX `fk_LAPS_TOURNAMENTS` (`TOURNAMENT_ID` ASC) ,
  CONSTRAINT `fk_LAPS_TOURNAMENTS`
    FOREIGN KEY (`TOURNAMENT_ID` )
    REFERENCES `mydb`.`TOURNAMENTS` (`TOURNAMENT_ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PLAYERS`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`PLAYERS` (
  `PLAYER_ID` INT NOT NULL ,
  `FIRST_NAME` VARCHAR(45) NULL ,
  `LAST_NAME` VARCHAR(45) NULL ,
  `BIRTH_DATE` DATE NULL ,
  `EMAIL` VARCHAR(45) NULL ,
  `PHOTO` VARCHAR(45) NULL ,
  `GENDER` VARCHAR(45) NULL ,
  `CLUB` VARCHAR(45) NULL ,
  PRIMARY KEY (`PLAYER_ID`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CATEGORIES`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`CATEGORIES` (
  `CATEGORY_ID` INT NOT NULL ,
  `CATEGORY` VARCHAR(45) NULL ,
  PRIMARY KEY (`CATEGORY_ID`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`users`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`users` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `username` VARCHAR(50) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL ,
  `password` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL ,
  `email` VARCHAR(100) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL ,
  `activated` TINYINT(1) NOT NULL DEFAULT '1' ,
  `banned` TINYINT(1) NOT NULL DEFAULT '0' ,
  `ban_reason` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL ,
  `new_password_key` VARCHAR(50) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL ,
  `new_password_requested` DATETIME NULL DEFAULT NULL ,
  `new_email` VARCHAR(100) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL ,
  `new_email_key` VARCHAR(50) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL ,
  `last_ip` VARCHAR(40) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL ,
  `last_login` DATETIME NOT NULL ,
  `created` DATETIME NOT NULL ,
  `modified` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `mydb`.`user_profiles`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`user_profiles` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `country` VARCHAR(20) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL ,
  `website` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL ,
  `first_name` VARCHAR(45) NULL ,
  `last_name` VARCHAR(45) NULL ,
  `birth_date` DATE NULL ,
  `email` VARCHAR(255) NULL ,
  `photo` VARCHAR(255) NULL ,
  `gender` VARCHAR(45) NULL ,
  `club` VARCHAR(45) NULL ,
  `user_id` INT(11) NOT NULL ,
  PRIMARY KEY (`id`, `user_id`) ,
  INDEX `fk_user_profiles_users1` (`user_id` ASC) ,
  CONSTRAINT `fk_user_profiles_users1`
    FOREIGN KEY (`user_id` )
    REFERENCES `mydb`.`users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `mydb`.`PLAYERS_has_TOURNAMENTS`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`PLAYERS_has_TOURNAMENTS` (
  `TOURNAMENT_ID` INT NOT NULL ,
  `CATEGORY_ID` INT NOT NULL ,
  `user_profiles_id` INT(11) NOT NULL ,
  PRIMARY KEY (`TOURNAMENT_ID`, `user_profiles_id`) ,
  INDEX `fk_PLAYERS_has_TOURNAMENTS_TOURNAMENTS1` (`TOURNAMENT_ID` ASC) ,
  INDEX `fk_PLAYERS_has_TOURNAMENTS_CATEGORIES1` (`CATEGORY_ID` ASC) ,
  INDEX `fk_PLAYERS_has_TOURNAMENTS_user_profiles1` (`user_profiles_id` ASC) ,
  CONSTRAINT `fk_PLAYERS_has_TOURNAMENTS_TOURNAMENTS1`
    FOREIGN KEY (`TOURNAMENT_ID` )
    REFERENCES `mydb`.`TOURNAMENTS` (`TOURNAMENT_ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PLAYERS_has_TOURNAMENTS_CATEGORIES1`
    FOREIGN KEY (`CATEGORY_ID` )
    REFERENCES `mydb`.`CATEGORIES` (`CATEGORY_ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PLAYERS_has_TOURNAMENTS_user_profiles1`
    FOREIGN KEY (`user_profiles_id` )
    REFERENCES `mydb`.`user_profiles` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`BASKETS`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`BASKETS` (
  `BASKET_ID` INT NOT NULL ,
  `ORDER` INT NULL ,
  `POINTS` VARCHAR(45) NULL ,
  `LAP_ID` INT NOT NULL ,
  `user_profiles_id` INT(11) NOT NULL ,
  PRIMARY KEY (`BASKET_ID`, `user_profiles_id`) ,
  INDEX `fk_BASKETS_LAPS1` (`LAP_ID` ASC) ,
  INDEX `fk_BASKETS_user_profiles1` (`user_profiles_id` ASC) ,
  CONSTRAINT `fk_BASKETS_LAPS1`
    FOREIGN KEY (`LAP_ID` )
    REFERENCES `mydb`.`LAPS` (`LAP_ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_BASKETS_user_profiles1`
    FOREIGN KEY (`user_profiles_id` )
    REFERENCES `mydb`.`user_profiles` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`REGISTERED_PLAYERS`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`REGISTERED_PLAYERS` (
  `TOURNAMENTS_TOURNAMENT_ID` INT NOT NULL ,
  `CATEGORIES_CATEGORY_ID` INT NOT NULL ,
  `ACCOMMODATION` TINYINT(1)  NULL ,
  `NUTRITION` TINYINT(1)  NULL ,
  `user_profiles_id` INT(11) NOT NULL ,
  INDEX `fk_REGISTERED_PLAYERS_TOURNAMENTS1` (`TOURNAMENTS_TOURNAMENT_ID` ASC) ,
  INDEX `fk_REGISTERED_PLAYERS_CATEGORIES1` (`CATEGORIES_CATEGORY_ID` ASC) ,
  PRIMARY KEY (`user_profiles_id`) ,
  CONSTRAINT `fk_REGISTERED_PLAYERS_TOURNAMENTS1`
    FOREIGN KEY (`TOURNAMENTS_TOURNAMENT_ID` )
    REFERENCES `mydb`.`TOURNAMENTS` (`TOURNAMENT_ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_REGISTERED_PLAYERS_CATEGORIES1`
    FOREIGN KEY (`CATEGORIES_CATEGORY_ID` )
    REFERENCES `mydb`.`CATEGORIES` (`CATEGORY_ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_REGISTERED_PLAYERS_user_profiles1`
    FOREIGN KEY (`user_profiles_id` )
    REFERENCES `mydb`.`user_profiles` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ci_sessions`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`ci_sessions` (
  `session_id` VARCHAR(40) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '0' ,
  `ip_address` VARCHAR(16) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT '0' ,
  `user_agent` VARCHAR(150) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL ,
  `last_activity` INT(10) UNSIGNED NOT NULL DEFAULT '0' ,
  `user_data` TEXT CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL ,
  PRIMARY KEY (`session_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `mydb`.`login_attempts`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`login_attempts` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `ip_address` VARCHAR(40) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL ,
  `login` VARCHAR(50) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL ,
  `time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `mydb`.`user_autologin`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`user_autologin` (
  `key_id` CHAR(32) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL ,
  `user_agent` VARCHAR(150) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL ,
  `last_ip` VARCHAR(40) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL ,
  `last_login` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  `user_id` INT(11) NOT NULL ,
  PRIMARY KEY (`key_id`, `user_id`) ,
  INDEX `fk_user_autologin_users1` (`user_id` ASC) ,
  CONSTRAINT `fk_user_autologin_users1`
    FOREIGN KEY (`user_id` )
    REFERENCES `mydb`.`users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
