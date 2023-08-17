select count(*) from artists;

select *
from playlists;

select *
from genres;

select *
from playlists
where Name like '%s';

select * 
from artists
where Name = "Marvin Gaye";

select *
from albums
where ArtistId = 104;

select *
from artists
inner join albums on artists.ArtistId = albums.ArtistId
where Name = "Amy Winehouse";

select *
from artists
inner join albums on artists.ArtistId = albums.ArtistId
where artists.ArtistId = 250;


--Find all the albums for a given artist
select Name, AlbumId, Title
from artists
join albums on artists.ArtistId = albums.ArtistId
where artists.ArtistId = 17;
--where Name = "Amy Winehouse";

--Find all the songs for a given genre

select * from tracks
join genres on tracks.TrackId = genres.GenreId


select * from genres
where Genres.Name = "Blues";

select * from Genres
join tracks on Genres.GenreId = tracks.GenreId
where Genres.Name = "Comedy"; 

select * from Genres
join tracks on Genres.GenreId = tracks.GenreId
where Genres.GenreId = 8; 

--* Find all the songs in a playlist - by playlist name...

select * from playlists
join playlist_track on playlists.PlaylistId = playlist_track.PlaylistId
join tracks on playlist_track.TrackId = tracks.TrackId
where playlists.Name = "Classical"


--*  one: Find all the artists for a given Genre

select * from genres
join tracks on genres.GenreId = tracks.GenreId
join albums on tracks.AlbumId = albums.AlbumId
join artists on albums.ArtistId = artists.ArtistId
where genres.Name = "Comedy";

select DISTINCT artists.Name
from genres
join tracks on genres.GenreId = tracks.GenreId
join albums on tracks.AlbumId = albums.AlbumId
join artists on albums.ArtistId = artists.ArtistId
where genres.Name = "Comedy";

select * from tracks

--*  two: Find the Playlist with the most / least songs (will need a group by and count)

select * from playlists