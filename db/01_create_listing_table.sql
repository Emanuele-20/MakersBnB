CREATE TABLE listing (
    listingid SERIAL PRIMARY KEY, 
    title VARCHAR(50), 
    description VARCHAR(200), 
    price INT, 
    postcode TEXT
);