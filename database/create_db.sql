-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema trackdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `trackdb` ;

-- -----------------------------------------------------
-- Schema trackdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `trackdb` DEFAULT CHARACTER SET utf8 ;
USE `trackdb` ;

-- -----------------------------------------------------
-- Table `trackdb`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `trackdb`.`user` ;

CREATE TABLE IF NOT EXISTS `trackdb`.`user` (
  `id_user` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(20) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `about` VARCHAR(500) NULL,
  `birthday` DATE NULL,
  `gender` ENUM('Male', 'Female') NULL,
  `password` VARCHAR(256) NOT NULL,
  `image_path` VARCHAR(75) NULL,
  PRIMARY KEY (`id_user`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trackdb`.`media`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `trackdb`.`media` ;

CREATE TABLE IF NOT EXISTS `trackdb`.`media` (
  `id_media` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(75) NOT NULL,
  `tmdb` VARCHAR(45) NOT NULL,
  `overview` VARCHAR(5000) NOT NULL,
  `rating_trakt` DECIMAL(4,2) NOT NULL,
  `released` DATE NOT NULL,
  `image_path` VARCHAR(75) NOT NULL,
  `category` INT NOT NULL,
  `rating` DECIMAL(4,2) NULL,
  PRIMARY KEY (`id_media`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trackdb`.`movie`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `trackdb`.`movie` ;

CREATE TABLE IF NOT EXISTS `trackdb`.`movie` (
  `id_movie` INT NOT NULL AUTO_INCREMENT,
  `slug` VARCHAR(255) NOT NULL,
  `imdb` VARCHAR(45) NULL,
  `tagline` VARCHAR(150) NULL,
  `trailer` VARCHAR(255) NULL,
  `runtime` INT NULL,
  `homepage` VARCHAR(255) NULL,
  `language` VARCHAR(5) NULL,
  `certification` VARCHAR(10) NULL,
  `media_id` INT NOT NULL,
  PRIMARY KEY (`id_movie`),
  INDEX `fk_movie_media1_idx` (`media_id` ASC),
  CONSTRAINT `fk_movie_media1`
    FOREIGN KEY (`media_id`)
    REFERENCES `trackdb`.`media` (`id_media`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trackdb`.`show`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `trackdb`.`show` ;

CREATE TABLE IF NOT EXISTS `trackdb`.`show` (
  `id_show` INT NOT NULL AUTO_INCREMENT,
  `slug` VARCHAR(255) NOT NULL,
  `imdb` VARCHAR(45) NULL,
  `aired_day` VARCHAR(20) NULL,
  `aired_time` VARCHAR(5) NULL,
  `aired_timezone` VARCHAR(20) NULL,
  `runtime` INT NULL,
  `certification` VARCHAR(10) NULL,
  `network` VARCHAR(15) NULL,
  `country` VARCHAR(50) NULL,
  `trailer` VARCHAR(255) NULL,
  `homepage` VARCHAR(255) NULL,
  `status` VARCHAR(20) NULL,
  `language` VARCHAR(5) NULL,
  `aired_episodes` INT NULL,
  `seasons` INT NOT NULL,
  `media_id` INT NOT NULL,
  PRIMARY KEY (`id_show`),
  INDEX `fk_show_media1_idx` (`media_id` ASC),
  CONSTRAINT `fk_show_media1`
    FOREIGN KEY (`media_id`)
    REFERENCES `trackdb`.`media` (`id_media`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trackdb`.`user_has_media`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `trackdb`.`user_has_media` ;

CREATE TABLE IF NOT EXISTS `trackdb`.`user_has_media` (
  `user_id` INT NOT NULL,
  `media_id` INT NOT NULL,
  `watched` TINYINT NOT NULL,
  `watchlist` TINYINT NULL,
  `rating` INT NULL,
  `comment` VARCHAR(255) NULL,
  `add_date` DATETIME NOT NULL,
  `view_date` DATETIME NULL,
  PRIMARY KEY (`user_id`, `media_id`),
  INDEX `fk_user_has_show_user1_idx` (`user_id` ASC),
  INDEX `fk_user_has_show_media1_idx` (`media_id` ASC),
  CONSTRAINT `fk_user_has_show_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `trackdb`.`user` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_show_media1`
    FOREIGN KEY (`media_id`)
    REFERENCES `trackdb`.`media` (`id_media`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trackdb`.`season`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `trackdb`.`season` ;

CREATE TABLE IF NOT EXISTS `trackdb`.`season` (
  `id_season` INT NOT NULL AUTO_INCREMENT,
  `number` INT NOT NULL,
  `episodes` INT NULL,
  `aired_episodes` INT NULL,
  `show_id` INT NOT NULL,
  `media_id` INT NOT NULL,
  PRIMARY KEY (`id_season`),
  INDEX `fk_season_show1_idx` (`show_id` ASC),
  INDEX `fk_season_media1_idx` (`media_id` ASC),
  CONSTRAINT `fk_season_show1`
    FOREIGN KEY (`show_id`)
    REFERENCES `trackdb`.`show` (`id_show`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_season_media1`
    FOREIGN KEY (`media_id`)
    REFERENCES `trackdb`.`media` (`id_media`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trackdb`.`episode`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `trackdb`.`episode` ;

CREATE TABLE IF NOT EXISTS `trackdb`.`episode` (
  `id_episode` INT NOT NULL AUTO_INCREMENT,
  `number` INT NOT NULL,
  `imdb` VARCHAR(45) NULL,
  `season_id` INT NOT NULL,
  `media_id` INT NOT NULL,
  PRIMARY KEY (`id_episode`),
  INDEX `fk_episode_season1_idx` (`season_id` ASC),
  INDEX `fk_episode_media1_idx` (`media_id` ASC),
  CONSTRAINT `fk_episode_season1`
    FOREIGN KEY (`season_id`)
    REFERENCES `trackdb`.`season` (`id_season`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_episode_media1`
    FOREIGN KEY (`media_id`)
    REFERENCES `trackdb`.`media` (`id_media`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trackdb`.`genre`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `trackdb`.`genre` ;

CREATE TABLE IF NOT EXISTS `trackdb`.`genre` (
  `id_genre` INT NOT NULL AUTO_INCREMENT,
  `genre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_genre`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trackdb`.`show_has_genre`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `trackdb`.`show_has_genre` ;

CREATE TABLE IF NOT EXISTS `trackdb`.`show_has_genre` (
  `show_id` INT NOT NULL,
  `genre_id` INT NOT NULL,
  PRIMARY KEY (`show_id`, `genre_id`),
  INDEX `fk_show_has_Genre_Genre1_idx` (`genre_id` ASC),
  INDEX `fk_show_has_Genre_show1_idx` (`show_id` ASC),
  CONSTRAINT `fk_show_has_Genre_show1`
    FOREIGN KEY (`show_id`)
    REFERENCES `trackdb`.`show` (`id_show`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_show_has_Genre_Genre1`
    FOREIGN KEY (`genre_id`)
    REFERENCES `trackdb`.`genre` (`id_genre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trackdb`.`movie_has_genre`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `trackdb`.`movie_has_genre` ;

CREATE TABLE IF NOT EXISTS `trackdb`.`movie_has_genre` (
  `movie_id` INT NOT NULL,
  `genre_id` INT NOT NULL,
  PRIMARY KEY (`movie_id`, `genre_id`),
  INDEX `fk_movie_has_genre_genre1_idx` (`genre_id` ASC),
  INDEX `fk_movie_has_genre_movie1_idx` (`movie_id` ASC),
  CONSTRAINT `fk_movie_has_genre_movie1`
    FOREIGN KEY (`movie_id`)
    REFERENCES `trackdb`.`movie` (`id_movie`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_movie_has_genre_genre1`
    FOREIGN KEY (`genre_id`)
    REFERENCES `trackdb`.`genre` (`id_genre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
