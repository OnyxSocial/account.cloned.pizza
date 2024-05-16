CREATE TABLE Users (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    Username VARCHAR(50) UNIQUE NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    PasswordHash VARCHAR(255) NOT NULL,
    FullName VARCHAR(100),
    Bio TEXT,
    ProfilePictureURL VARCHAR(255),
    DateJoined DATETIME DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE Posts (
    PostID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT NOT NULL,
    Content TEXT NOT NULL,
    ImageURL VARCHAR(255),
    DatePosted DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);
CREATE TABLE Comments (
    CommentID INT PRIMARY KEY AUTO_INCREMENT,
    PostID INT NOT NULL,
    UserID INT NOT NULL,
    Content TEXT NOT NULL,
    DateCommented DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (PostID) REFERENCES Posts(PostID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);
CREATE TABLE Likes (
    LikeID INT PRIMARY KEY AUTO_INCREMENT,
    PostID INT NOT NULL,
    UserID INT NOT NULL,
    DateLiked DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (PostID) REFERENCES Posts(PostID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    UNIQUE (PostID, UserID)
);
CREATE TABLE Friendships (
    User1ID INT NOT NULL,
    User2ID INT NOT NULL,
    Status ENUM('Pending', 'Accepted', 'Rejected') DEFAULT 'Pending',
    DateRequested DATETIME DEFAULT CURRENT_TIMESTAMP,
    DateAccepted DATETIME,
    PRIMARY KEY (User1ID, User2ID),
    FOREIGN KEY (User1ID) REFERENCES Users(UserID),
    FOREIGN KEY (User2ID) REFERENCES Users(UserID)
);
CREATE TABLE Messages (
    MessageID INT PRIMARY KEY AUTO_INCREMENT,
    SenderID INT NOT NULL,
    ReceiverID INT NOT NULL,
    Content TEXT NOT NULL,
    DateSent DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (SenderID) REFERENCES Users(UserID),
    FOREIGN KEY (ReceiverID) REFERENCES Users(UserID)
);






