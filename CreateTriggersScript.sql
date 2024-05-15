--The triggers need to be an INSTEAD OF trigger to handle inserts, updates, and deletes.

CREATE OR REPLACE TRIGGER Artist_Trigger
INSTEAD OF INSERT OR UPDATE ON Artist_View
FOR EACH ROW
BEGIN
    --For FName
    UPDATE Artist_Fname
    SET ENDDATE = SYSDATE
    WHERE ArtistID = :NEW.ArtistID AND ENDDATE IS NULL;

    INSERT INTO Fname (FnameID, FIRSTNAME)
    VALUES (Fname_seq.NEXTVAL, :NEW.FIRSTNAME);

    INSERT INTO Artist_FName (Artist_FnameID, ArtistID, FnameID, StartTime, EndTime)
    VALUES (Artist_FName_seq.NEXTVAL, :NEW.ArtistID, FName_seq.CURRVAL, SYSDATE, NULL);

    --For LName
    UPDATE Artist_Lname
    SET ENDDATE = SYSDATE
    WHERE ArtistID = :NEW.ArtistID AND ENDDATE IS NULL;

    INSERT INTO Lname (LnameID, LASTNAME)
    VALUES (Lname_seq.NEXTVAL, :NEW.LASTNAME);

    INSERT INTO Artist_LName (Artist_LnameID, ArtistID, LnameID, StartTime, EndTime)
    VALUES (Artist_LName_seq.NEXTVAL, :NEW.ArtistID, LName_seq.CURRVAL, SYSDATE, NULL);
END;

--Trigger for Artist specifically for deletes
CREATE OR REPLACE TRIGGER Artist_View_Del_Trigger
INSTEAD OF DELETE ON Artist_View
FOR EACH ROW
BEGIN
    -- Mark the current active first name association as ended
    UPDATE Artist_Fname
    SET ENDDATE = SYSDATE,
    is_deleted = 'Y'
    WHERE ArtistID = :OLD.ArtistID
    AND ENDDATE IS NULL;

    -- Mark the current active last name association as ended
    UPDATE Artist_Lname
    SET ENDDATE = SYSDATE,
    is_deleted = 'Y'
    WHERE ArtistID = :OLD.ArtistID
    AND ENDDATE IS NULL;
END;
/

CREATE OR REPLACE TRIGGER Album_Trigger
INSTEAD OF INSERT OR UPDATE ON Album_View
FOR EACH ROW
BEGIN
    --For AlbumName
    UPDATE Album_AlbumName
    SET ENDDATE = SYSDATE
    WHERE AlbumID = :NEW.AlbumID AND ENDDATE IS NULL;

    INSERT INTO AlbumName (AlbumID, AlbumName)
    VALUES (AlbumName_seq.NEXTVAL, :NEW.AlbumName);

    INSERT INTO Album_AlbumName (Album_AlbumNameID, AlbumID, AlbumNameID, StartTime, EndTime)
    VALUES (Album_AlbumName_seq.NEXTVAL, :NEW.AlbumID, AlbumName_seq.CURRVAL, SYSDATE, NULL);