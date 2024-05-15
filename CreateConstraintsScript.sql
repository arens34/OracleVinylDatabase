--ADDING FOREIGN KEY CONSTRAINTS AFTER THE TABLES HAVE BEEN CREATED

--Artist Foreign Keys
ALTER TABLE Artist_Fname ADD CONSTRAINT fk_artist_fname FOREIGN KEY (ArtistID) REFERENCES Artist(ArtistID);
ALTER TABLE Artist_Fname ADD CONSTRAINT fk_fname FOREIGN KEY (FnameID) REFERENCES Fname(FnameID);
ALTER TABLE Artist_Lname ADD CONSTRAINT fk_artist_lname FOREIGN KEY (ArtistID) REFERENCES Artist(ArtistID);
ALTER TABLE Artist_Lname ADD CONSTRAINT fk_lname FOREIGN KEY (LnameID) REFERENCES Lname(LnameID);

--Album Foreign Keys
ALTER TABLE Album_AlbumName ADD CONSTRAINT fk_album_albumname FOREIGN KEY (AlbumID) REFERENCES Album(AlbumID);
ALTER TABLE Album_AlbumName ADD CONSTRAINT fk_albumname FOREIGN KEY (AlbumNameID) REFERENCES AlbumName(AlbumNameID);
ALTER TABLE Album_AlbumType ADD CONSTRAINT fk_album_albumtype FOREIGN KEY (AlbumID) REFERENCES Album(AlbumID);
ALTER TABLE Album_AlbumType ADD CONSTRAINT fk_albumtype FOREIGN KEY (AlbumTypeID) REFERENCES AlbumType(AlbumTypeID);
ALTER TABLE Album_ReleaseDate ADD CONSTRAINT fk_album_releasedate FOREIGN KEY (AlbumID) REFERENCES Album(AlbumID);
ALTER TABLE Album_ReleaseDate ADD CONSTRAINT fk_releasedate FOREIGN KEY (ReleaseDateID) REFERENCES ReleaseDate(ReleaseDateID);
ALTER TABLE Album_Labels ADD CONSTRAINT fk_album_labels FOREIGN KEY (AlbumID) REFERENCES Album(AlbumID);
ALTER TABLE Album_Labels ADD CONSTRAINT fk_labels FOREIGN KEY (LabelID) REFERENCES Labels(LabelID);
ALTER TABLE Album_Genres ADD CONSTRAINT fk_album_genres FOREIGN KEY (AlbumID) REFERENCES Album(AlbumID);
ALTER TABLE Album_Genres ADD CONSTRAINT fk_genres FOREIGN KEY (GenreID) REFERENCES Genres(GenreID);

--Song Foreign Keys
ALTER TABLE Song ADD CONSTRAINT fk_song_album FOREIGN KEY (AlbumID) REFERENCES Album(AlbumID);
ALTER TABLE Song_SongName ADD CONSTRAINT fk_song_songname FOREIGN KEY (SongID) REFERENCES Song(SongID);
ALTER TABLE Song_SongName ADD CONSTRAINT fk_songname FOREIGN KEY (SongNameID) REFERENCES SongName(SongNameID);

--Old Tables Foreign Keys
ALTER TABLE Recording ADD CONSTRAINT fk_Recording_SongID FOREIGN KEY (SongID) REFERENCES Song(SongID);

ALTER TABLE ArtistMakesRecording ADD CONSTRAINT fk_ArtistMakesRecording_ArtistID FOREIGN KEY (ArtistID) REFERENCES Artist(ArtistID);
ALTER TABLE ArtistMakesRecording ADD CONSTRAINT fk_ArtistMakesRecording_RecordingID FOREIGN KEY (RecordingID) REFERENCES Recording(RecordingID);

ALTER TABLE ArtistMakesAlbum ADD CONSTRAINT fk_ArtistMakesAlbum_ArtistID FOREIGN KEY (ArtistID) REFERENCES Artist(ArtistID);
ALTER TABLE ArtistMakesAlbum ADD CONSTRAINT fk_ArtistMakesAlbum_AlbumID FOREIGN KEY (AlbumID) REFERENCES Album(AlbumID);

ALTER TABLE ArtistMakesSong ADD CONSTRAINT fk_ArtistMakesSong_ArtistID FOREIGN KEY (ArtistID) REFERENCES Artist(ArtistID);
ALTER TABLE ArtistMakesSong ADD CONSTRAINT fk_ArtistMakesSong_SongID FOREIGN KEY (SongID) REFERENCES Song(SongID);
