CREATE DATABASE TUGASBC1

USE TUGASBC1

CREATE TABLE Users(
	UserID int PRIMARY KEY,
	FirstName VARCHAR(255) NOT NULL,
	LastName VARCHAR(255),
	School VARCHAR(255),
	AddressName VARCHAR(255),
	Email VARCHAR(255),
	PhoneNumber BIGINT,
	LocationName VARCHAR(255),
	DateOfBirth VARCHAR(255) NOT NULL,
	Gender CHAR(2) CHECK(Gender LIKE 'F' OR Gender LIKE 'M')
)
SELECT * FROM Users
DROP TABLE Users
CREATE TABLE Posts(
	PostID int PRIMARY KEY,
	UserID int,
	PostContent VARCHAR(255),
	PostDate VARCHAR(255),
)

SELECT * FROM Posts
DROP TABLE Posts
CREATE TABLE Pages(
	PageID int PRIMARY KEY,
	PageName VARCHAR(255),
	PageContent VARCHAR(255)
)

SELECT * FROM Pages

CREATE TABLE PageLikes(
	PageID int,
	UserID int,
	CONSTRAINT PageLikesPK PRIMARY KEY(PageID),
	CONSTRAINT PageLikesFK FOREIGN KEY(UserID)
	REFERENCES Users(UserID)
	ON UPDATE CASCADE ON DELETE SET NULL
)
SELECT * FROM PageLikes
DROP TABLE PageLikes

CREATE TABLE Friends(
	FriendID int,
	UserID int,
	CONSTRAINT FriendsPK PRIMARY KEY(FriendID),
	CONSTRAINT FriendsFK FOREIGN KEY(UserID)
	REFERENCES Users(UserID)
	ON UPDATE CASCADE ON DELETE SET NULL
)
SELECT * FROM Friends
DROP TABLE Friends
CREATE TABLE CommentLikes(
	CommentID int,
	UserID int,
	CONSTRAINT CommentLikesPK PRIMARY KEY(CommentID),
	CONSTRAINT CommentLikesFK FOREIGN KEY(UserID)
	REFERENCES Users(UserID)
	ON UPDATE CASCADE ON DELETE SET NULL
)
SELECT * FROM CommentLikes
DROP TABLE CommentLikes
CREATE TABLE Comments(
	CommentID int PRIMARY KEY,
	UserID int,
	PostID int,
	CommentContent VARCHAR(255),
	CommentDate VARCHAR(255)
)
SELECT * FROM Comments

CREATE TABLE Shares(
	PostID int,
	UserID int,
	CONSTRAINT SharesPK PRIMARY KEY(PostID),
	CONSTRAINT SharesFK FOREIGN KEY(UserID)
	REFERENCES Users(UserID)
	ON UPDATE CASCADE ON DELETE SET NULL
)
SELECT * FROM Shares
DROP TABLE Shares

CREATE TABLE Photos(
	PhotoID int PRIMARY KEY,
	PostID int,
	CONSTRAINT PhotosFK FOREIGN KEY(PostID)
	REFERENCES Shares(PostID)
	ON UPDATE CASCADE ON DELETE SET NULL
)
SELECT * FROM Photos
DROP TABLE Photos
CREATE TABLE PostLikes(
	PostID int,
	UserID int,
	CONSTRAINT PostLikesPK PRIMARY KEY(PostID),
	CONSTRAINT PostLikesFK FOREIGN KEY(UserID)
	REFERENCES Users(UserID)
	ON UPDATE CASCADE ON DELETE SET NULL
)

DROP TABLE PostLikes

SELECT * FROM PostLikes