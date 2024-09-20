CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title NVARCHAR(255) NOT NULL,
    Author NVARCHAR(255) NOT NULL,
    ISBN NVARCHAR(13) NOT NULL UNIQUE,
    PublishedDate DATE,
    Genre NVARCHAR(100),
    ShelfLocation NVARCHAR(100),
    CurrentStatus NVARCHAR(10) CHECK (CurrentStatus IN ('Available', 'Borrowed'))
);
CREATE TABLE Borrowers (
    BorrowerID INT PRIMARY KEY,
    FirstName NVARCHAR(100) NOT NULL,
    LastName NVARCHAR(100) NOT NULL,
    Email NVARCHAR(255) NOT NULL UNIQUE,
    DateOfBirth DATE,
    MembershipDate DATE NOT NULL
);
CREATE TABLE Loans (
    LoanID INT PRIMARY KEY,
    BookID INT NOT NULL,
    BorrowerID INT NOT NULL,
    DateBorrowed DATE NOT NULL,
    DueDate DATE NOT NULL,
    DateReturned DATE NULL,
    CONSTRAINT FK_BookID FOREIGN KEY (BookID) REFERENCES Books(BookID),
    CONSTRAINT FK_BorrowerID FOREIGN KEY (BorrowerID) REFERENCES Borrowers(BorrowerID)
);
