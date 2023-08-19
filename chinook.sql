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
--MOST

select playlists.PlaylistId, playlists.Name, COUNT(playlist_track.TrackId)
AS NumberOfSongs
from playlists
join playlist_track on playlists.PlaylistId = playlist_track.PlaylistId
GROUP BY playlists.PlaylistId, playlists.Name
ORDER BY NumberOfSongs DESC
LIMIT 1;
--least
select playlists.PlaylistId, playlists.Name, COUNT(playlist_track.TrackId)
AS NumberOfSongs
from playlists
join playlist_track on playlists.PlaylistId = playlist_track.PlaylistId
GROUP BY playlists.PlaylistId, playlists.Name
ORDER BY NumberOfSongs ASC
LIMIT 1;

--*  three: Find the total for a given invoice (will need a sum)

select *, SUM (Total)
from invoices
where CustomerId = 57

--select * FROM invoices

--*  four: Find all the playlists containing a given genre

select * from genres
join tracks on genres.GenreId = tracks.GenreId
join playlist_track on tracks.TrackId = playlist_track.TrackId
join playlists on playlist_track.PlaylistId = playlists.PlaylistId
where playlists.PlaylistId = 1;

select DISTINCT playlists.PlaylistId, playlists.Name 
from playlists
join playlist_track ON playlists.PlaylistId = playlist_track.PlaylistId
join tracks ON playlist_track.TrackId = tracks.TrackId
join genres ON genres.GenreId = tracks.GenreId
where genres.Name = "Rock"

--*  five: Find the biggest/smallest invoice amounts (needs group by)

select MAX(Total), InvoiceId
from invoices

select MIN(Total), InvoiceId
from invoices


--*  six: Find the artist with the most/least songs (needs group by)
--most
select artists.Name, COUNT(tracks.TrackId) AS songs
from artists
join albums on albums.ArtistId = artists.ArtistId
join tracks on tracks.AlbumId = albums.AlbumId
GROUP BY artists.Name
ORDER BY songs DESC
LIMIT 1
--least
select artists.Name, COUNT(tracks.TrackId) AS songs
from artists
join  albums on albums.ArtistId = artists.ArtistId
join  tracks on tracks.AlbumId = albums.AlbumId
GROUP BY artists.Name
ORDER BY songs 
LIMIT 1