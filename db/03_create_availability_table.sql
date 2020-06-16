CREATE TABLE booking (
bookingid INT NOT NULL,
date DATE,
listingid INT,
PRIMARY KEY (bookingid),
CONSTRAINT FK_listingid FOREIGN KEY (listingid)
REFERENCES listing(listingid)
);
