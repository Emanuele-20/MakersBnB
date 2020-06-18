CREATE TABLE listing (
  listingid SERIAL PRIMARY KEY, 
  title VARCHAR(50), 
  description VARCHAR(200), 
  price INT, 
  postcode TEXT,
  userid INT,
  CONSTRAINT FK_userid FOREIGN KEY (userid)
  REFERENCES users(userid)
);