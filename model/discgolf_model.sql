SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `discgolf` DEFAULT CHARACTER SET latin1 ;
USE `discgolf` ;

-- -----------------------------------------------------
-- Table `discgolf`.`statistics_categories`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `discgolf`.`statistics_categories` ;

CREATE  TABLE IF NOT EXISTS `discgolf`.`statistics_categories` (
  `category_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `category` VARCHAR(45) NULL ,
  PRIMARY KEY (`category_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `discgolf`.`statistics_ci_sessions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `discgolf`.`statistics_ci_sessions` ;

CREATE  TABLE IF NOT EXISTS `discgolf`.`statistics_ci_sessions` (
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
-- Table `discgolf`.`statistics_tournaments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `discgolf`.`statistics_tournaments` ;

CREATE  TABLE IF NOT EXISTS `discgolf`.`statistics_tournaments` (
  `tournament_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(45) NULL ,
  `date` DATE NULL DEFAULT NULL ,
  `location` VARCHAR(45) NULL DEFAULT NULL ,
  `nmbr_of_round` INT(11) NULL DEFAULT NULL ,
  `nmbr_of_fnl_laps` INT(11) NULL DEFAULT NULL ,
  `about` TEXT NULL ,
  `photo` VARCHAR(200) NULL DEFAULT NULL ,
  `thumb` VARCHAR(200) NULL DEFAULT NULL ,
  `allow_registration` INT NULL DEFAULT 0 ,
  `lat` DOUBLE NULL DEFAULT NULL ,
  `lng` DOUBLE NULL DEFAULT NULL ,
  PRIMARY KEY (`tournament_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `discgolf`.`statistics_users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `discgolf`.`statistics_users` ;

CREATE  TABLE IF NOT EXISTS `discgolf`.`statistics_users` (
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
-- Table `discgolf`.`statistics_user_profiles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `discgolf`.`statistics_user_profiles` ;

CREATE  TABLE IF NOT EXISTS `discgolf`.`statistics_user_profiles` (
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
    REFERENCES `discgolf`.`statistics_users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `discgolf`.`statistics_results`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `discgolf`.`statistics_results` ;

CREATE  TABLE IF NOT EXISTS `discgolf`.`statistics_results` (
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
    REFERENCES `discgolf`.`statistics_tournaments` (`tournament_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_results_user_profiles1`
    FOREIGN KEY (`user_id` )
    REFERENCES `discgolf`.`statistics_user_profiles` (`user_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `discgolf`.`statistics_login_attempts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `discgolf`.`statistics_login_attempts` ;

CREATE  TABLE IF NOT EXISTS `discgolf`.`statistics_login_attempts` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `ip_address` VARCHAR(40) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL ,
  `login` VARCHAR(50) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL ,
  `time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `discgolf`.`statistics_players_has_tournaments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `discgolf`.`statistics_players_has_tournaments` ;

CREATE  TABLE IF NOT EXISTS `discgolf`.`statistics_players_has_tournaments` (
  `tournament_id` INT(11) NOT NULL ,
  `category_id` INT(11) NOT NULL ,
  `user_id` INT(11) NOT NULL ,
  `final` INT NULL DEFAULT NULL ,
  `disqualified` INT NULL DEFAULT NULL ,
  PRIMARY KEY (`tournament_id`, `user_id`) ,
  INDEX `fk_PLAYERS_has_TOURNAMENTS_TOURNAMENTS1` (`tournament_id` ASC) ,
  INDEX `fk_PLAYERS_has_TOURNAMENTS_CATEGORIES1` (`category_id` ASC) ,
  INDEX `fk_PLAYERS_has_TOURNAMENTS_user_profiles1` (`user_id` ASC) ,
  CONSTRAINT `fk_PLAYERS_has_TOURNAMENTS_CATEGORIES1`
    FOREIGN KEY (`category_id` )
    REFERENCES `discgolf`.`statistics_categories` (`category_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PLAYERS_has_TOURNAMENTS_TOURNAMENTS1`
    FOREIGN KEY (`tournament_id` )
    REFERENCES `discgolf`.`statistics_tournaments` (`tournament_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PLAYERS_has_TOURNAMENTS_user_profiles1`
    FOREIGN KEY (`user_id` )
    REFERENCES `discgolf`.`statistics_user_profiles` (`user_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `discgolf`.`statistics_registered_players`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `discgolf`.`statistics_registered_players` ;

CREATE  TABLE IF NOT EXISTS `discgolf`.`statistics_registered_players` (
  `tournament_id` INT(11) NOT NULL ,
  `category_id` INT(11) NOT NULL ,
  `accommodation` TINYINT(1) NULL ,
  `nutrition` TINYINT(1) NULL DEFAULT NULL ,
  `user_id` INT(11) NOT NULL ,
  INDEX `fk_REGISTERED_PLAYERS_TOURNAMENTS1` (`tournament_id` ASC) ,
  INDEX `fk_REGISTERED_PLAYERS_CATEGORIES1` (`category_id` ASC) ,
  CONSTRAINT `fk_REGISTERED_PLAYERS_CATEGORIES1`
    FOREIGN KEY (`category_id` )
    REFERENCES `discgolf`.`statistics_categories` (`category_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_REGISTERED_PLAYERS_TOURNAMENTS1`
    FOREIGN KEY (`tournament_id` )
    REFERENCES `discgolf`.`statistics_tournaments` (`tournament_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_REGISTERED_PLAYERS_user_profiles1`
    FOREIGN KEY (`user_id` )
    REFERENCES `discgolf`.`statistics_user_profiles` (`user_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `discgolf`.`statistics_user_autologin`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `discgolf`.`statistics_user_autologin` ;

CREATE  TABLE IF NOT EXISTS `discgolf`.`statistics_user_autologin` (
  `key_id` CHAR(32) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL ,
  `user_agent` VARCHAR(150) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL ,
  `last_ip` VARCHAR(40) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL ,
  `last_login` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  `user_id` INT(11) NOT NULL ,
  PRIMARY KEY (`key_id`, `user_id`) ,
  INDEX `fk_user_autologin_users1` (`user_id` ASC) ,
  CONSTRAINT `fk_user_autologin_users1`
    FOREIGN KEY (`user_id` )
    REFERENCES `discgolf`.`statistics_users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `discgolf`.`statistics_number_of_baskets`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `discgolf`.`statistics_number_of_baskets` ;

CREATE  TABLE IF NOT EXISTS `discgolf`.`statistics_number_of_baskets` (
  `id` INT NOT NULL AUTO_INCREMENT ,
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
    REFERENCES `discgolf`.`statistics_results` (`result_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
