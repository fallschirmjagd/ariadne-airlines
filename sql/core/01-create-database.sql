
CREATE DATABASE ariadne
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE ariadne;

SET @filename = '01-create-database.sql';
SET @md5 = '02af4fb3bb2b94b48aa68e60b34416d4'; /*** @TODO: make it a var ***/

CREATE TABLE patchlog (
  id INT(12) NOT NULL AUTO_INCREMENT,
  filename VARCHAR(100) NOT NULL DEFAULT '',
  md5 VARCHAR(32) NOT NULL DEFAULT '',
  applied VARCHAR(30),
  updated timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Changes on each update',
  PRIMARY KEY (id),
  UNIQUE KEY (md5),
  UNIQUE KEY (filename)
);

/*** this part enters the first entry into patch log ***/

INSERT INTO patchlog (id, filename, md5) VALUES (0, @filename, @md5);

UPDATE patchlog
   SET applied = updated
 WHERE filename = @filename
   AND applied IS NULL;

