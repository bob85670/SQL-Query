DROP DATABASE IF EXISTS `Assignment1`;
CREATE DATABASE `Assignment1`;
USE `Assignment1`;


CREATE TABLE Account (
  account_num VARCHAR(10) NOT NULL PRIMARY KEY,
  user_name VARCHAR(80) NOT NULL
);

CREATE TABLE Token (
  token_id VARCHAR(10) NOT NULL PRIMARY KEY,
  value INT NOT NULL,
  account_num VARCHAR(10) NOT NULL,
  FOREIGN KEY (account_num) REFERENCES Account (account_num)
);

CREATE TABLE Transaction (
  trans_id INT NOT NULL PRIMARY KEY,
  amount INT NOT NULL,
  from_account VARCHAR(10) NOT NULL,
  to_account VARCHAR(10) NOT NULL,
  FOREIGN KEY (from_account) REFERENCES Account (account_num),
  FOREIGN KEY (to_account) REFERENCES Account (account_num)
);

CREATE TABLE InternalTransaction (
  trans_id INT NOT NULL,
  internal_id INT NOT NULL,
  from_account VARCHAR(10) NOT NULL,
  to_account VARCHAR(10) NOT NULL,
  token_id VARCHAR(10) NOT NULL,
  PRIMARY KEY (trans_id, internal_id),
  FOREIGN KEY (trans_id) REFERENCES Transaction (trans_id),
  FOREIGN KEY (from_account) REFERENCES Account (account_num),
  FOREIGN KEY (to_account) REFERENCES Account (account_num),
  FOREIGN KEY (token_id) REFERENCES Token (token_id)
);


CREATE TABLE Block (
  block_id VARCHAR(10) NOT NULL PRIMARY KEY,
  hash VARCHAR(80) NOT NULL,
  prev_hash VARCHAR(80) NOT NULL,
  prev_id VARCHAR(10) NOT NULL,
  FOREIGN KEY (prev_id) REFERENCES Block (block_id)
);
