CREATE OR REPLACE PROCEDURE change_name(
        p_artistid IN ARTIST.ArtistID%TYPE, 
        p_firstname IN FNAME.FirstName%TYPE, 
        p_lastname IN LNAME.LastName%TYPE)
    IS
    BEGIN
        --Insert the new first name into FNAME
        INSERT INTO FNAME (FnameID, FirstName) 
        VALUES (Fname_seq.NEXTVAL, p_firstname);

        --Updates the ENDDATE column to the current date for the given ArtistID for the row where the ENDDATE is null, or does nothing if no rows are found.
        UPDATE Artist_Fname
        SET ENDDATE = SYSDATE
        WHERE ArtistID = p_artistid AND ENDDATE IS NULL;
    
        --Make a new record in the Artist_Fname table
        INSERT INTO Artist_Fname (Artist_FnameID, ArtistID, FnameID, StartTime, EndTime)
        VALUES (Artist_Fname_seq.NEXTVAL, p_artistid, Fname_seq.CURRVAL, SYSDATE, NULL);

        --Insert the new last name into LNAME
        INSERT INTO LNAME (LnameID, LastName) 
        VALUES (Lname_seq.NEXTVAL, p_lastname);

        --Updates the ENDDATE column to the current date for the given ArtistID for the row where the ENDDATE is null, or does nothing if no rows are found.
        UPDATE Artist_Lname
        SET ENDDATE = SYSDATE
        WHERE ArtistID = p_artistid AND ENDDATE IS NULL;
    
        --Make a new record in the Artist_Lname table
        INSERT INTO Artist_Lname (Artist_LnameID, ArtistID, LnameID, StartTime, EndTime)
        VALUES (Artist_Lname_seq.NEXTVAL, p_artistid, Lname_seq.CURRVAL, SYSDATE, NULL);
END change_name;