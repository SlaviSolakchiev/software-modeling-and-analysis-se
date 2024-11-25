INSERT INTO Users (UserID, Username, Email, DateOfBirth)  
VALUES 
    (NEWID(), 'Alice', 'alice@example.com', '1992-03-14'),
    (NEWID(), 'Bob', 'bob@example.com', '1988-06-22'),
    (NEWID(), 'Charlie', 'charlie@example.com', '1995-10-05');



INSERT INTO Channels (ChannelID, ChannelName, UserID)  
VALUES 
    (3, 'AliceChannel', (SELECT UserID FROM Users WHERE Username = 'Alice')),
    (4, 'BobChannel', (SELECT UserID FROM Users WHERE Username = 'Bob')),
    (5, 'CharlieChannel', (SELECT UserID FROM Users WHERE Username = 'Charlie'));



INSERT INTO Videos (VideoID, Title, Description, UserID, ChannelID, TagID)  
VALUES 
    (NEWID(), 'Video1', 'Description1', (SELECT UserID FROM Users WHERE Username = 'Alice'), 3, 1),
    (NEWID(), 'Video2', 'Description2', (SELECT UserID FROM Users WHERE Username = 'Bob'), 4, 1),
    (NEWID(), 'Video3', 'Description3', (SELECT UserID FROM Users WHERE Username = 'Charlie'), 5, 1);


INSERT INTO VideoTags (TagID, TagName, VideoID)  
VALUES 
    (2, 'Education', (SELECT TOP 1 VideoID FROM Videos WHERE Title = 'Video1')),
    (3, 'Entertainment', (SELECT TOP 1 VideoID FROM Videos WHERE Title = 'Video2'));


INSERT INTO Comments (CommentID, Content, UserID, VideoID)  
VALUES 
    (NEWID(), 'Great video!', (SELECT UserID FROM Users WHERE Username = 'Alice'), (SELECT VideoID FROM Videos WHERE Title = 'Video1')),
    (NEWID(), 'Very helpful!', (SELECT UserID FROM Users WHERE Username = 'Bob'), (SELECT VideoID FROM Videos WHERE Title = 'Video2'));



INSERT INTO Playlists (PlaylistID, PlaylistName, UserID)  
VALUES 
    (NEWID(), 'Favorites', (SELECT UserID FROM Users WHERE Username = 'Alice')),
    (NEWID(), 'Watch Later', (SELECT UserID FROM Users WHERE Username = 'Bob'));
