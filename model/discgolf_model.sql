SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `discgolf` DEFAULT CHARACTER SET latin1 ;
USE `discgolf` ;

-- -----------------------------------------------------
-- Table `discgolf`.`categories`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `discgolf`.`categories` ;

CREATE  TABLE IF NOT EXISTS `discgolf`.`categories` (
  `category_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `category` VARCHAR(45) NULL ,
  PRIMARY KEY (`category_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `discgolf`.`ci_sessions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `discgolf`.`ci_sessions` ;

CREATE  TABLE IF NOT EXISTS `discgolf`.`ci_sessions` (
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
-- Table `discgolf`.`tournaments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `discgolf`.`tournaments` ;

CREATE  TABLE IF NOT EXISTS `discgolf`.`tournaments` (
  `tournament_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(45) NULL ,
  `date` DATE NULL DEFAULT NULL ,
  `location` VARCHAR(45) NULL DEFAULT NULL ,
  `nmbr_of_round` INT(11) NULL DEFAULT NULL ,
  `nmbr_of_fnl_laps` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`tournament_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `discgolf`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `discgolf`.`users` ;

CREATE  TABLE IF NOT EXISTS `discgolf`.`users` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `role` VARCHAR(20) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL DEFAULT 'user' ,
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
AUTO_INCREMENT = 12
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `discgolf`.`user_profiles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `discgolf`.`user_profiles` ;

CREATE  TABLE IF NOT EXISTS `discgolf`.`user_profiles` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `country` VARCHAR(20) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL ,
  `website` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL ,
  `first_name` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL ,
  `last_name` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL ,
  `birth_date` DATE NULL DEFAULT NULL ,
  `photo` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT 'default.png' ,
  `thumb` VARCHAR(255) NULL DEFAULT 'default-thumb.png' ,
  `gender` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL ,
  `club` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL ,
  `about` TEXT NULL ,
  `user_id` INT(11) NOT NULL ,
  PRIMARY KEY (`id`, `user_id`) ,
  INDEX `fk_user_profiles_users1` (`user_id` ASC) ,
  CONSTRAINT `fk_user_profiles_users1`
    FOREIGN KEY (`user_id` )
    REFERENCES `discgolf`.`users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `discgolf`.`results`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `discgolf`.`results` ;

CREATE  TABLE IF NOT EXISTS `discgolf`.`results` (
  `result_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `points` INT NULL ,
  `lap_1` INT NULL DEFAULT NULL ,
  `lap_2` INT NULL DEFAULT NULL ,
  `lap_3` INT NULL DEFAULT NULL ,
  `lap_4` INT NULL DEFAULT NULL ,
  `lap_5` INT NULL DEFAULT NULL ,
  `lap_6` INT NULL DEFAULT NULL ,
  `lap_7` INT NULL DEFAULT NULL ,
  `lap_8` INT NULL DEFAULT NULL ,
  `lap_9` INT NULL DEFAULT NULL ,
  `lap_10` INT NULL DEFAULT NULL ,
  `final_1` INT NULL DEFAULT NULL ,
  `final_2` INT NULL DEFAULT NULL ,
  `final_3` INT NULL DEFAULT NULL ,
  `tournament_id` INT(11) NOT NULL ,
  `user_id` INT(11) NOT NULL ,
  PRIMARY KEY (`result_id`) ,
  INDEX `fk_results_tournaments1` (`tournament_id` ASC) ,
  INDEX `fk_results_user_profiles1` (`user_id` ASC) ,
  CONSTRAINT `fk_results_tournaments1`
    FOREIGN KEY (`tournament_id` )
    REFERENCES `discgolf`.`tournaments` (`tournament_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_results_user_profiles1`
    FOREIGN KEY (`user_id` )
    REFERENCES `discgolf`.`user_profiles` (`user_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `discgolf`.`login_attempts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `discgolf`.`login_attempts` ;

CREATE  TABLE IF NOT EXISTS `discgolf`.`login_attempts` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `ip_address` VARCHAR(40) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL ,
  `login` VARCHAR(50) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL ,
  `time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `discgolf`.`players_has_tournaments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `discgolf`.`players_has_tournaments` ;

CREATE  TABLE IF NOT EXISTS `discgolf`.`players_has_tournaments` (
  `tournament_id` INT(11) NOT NULL ,
  `category_id` INT(11) NOT NULL ,
  `user_id` INT(11) NOT NULL ,
  `final` INT NULL DEFAULT NULL ,
  `disqualified` VARCHAR(45) NULL DEFAULT NULL ,
  PRIMARY KEY (`tournament_id`, `user_id`) ,
  INDEX `fk_PLAYERS_has_TOURNAMENTS_TOURNAMENTS1` (`tournament_id` ASC) ,
  INDEX `fk_PLAYERS_has_TOURNAMENTS_CATEGORIES1` (`category_id` ASC) ,
  INDEX `fk_PLAYERS_has_TOURNAMENTS_user_profiles1` (`user_id` ASC) ,
  CONSTRAINT `fk_PLAYERS_has_TOURNAMENTS_CATEGORIES1`
    FOREIGN KEY (`category_id` )
    REFERENCES `discgolf`.`categories` (`category_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PLAYERS_has_TOURNAMENTS_TOURNAMENTS1`
    FOREIGN KEY (`tournament_id` )
    REFERENCES `discgolf`.`tournaments` (`tournament_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PLAYERS_has_TOURNAMENTS_user_profiles1`
    FOREIGN KEY (`user_id` )
    REFERENCES `discgolf`.`user_profiles` (`user_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `discgolf`.`registered_players`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `discgolf`.`registered_players` ;

CREATE  TABLE IF NOT EXISTS `discgolf`.`registered_players` (
  `tournaments_tournament_id` INT(11) NOT NULL ,
  `categories_category_id` INT(11) NOT NULL ,
  `accommodation` TINYINT(1) NULL ,
  `nutrition` TINYINT(1) NULL DEFAULT NULL ,
  `user_id` INT(11) NOT NULL ,
  PRIMARY KEY (`user_id`) ,
  INDEX `fk_REGISTERED_PLAYERS_TOURNAMENTS1` (`tournaments_tournament_id` ASC) ,
  INDEX `fk_REGISTERED_PLAYERS_CATEGORIES1` (`categories_category_id` ASC) ,
  CONSTRAINT `fk_REGISTERED_PLAYERS_CATEGORIES1`
    FOREIGN KEY (`categories_category_id` )
    REFERENCES `discgolf`.`categories` (`category_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_REGISTERED_PLAYERS_TOURNAMENTS1`
    FOREIGN KEY (`tournaments_tournament_id` )
    REFERENCES `discgolf`.`tournaments` (`tournament_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_REGISTERED_PLAYERS_user_profiles1`
    FOREIGN KEY (`user_id` )
    REFERENCES `discgolf`.`user_profiles` (`user_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `discgolf`.`user_autologin`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `discgolf`.`user_autologin` ;

CREATE  TABLE IF NOT EXISTS `discgolf`.`user_autologin` (
  `key_id` CHAR(32) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL ,
  `user_agent` VARCHAR(150) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL ,
  `last_ip` VARCHAR(40) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL ,
  `last_login` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  `user_id` INT(11) NOT NULL ,
  PRIMARY KEY (`key_id`, `user_id`) ,
  INDEX `fk_user_autologin_users1` (`user_id` ASC) ,
  CONSTRAINT `fk_user_autologin_users1`
    FOREIGN KEY (`user_id` )
    REFERENCES `discgolf`.`users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `discgolf`.`number_of_baskets`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `discgolf`.`number_of_baskets` ;

CREATE  TABLE IF NOT EXISTS `discgolf`.`number_of_baskets` (
  `id` INT NOT NULL ,
  `result_id` INT(11) NOT NULL ,
  `no_bskts_1` INT NULL ,
  `no_bskts_2` INT NULL ,
  `no_bskts_3` INT NULL ,
  `no_bskts_4` INT NULL ,
  `no_bskts_5` INT NULL ,
  `no_bskts_6` INT NULL ,
  `no_bskts_7` INT NULL ,
  `no_bskts_8` INT NULL ,
  `no_bskts_9` INT NULL ,
  `no_bskts_10` INT NULL ,
  `no_final_1` INT NULL ,
  `no_final_2` INT NULL ,
  `no_final_3` INT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_number_of_baskets_results1` (`result_id` ASC) ,
  CONSTRAINT `fk_number_of_baskets_results1`
    FOREIGN KEY (`result_id` )
    REFERENCES `discgolf`.`results` (`result_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
