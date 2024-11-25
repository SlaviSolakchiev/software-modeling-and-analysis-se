CREATE PROCEDURE AddVideo
    @Title NVARCHAR(50),
    @Description NVARCHAR(100),
    @UserID UNIQUEIDENTIFIER,
    @ChannelID INT,
    @TagID INT
AS
BEGIN
    INSERT INTO Videos (Title, Description, UploadDate, UserID, ChannelID, TagID)
    VALUES (@Title, @Description, GETDATE(), @UserID, @ChannelID, @TagID);
END;
