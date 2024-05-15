
--ARTIST CREATE STATEMENTS
CREATE TABLE Artist (
    ArtistID INT PRIMARY KEY
);

CREATE TABLE Fname (
    FnameID INT PRIMARY KEY,
    FirstName VARCHAR2(255) NOT NULL
);

CREATE TABLE Lname (
    LnameID INT PRIMARY KEY,
    LastName VARCHAR2(255) NOT NULL
);

CREATE TABLE Artist_Fname (
    Artist_FnameID INT PRIMARY KEY,
    ArtistID INT, -- Foreign Key to Artist(ArtistID)
    FnameID INT, -- Foreign Key to Fname(FnameID)
    StartTime TIMESTAMP,
    EndTime TIMESTAMP DEFAULT NULL
);

CREATE TABLE Artist_Lname (
    Artist_LnameID INT PRIMARY KEY,
    ArtistID INT, -- Foreign Key to Artist(ArtistID)
    LnameID INT, -- Foreign Key to Lname(LnameID)
    StartTime TIMESTAMP,
    EndTime TIMESTAMP DEFAULT NULL
);


--ALBUM CREATE STATEMENTS
CREATE TABLE Album (
    AlbumID INT PRIMARY KEY
);

CREATE TABLE AlbumName (
    AlbumNameID INT PRIMARY KEY,
    AlbumName VARCHAR(255) NOT NULL
);

--"Type" changed to "AlbumType" because Type is a reserved keyword in Oracle.
CREATE TABLE AlbumType (
    AlbumTypeID INT PRIMARY KEY,
    TypeName VARCHAR(7) NOT NULL UNIQUE CHECK (TypeName IN ('Single', 'EP', 'Album'))
);

CREATE TABLE ReleaseDate (
    ReleaseDateID INT PRIMARY KEY,
    ReleaseDate DATE NOT NULL
);

CREATE TABLE Labels (
    LabelID INT PRIMARY KEY,
    LabelName VARCHAR(250) NOT NULL UNIQUE
);

CREATE TABLE Genres (
    GenreID INT PRIMARY KEY,
    GenreName VARCHAR(170) NOT NULL UNIQUE
);

CREATE TABLE Album_AlbumName (
    Album_AlbumNameID INT PRIMARY KEY,
    AlbumID INT, -- Foreign Key to Album(AlbumID)
    AlbumNameID INT, -- Foreign Key to AlbumName(AlbumNameID)
    StartTime TIMESTAMP,
    EndTime TIMESTAMP DEFAULT NULL
);

CREATE TABLE Album_AlbumType (
    Album_AlbumTypeID INT PRIMARY KEY,
    AlbumID INT, -- Foreign Key to Album(AlbumID)
    AlbumTypeID INT, -- Foreign Key to AlbumType(AlbumTypeID)
    StartTime TIMESTAMP,
    EndTime TIMESTAMP DEFAULT NULL
);

CREATE TABLE Album_ReleaseDate (
    Album_ReleaseDateID INT PRIMARY KEY,
    AlbumID INT, -- Foreign Key to Album(AlbumID)
    ReleaseDateID INT, -- Foreign Key to ReleaseDate(ReleaseDateID)
    StartTime TIMESTAMP,
    EndTime TIMESTAMP DEFAULT NULL
);

CREATE TABLE Album_Labels (
    Album_LabelsID INT PRIMARY KEY,
    AlbumID INT, -- Foreign Key to Album(AlbumID)
    LabelID INT, -- Foreign Key to Labels(LabelID)
    StartTime TIMESTAMP,
    EndTime TIMESTAMP DEFAULT NULL
);

CREATE TABLE Album_Genres (
    Album_GenresID INT PRIMARY KEY,
    AlbumID INT, -- Foreign Key to Album(AlbumID)
    GenreID INT, -- Foreign Key to Genres(GenreID)
    StartTime TIMESTAMP,
    EndTime TIMESTAMP DEFAULT NULL
);



--SONG CREATE STATEMENTS
CREATE TABLE Song (
    SongID INT PRIMARY KEY,
    AlbumID INT -- Foreign Key to Album(AlbumID)
);

CREATE TABLE SongName (
    SongNameID INT PRIMARY KEY,
    SongName VARCHAR(290)
);

CREATE TABLE Song_SongName (
    Song_SongNameID INT PRIMARY KEY,
    SongID INT, -- Foreign Key to Song(SongID)
    SongNameID INT, -- Foreign Key to SongName(SongNameID)
    StartTime TIMESTAMP,
    EndTime TIMESTAMP DEFAULT NULL
);

--OLD TABLES CREATE STATEMENTS

CREATE TABLE Recording (
    RecordingID INT PRIMARY KEY,
    SongID INT,
    Length INTERVAL DAY TO SECOND,
    RecordingDate DATE,
    Studio VARCHAR2(270)
);

CREATE TABLE ArtistMakesRecording (
    ArtistMakesRecordingID INT PRIMARY KEY,
    Role VARCHAR2(100),
    ArtistID INT,
    RecordingID INT
);

CREATE TABLE ArtistMakesAlbum (
    ArtistMakesAlbumID INT PRIMARY KEY,
    Role VARCHAR2(100),
    ArtistID INT,
    AlbumID INT
);

CREATE TABLE ArtistMakesSong (
    ArtistMakesSongID INT PRIMARY KEY,
    Credits VARCHAR2(300),
    ArtistID INT,
    SongID INT
);
