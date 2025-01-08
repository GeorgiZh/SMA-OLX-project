CREATE DATABASE OLXPlatform;


USE OLXPlatform;


CREATE TABLE Location (
    LocationID INT PRIMARY KEY IDENTITY(1,1),
    City VARCHAR(100),
    Region VARCHAR(100),
    Country VARCHAR(100)
);


CREATE TABLE Users (
    UserID INT PRIMARY KEY IDENTITY(1,1),
    Username VARCHAR(100),
    Password VARCHAR(255),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    LocationID INT,
    FOREIGN KEY (LocationID) REFERENCES Location(LocationID)
);


CREATE TABLE Category (
    CategoryID INT PRIMARY KEY IDENTITY(1,7),
    Name VARCHAR(100)
);


CREATE TABLE Listing (
    ListingID INT PRIMARY KEY IDENTITY(1,1),
    Title VARCHAR(255),
    Description TEXT,
    Price DECIMAL(10,2),
    UserID INT,
    CategoryID INT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);

CREATE TABLE Message (
    MessageID INT PRIMARY KEY IDENTITY(1,1),
    SenderID INT,
    ReceiverID INT,
    MessageText TEXT,
    SentDate DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (SenderID) REFERENCES Users(UserID),
    FOREIGN KEY (ReceiverID) REFERENCES Users(UserID)
);


CREATE TABLE Transactions (
    TransactionsID INT PRIMARY KEY IDENTITY(1,1),
    ListingID INT,
    BuyerID INT,
    SellerID INT,
    Price DECIMAL(10,2),
    TransactionDate DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (ListingID) REFERENCES Listing(ListingID),
    FOREIGN KEY (BuyerID) REFERENCES Users(UserID),
    FOREIGN KEY (SellerID) REFERENCES Users(UserID)
);

INSERT INTO Location (City, Region, Country)
VALUES
('Sofia', 'Sofia', 'Bulgaria'),
('Plovdiv', 'Plovdiv', 'Bulgaria'),
('Varna', 'Varna', 'Bulgaria'),
('Burgas', 'Burgas', 'Bulgaria'),
('Ruse', 'Ruse', 'Bulgaria'),
('Plovdiv', ' Plovdiv', 'Bulgaria'),
('Pleven', 'Pleven', 'Bulgaria'),
('Blagoevgrad', 'Blagoevgrad', 'Bulgaria'),
('Veliko Tarnovo', 'Veliko Tarnovo', 'Bulgaria'),
('Sofia', 'Sofia', 'Bulgaria'),
('Dobrich', 'Dobrich', 'Bulgaria'),
('Haskovo', 'Haskovo', 'Bulgaria'),
('Sofia', 'Sofia', 'Bulgaria'),
('London', 'London', 'UK');

INSERT INTO Users (Username, Password, Email, Phone, LocationID)
VALUES
('ivan', 'ivan1234', 'ivan@example.com', '0881234567', 1),
('pesho', 'pesho1234', 'pesho@example.com', '0882345678', 2),
('maria', 'maria1234', 'maria@example.com', '0883456789', 3),
('stoyan', 'stoyan1234', 'stoyan@example.com', '0884567890', 4),
('georgi', 'georgi1234', 'georgi@example.com', '0885678912', 5),
('niki', 'niki1234', 'niki@example.com', '0886789123', 6),
('katerina', 'katerina1234', 'katerina@example.com', '0887891234', 7),
('dimitrina', 'dimitrina1234', 'dimitrina@example.com', '0888912345', 8),
('plamen', 'plamen1234', 'plamen@example.com', '0889012345', 9),
('yanka', 'yanka1234', 'yanka@example.com', '0889123456', 10),
('dimitar', 'dimitar1234', 'dimitar@example.com', '0889234567', 11),
('margarita', 'margarita1234', 'margarita@example.com', '0889345678', 12),
('alex', 'alex1234', 'alex@example.com', '0889456789', 13),
('tanya', 'tanya1234', 'tanya@example.com', '0889567890', 14);

INSERT INTO Category (Name)
VALUES
('Electronics'),
('Furniture'),
('Clothing'),
('Vehicles'),
('Books'),
('Sports Equipment'),
('Toys'),
('Home Appliances'),
('Music Instruments'),
('Jewelry'),
('Gaming Equipment'),
('Office Supplies');

INSERT INTO Listing (Title, Description, Price, UserID, CategoryID)
VALUES
('iPhone 13', 'Brand new iPhone 13, 128GB, black color', 1200.00, 1, 1),
('Sofa', 'Comfortable leather sofa, slightly used', 300.00, 2, 2),
('T-Shirt', 'Cotton t-shirt, size L, blue color', 20.00, 3, 3),
('Toyota Corolla', 'Toyota Corolla 2015, very good condition', 8500.00, 4, 4),
('Harry Potter Books', 'Set of 7 Harry Potter books in great condition', 100.00, 5, 3),
('Mountain Bike', 'High-quality mountain bike, barely used', 500.00, 6, 4),
('Lego Set', 'Complete Lego Star Wars set', 60.00, 7, 1),
('Vacuum Cleaner', 'Powerful vacuum cleaner, lightly used', 200.00, 8, 2),
('Acoustic Guitar', 'Yamaha acoustic guitar, excellent condition', 250.00, 9, 9),
('Diamond Necklace', 'Elegant diamond necklace, 14k gold', 1200.00, 10, 10),
('Gaming Laptop', 'High-performance gaming laptop, 16GB RAM, RTX 3060', 1500.00, 11, 11),
('Office Desk', 'Modern office desk, wooden, 120x60 cm', 200.00, 12, 12),
('Headphones', 'Noise-cancelling wireless headphones', 300.00, 13, 1),
('Electric Scooter', 'Foldable electric scooter, 25 km range', 450.00, 14, 4);


INSERT INTO Message (SenderID, ReceiverID, MessageText)
VALUES
(1, 2, 'Hello Pesho, is the iPhone still available?'),
(2, 1, 'Yes, its still available. Would you like to buy it?'),
(3, 4, 'Stoyan, the Toyota Corolla looks great, Im interested!'),
(4, 3, 'Maria, the T-shirt is still up for sale, would you like to buy it?'),
(5, 6, 'Hi Niki, I am interested in the mountain bike. Is it still available?'),
(6, 5, 'Yes Georgi, it is available. When would you like to see it?'),
(7, 8, 'Dimitrina, the Lego set looks great! Can I buy it?'),
(8, 7, 'Yes Katerina, it’s available. Let me know when you can pick it up.'),
(9, 10, 'Hi Yanka, I am interested in the diamond necklace. Is it still available?'),
(10, 9, 'Yes Plamen, it is still available. Would you like to see it in person?'),
(11, 12, 'Hi Margarita, the office desk looks great. Can I reserve it?'),
(12, 11, 'Sure Dimitar, let me know when you would like to pick it up.'),
(13, 14, 'Hello Tanya, is the electric scooter still on sale?'),
(14, 13, 'Yes Alex, it is available. Would you like to test it?');


INSERT INTO Transactions (ListingID, BuyerID, SellerID, Price)
VALUES
(1, 2, 1, 1200.00),  -- Pesho buys iPhone from Ivan
(2, 3, 2, 300.00),   -- Maria buys Sofa from Pesho
(3, 4, 3, 20.00),    -- Stoyan buys T-shirt from Maria
(4, 1, 4, 8500.00),  -- Ivan buys Toyota Corolla from Stoyan
(5, 6, 5, 100.00),   -- Niki buys Harry Potter books from Georgi
(6, 5, 6, 500.00),   -- Georgi buys Mountain Bike from Niki
(7, 8, 7, 60.00),    -- Dimitrina buys Lego set from Katerina
(8, 7, 8, 200.00),  -- Katerina buys Vacuum Cleaner from Dimitrina
(9, 10, 9, 250.00),  -- Yanka buys Guitar from Plamen
(10, 9, 10, 1200.00), -- Plamen buys Diamond Necklace from Yanka
(11, 12, 11, 1500.00), -- Margarita buys Gaming Laptop from Dimitar
(12, 11, 12, 200.00), -- Dimitar buys Office Desk from Margarita
(13, 14, 13, 300.00), -- Tanya buys Headphones from Alex
(14, 13, 14, 450.00); -- Alex buys Electric Scooter from Tanya
CREATE PROCEDURE GetListingsByCategory
    @CategoryID INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT ListingID, Title, Description, Price, UserID, CategoryID
    FROM Listing
    WHERE CategoryID = @CategoryID;
END;
CREATE FUNCTION GetTotalTransactions (@UserID INT)
RETURNS DECIMAL(10,2)
AS
BEGIN
    DECLARE @Total DECIMAL(10,2);

    SELECT @Total = ISNULL(SUM(Price), 0.00)
    FROM Transactions
    WHERE BuyerID = @UserID OR SellerID = @UserID;

    RETURN @Total;
END;
CREATE TRIGGER SetMessageTime
ON Message
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Message
    SET SentDate = GETDATE()
    WHERE MessageID IN (SELECT MessageID FROM INSERTED);
END;
SELECT ListingID FROM Listing;
SELECT T.ListingID
FROM Transactions T
LEFT JOIN Listing L ON T.ListingID = L.ListingID
WHERE L.ListingID IS NULL;

DELETE FROM Transactions
WHERE ListingID NOT IN (SELECT ListingID FROM Listing);

DELETE FROM Listing;
SELECT DISTINCT ListingID
FROM Transactions
WHERE ListingID NOT IN (SELECT ListingID FROM Listing);