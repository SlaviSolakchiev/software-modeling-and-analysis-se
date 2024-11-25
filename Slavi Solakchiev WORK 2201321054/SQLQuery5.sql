CREATE TRIGGER ValidateCommentContent
ON Comments
AFTER INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1 
        FROM inserted 
        WHERE LEN(Content) > 50
    )
    BEGIN
        PRINT 'Comment content exceeds the maximum length of 50 characters.';
        ROLLBACK TRANSACTION;
    END;
END;
