ALTER TABLE listing
ADD COLUMN userid INT;

ALTER TABLE listing
ADD CONSTRAINT FK_userid FOREIGN KEY (userid) REFERENCES users(userid);