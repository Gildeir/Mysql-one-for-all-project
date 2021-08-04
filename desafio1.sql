DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE `plano` (
`plano_id` INT NOT NULL AUTO_INCREMENT,
`tipo_de_plano` VARCHAR(45) NOT NULL,
`valor_plano` DOUBLE NULL,
PRIMARY KEY (`plano_id`),
FOREIGN KEY (`plano_id`) REFERENCES `plano` (`plano_id`)
) engine = InnoDB;
  
CREATE TABLE `usuario` (
`usuario_id` INT NOT NULL AUTO_INCREMENT,
`name` VARCHAR(100) NOT NULL,
`idade` INT NOT NULL,
`plano_id` INT NOT NULL,
PRIMARY KEY (`usuario_id`)
) engine = InnoDB;
  
CREATE TABLE `artista` (
`artista_id` INT NOT NULL AUTO_INCREMENT,
`name` VARCHAR(100) NOT NULL,
PRIMARY KEY (`artista_id`)
) engine = InnoDB;


CREATE TABLE `seguindo_artista` (
`usuario_id` INT NOT NULL,
`artista_id` INT NOT NULL,
FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`usuario_id`),
FOREIGN KEY (`artista_id`) REFERENCES `artista` (`artista_id`),
CONSTRAINT PRIMARY KEY (`usuario_id`, `artista_id`)
) engine = InnoDB;


CREATE TABLE `album` (
`album_id` INT NOT NULL AUTO_INCREMENT,
`artista_id` INT NOT NULL,
`album_name` VARCHAR(100) NOT NULL,
PRIMARY KEY (`album_id`) ,
FOREIGN KEY (`artista_id`) REFERENCES `artista` (`artista_id`) 
) engine = InnoDB;
    
CREATE TABLE `songs` (
`song_id` INT NOT NULL AUTO_INCREMENT,
`song_name` VARCHAR(100) NOT NULL,
`album_id` INT NOT NULL,
PRIMARY KEY (`song_id`),
FOREIGN KEY (`album_id`) REFERENCES `album` (`album_id`)  
) engine = InnoDB;
  
CREATE TABLE `historico_de_reproducoes` (
`usuario_id` INT NOT NULL,
`song_id` INT NOT NULL,
`album_id` INT NOT NULL,
FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`usuario_id`),
FOREIGN KEY (`song_id`) REFERENCES `songs` (`song_id`),
CONSTRAINT PRIMARY KEY(`usuario_id`, `artista_id`)
) engine = InnoDB;
  
INSERT INTO `plano` (`tipo_de_plano`, `valor_plano`)
VALUES
('gratuito', 0),
('familiar', '7.99'),
('universitario', '5.99'),
('gratuito', '0');

INSERT INTO `usuario` (`name`, `idade`, `plano_id`)
VALUES
('Thati', 23, 1),
('Cintia', '35', 3),
('Bill', '20', 2),
('Roger', '45', 1);

INSERT INTO `artista` (`name`)
VALUES
('Walter Phoenix'),
('Peter Strong'),
('Lance Day'),
('Freedie Shannon');

INSERT INTO `seguindo_artistas` (`usuario_id`, `artista_id`)
VALUES
(1, 1),
(1, 4),
(1, 3),
(2, 1),
(2, 3),
(3, 2),
(3, 1),
(4, 4);

INSERT INTO `album` (`artista_id`, `album_name`)
VALUES
(1, 'Envious' ),
(1, 'Exuberant'),
(2, 'Hallowed Steam'),
(3, 'Incadenscent'),
(4, 'Temporary Culture');

INSERT INTO `songs` (`album_id`, `song_name`)
VALUES
  (1, 'Soul For Us' ),
  (1, 'Reflections Of Magic'),
  (1, 'Dance With her Own'),
  (2, 'Troubles Of My Inner Fire'),
  (2, 'Time Fireworks'),
  (3, 'Magic Circus'),
  (3, 'Honey, So Do I'),
  (3, 'Sweetie Lets Go Wild'),
  (3, 'She Knows'),
  (4, 'Fantasy For Me'),
  (4, 'Celebration Of More'),
  (4, 'Rock His Everything'),
  (4, 'Home Forever'),
  (4, 'Diamond Power'),
  (4, 'Honey, Lets Be Silly'),
  (5, 'Thang Of Thunder'),
  (5, 'Words Of Her Life'),
  (5, 'Without My Streets');
  
INSERT INTO `historico_de_reproducoes` (`usuario_id`, `song_id`, `album_id`)
VALUES
(1, 1, 1),
(1, 6, 1),
(1, 14, 4),
(1, 16, 5),
(2, 13, 4),
(2, 17, 5),
(2, 2, 1),
(2, 15, 4),
(3, 4, 2),
(3, 16, 5),
(3, 6, 3),
(4, 3, 1),
(4, 16, 5),
(4, 11, 4); 
