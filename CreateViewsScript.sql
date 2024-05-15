--CREATING THE VIEWS
--Each view only selects the records where the ENDTIME is null in the related associative table
--(meaning it is currently active)
CREATE VIEW Artist_View AS
SELECT a.ArtistID, fn.FirstName, ln.LastName
FROM Artist a
JOIN Artist_Fname af ON a.ArtistID = af.ArtistID
JOIN Fname fn ON af.FnameID = fn.FnameID
JOIN Artist_Lname al ON a.ArtistID = al.ArtistID
JOIN Lname ln ON al.LnameID = ln.LnameID
WHERE
    af.EndTime IS NULL
    AND
    al.EndTime IS NULL;


CREATE VIEW Album_View AS
SELECT a.AlbumID, an.AlbumName, at.TypeName, rd.ReleaseDate, l.LabelName, g.GenreName
FROM Album a
JOIN Album_AlbumName aan ON a.AlbumID = aan.AlbumID
JOIN AlbumName an ON aan.AlbumNameID = an.AlbumNameID
JOIN Album_AlbumType aat ON a.AlbumID = aat.AlbumID
JOIN AlbumType at ON aat.AlbumTypeID = at.AlbumTypeID
JOIN Album_ReleaseDate ard ON a.AlbumID = ard.AlbumID
JOIN ReleaseDate rd ON ard.ReleaseDateID = rd.ReleaseDateID
JOIN Album_Labels al ON a.AlbumID = al.AlbumID
JOIN Labels l ON al.LabelID = l.LabelID
JOIN Album_Genres ag ON a.AlbumID = ag.AlbumID
JOIN Genres g ON ag.GenreID = g.GenreID
WHERE
    aan.EndTime IS NULL
    AND
    aat.EndTime IS NULL
    AND
    ard.EndTime IS NULL
    AND
    al.EndTime IS NULL
    AND
    ag.EndTime IS NULL;


CREATE VIEW Song_View AS
SELECT s.AlbumID, s.SongID, sn.SongName
FROM Song s
JOIN Song_SongName ssn ON s.SongID = ssn.SongID
JOIN SongName sn ON ssn.SongNameID = sn.SongNameID
WHERE
    ssn.EndTime IS NULL;