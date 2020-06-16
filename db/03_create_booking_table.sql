CREATE TABLE booking (
bookingid SERIAL PRIMARY KEY,
date DATE,
listingid INT,
CONSTRAINT FK_listingid FOREIGN KEY (listingid)
REFERENCES listing(listingid)
);
