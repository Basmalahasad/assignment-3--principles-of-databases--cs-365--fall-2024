DROP DATABASE IF EXISTS student_passwords;
CREATE DATABASE student_passwords DEFAULT CHARACTER SET utf8mb4;

DROP USER IF EXISTS 'passwords_user'@'localhost';
CREATE USER 'passwords_user'@'localhost';
GRANT ALL PRIVILEGES ON student_passwords.* TO 'passwords_user'@'localhost';
FLUSH PRIVILEGES;

USE student_passwords;

SET block_encryption_mode = 'aes-256-cbc';
SET @key_str = 'A1b2C3d4E5f6G7h8';
SET @init_vector = '1234ABCD5678EFGH';

CREATE TABLE IF NOT EXISTS user (
    user_id SMALLINT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(128) NOT NULL,
    last_name VARCHAR(128) NOT NULL,
    email VARCHAR(128) NOT NULL UNIQUE,

    PRIMARY KEY (user_id)
);

CREATE TABLE IF NOT EXISTS website (
    website_id SMALLINT NOT NULL AUTO_INCREMENT,
    website_name VARCHAR(128) NOT NULL,
    url VARCHAR(128) NOT NULL UNIQUE,

    PRIMARY KEY (website_id)
);

CREATE TABLE IF NOT EXISTS registersFor (
    account_id SMALLINT NOT NULL AUTO_INCREMENT,
    user_id SMALLINT NOT NULL,
    website_id SMALLINT NOT NULL,
    username VARCHAR(128) NOT NULL UNIQUE,
    passphrase VARBINARY(512) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    comments TEXT,

    PRIMARY KEY (account_id),
    FOREIGN KEY (user_id) REFERENCES user (user_id) ON DELETE CASCADE,
    FOREIGN KEY (website_id) REFERENCES website (website_id) ON DELETE CASCADE
);

INSERT INTO user
(first_name, last_name, email)
VALUES
('Margot', 'Little', 'mlittle@gmail.com'),
('Joel', 'Andrews', 'jandrews@yahoo.com'),
('Cora', 'Brock', 'cbrock@outlook.com'),
('Alexia', 'Fuller', 'afuller@outlook.com'),
('Ali', 'Underwood', 'aunderwood@gmail.com');

INSERT INTO website
(website_name, url)
VALUES
('U.S. News', 'http://www.usnews.com'),
('Github', 'https://github.com'),
('Facebook', 'https://facebook.com'),
('The New York Times', 'https://nytimes.com');

INSERT INTO registersFor
(user_id, website_id, username, passphrase, created_at, comments)
VALUES (
    1,
    1,
    'mlittle',
    AES_ENCRYPT('ml_W6%272dC', @key_str, @init_vector),
    CURRENT_TIMESTAMP,
    'Reset password if login fails after three attempts'
),
(
    1,
    3,
    'm_little',
    AES_ENCRYPT('ml_z/&5D1a5', @key_str, @init_vector),
    CURRENT_TIMESTAMP,
    'First pet name is teddy'
),
(
    2,
    2,
    'jandrews',
    AES_ENCRYPT('ja_30YWx,#5', @key_str, @init_vector),
    CURRENT_TIMESTAMP,
    'Two-factor authentication enabled'
),
(
    2,
    4,
    'j_andrews',
    AES_ENCRYPT('ja_vH$47.E2', @key_str, @init_vector),
    CURRENT_TIMESTAMP,
    'Mother maiden name is smith'
),
(
    3,
    1,
    'cbrock',
    AES_ENCRYPT('cb_jS2"872/', @key_str, @init_vector),
    CURRENT_TIMESTAMP,
    'Change password every 3 months'
),
(
    3,
    2,
    'c_brock',
    AES_ENCRYPT('cb_.02Et9k8', @key_str, @init_vector),
    CURRENT_TIMESTAMP,
    NULL
),
(
    3,
    3,
    'c__brock',
    AES_ENCRYPT('cb_3t^pU4n6', @key_str, @init_vector),
    CURRENT_TIMESTAMP,
    'Personal Facebook account'
),
(
    4,
    2,
    'afuller',
    AES_ENCRYPT('af_Grl105)?', @key_str, @init_vector),
    CURRENT_TIMESTAMP,
    'First job was at Target'
),
(
    5,
    4,
    'aunderwood',
    AES_ENCRYPT('au_3121_Qbk', @key_str, @init_vector),
    CURRENT_TIMESTAMP,
    NULL
),
(
    5,
    3,
    'a_underwood',
    AES_ENCRYPT('au_P70oe[5z', @key_str, @init_vector),
    CURRENT_TIMESTAMP,
    'Inactive for now; consider reactivation'
);
