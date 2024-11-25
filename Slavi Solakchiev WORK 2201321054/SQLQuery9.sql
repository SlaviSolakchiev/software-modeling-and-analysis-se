
INSERT INTO DimUsers (UserID, Username, Email)
SELECT UserID, Username, Email FROM Youtube.dbo.Users;


INSERT INTO DimChannels (ChannelID, ChannelName)
SELECT ChannelID, ChannelName FROM Youtube.dbo.Channels;

INSERT INTO DimDates (FullDate, Year, Month, Day)
VALUES ('2024-11-24', 2024, 11, 24);




INSERT INTO FactVideos (VideoID, Title, UploadDate, UserKey, ChannelKey)
SELECT 
    v.VideoID, 
    v.Title, 
    v.UploadDate,
    u.UserKey, 
    c.ChannelKey
FROM Youtube.dbo.Videos v
JOIN DimUsers u ON v.UserID = u.UserID
JOIN DimChannels c ON v.ChannelID = c.ChannelID;

INSERT INTO FactComments (CommentID, Content, UserKey, VideoKey, PostedDate)
SELECT 
    c.CommentID, 
    c.Content,
    u.UserKey,
    v.VideoKey,
    c.PostedDate
FROM Youtube.dbo.Comments c
JOIN DimUsers u ON c.UserID = u.UserID
JOIN FactVideos v ON c.VideoID = v.VideoID;
