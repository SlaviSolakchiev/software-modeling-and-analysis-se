INSERT INTO Users (UserID, Username, Email, DateOfBirth)
VALUES (NEWID(), 'JohnDoe', 'john.doe@example.com', '1990-01-01');

INSERT INTO Users (UserID, Username, Email, DateOfBirth)
VALUES (NEWID(), 'JaneSmith', 'jane.smith@example.com', '1995-05-15');



INSERT INTO Channels (ChannelID, ChannelName, UserID)
VALUES (1, 'JohnsTechChannel', (SELECT UserID FROM Users WHERE Username = 'JohnDoe'));

INSERT INTO Channels (ChannelID, ChannelName, UserID)
VALUES (2, 'JanesVlogs', (SELECT UserID FROM Users WHERE Username = 'JaneSmith'));


INSERT INTO Videos (VideoID, Title, Description, UserID, ChannelID, TagID)
VALUES (NEWID(), 'How to Code', 'Learn coding basics', (SELECT UserID FROM Users WHERE Username = 'JohnDoe'), 1, NULL);


INSERT INTO Comments (CommentID, Content, UserID, VideoID)
VALUES (NEWID(), 'Great tutorial!', (SELECT UserID FROM Users WHERE Username = 'JaneSmith'), 
        (SELECT VideoID FROM Videos WHERE Title = 'How to Code'));




INSERT INTO VideoTags (TagID, TagName, VideoID)
VALUES (1, 'Education', (SELECT VideoID FROM Videos WHERE Title = 'How to Code'));



SELECT * FROM Users;


EXEC sp_helptext 'AddVideo';
sp_help 'Videos';

Select * from Users

SELECT UserID FROM Users WHERE Username = 'TestUser';

EXEC AddVideo  
    @Title = 'My First Video',  
    @Description = 'This is the description of my first video.',  
    @UserID = 'BC483AF1-030D-4707-BC61-589D66C2B0AC',
    @ChannelID = 1,
    @TagID = 1;

	SELECT * FROM Videos;


	SELECT dbo.GetUserVideoCount('BC483AF1-030D-4707-BC61-589D66C2B0AC') AS VideoCount;