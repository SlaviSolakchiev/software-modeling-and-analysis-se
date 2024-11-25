CREATE DATABASE YouTubeDW;

USE YouTubeDW;


CREATE TABLE DimUsers (
    UserKey INT IDENTITY(1,1) PRIMARY KEY,
    UserID UNIQUEIDENTIFIER,
    Username NVARCHAR(50),
    Email NVARCHAR(50)
);

CREATE TABLE DimChannels (
    ChannelKey INT IDENTITY(1,1) PRIMARY KEY,
    ChannelID INT,
    ChannelName NVARCHAR(50)
);

CREATE TABLE DimDates (
    DateKey INT IDENTITY(1,1) PRIMARY KEY,
    FullDate DATETIME,
    Year INT,
    Month INT,
    Day INT
);




CREATE TABLE FactVideos (
    VideoKey INT IDENTITY(1,1) PRIMARY KEY,
    VideoID UNIQUEIDENTIFIER,
    Title NVARCHAR(50),
    UploadDate DATETIME,
    UserKey INT FOREIGN KEY REFERENCES DimUsers(UserKey),
    ChannelKey INT FOREIGN KEY REFERENCES DimChannels(ChannelKey)
);

CREATE TABLE FactComments (
    CommentKey INT IDENTITY(1,1) PRIMARY KEY,
    CommentID UNIQUEIDENTIFIER,
    Content NVARCHAR(50),
    UserKey INT FOREIGN KEY REFERENCES DimUsers(UserKey),
    VideoKey INT FOREIGN KEY REFERENCES FactVideos(VideoKey),
    PostedDate DATETIME
);
