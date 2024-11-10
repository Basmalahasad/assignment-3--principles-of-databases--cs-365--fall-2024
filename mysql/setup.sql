DROP DATABASE IF EXISTS student_passwords;
CREATE DATABASE student_passwords DEFAULT CHARACTER SET utf8mb4;

DROP USER IF EXISTS 'passwords_user'@'localhost';
CREATE USER 'passwords_user'@'localhost' IDENTIFIED BY '';
GRANT ALL ON student_passwords.* TO 'passwords_user'@'localhost';

USE student_passwords;
