CREATE TABLE availability (
datesid INT NOT NULL,
date DATE,
listingid INT,
PRIMARY KEY (datesid),
CONSTRAINT FK_listingid FOREIGN KEY (listingid)
REFERENCES listing(listingid)
);