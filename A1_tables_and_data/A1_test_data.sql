INSERT INTO Account (account_num, user_name) VALUES ('A1', 'Alice');
INSERT INTO Account (account_num, user_name) VALUES ('A2', 'Alice');
INSERT INTO Account (account_num, user_name) VALUES ('A3', 'Bob');

INSERT INTO Token (token_id, value, account_num) VALUES ('T1', '120', 'A1');
INSERT INTO Token (token_id, value, account_num) VALUES ('T2', '200', 'A1');
INSERT INTO Token (token_id, value, account_num) VALUES ('T3', '80', 'A2');
INSERT INTO Token (token_id, value, account_num) VALUES ('T4', '150', 'A3');
INSERT INTO Token (token_id, value, account_num) VALUES ('T5', '50', 'A3');

INSERT INTO Transaction (trans_id, amount, from_account, to_account) VALUES ('1', '320', 'A1', 'A2');
INSERT INTO Transaction (trans_id, amount, from_account, to_account) VALUES ('2', '90', 'A2', 'A1');

INSERT INTO InternalTransaction (trans_id, internal_id, from_account, to_account, token_id) VALUES ('1', '1', 'A1', 'A2', 'T1');
INSERT INTO InternalTransaction (trans_id, internal_id, from_account, to_account, token_id) VALUES ('1', '2', 'A1', 'A2', 'T2');
INSERT INTO InternalTransaction (trans_id, internal_id, from_account, to_account, token_id) VALUES ('2', '1', 'A2', 'A1', 'T3');

# the first row is fake data for creating 'B2'
INSERT INTO Block (block_id, hash, prev_hash, prev_id) VALUES ('B2', 'xxxx', 'xxxx', 'B2');
INSERT INTO Block (block_id, hash, prev_hash, prev_id) VALUES ('B3', '34fs', 'a67d', 'B2');
INSERT INTO Block (block_id, hash, prev_hash, prev_id) VALUES ('B4', '5g8y', '34fs', 'B3');
INSERT INTO Block (block_id, hash, prev_hash, prev_id) VALUES ('B5', 'f4h6', '34fs', 'B3');
UPDATE Block SET prev_id = 'B5' WHERE block_id = 'B2';
