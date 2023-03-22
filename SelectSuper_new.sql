SELECT genre_name, COUNT(artist_id) FROM artist_in_genre ag
LEFT JOIN genre_list gl ON gl.id = ag.genre_id 
GROUP BY genre_name;

SELECT release_date, COUNT(track_name) FROM track_list tl 
JOIN album_list al ON tl.album_id = al.id
WHERE al.release_date >=2019 AND al.release_date <= 2020
GROUP BY al.release_date;

SELECT album_name, AVG(track_time) FROM track_list tl 
JOIN album_list al ON tl.album_id = al.id
GROUP BY al.album_name;

--SELECT artist_name FROM artist_list al 
--JOIN artist_album aa ON al.id = aa.id 
--JOIN album_list al2 ON al2.id = aa.id
--WHERE al2.release_date <> 2020
--GROUP BY al.artist_name;

--SELECT artist_name FROM artist_list al 
--JOIN artist_album aa ON al.id = aa.id
--JOIN album_list al2 ON al2.id = aa.id
--WHERE artist_name NOT IN (SELECT artist_name WHERE release_date = 2020);

SELECT artist_name FROM artist_list al 
WHERE artist_name NOT IN (
SELECT artist_name FROM artist_list al
JOIN artist_album aa ON al.id = aa.id 
JOIN album_list al2 ON al2.id = aa.id
WHERE release_date = 2020);

SELECT collection_name FROM collection_list cl 
JOIN collection_album_track cat ON cat.collection_id = cl.id
JOIN track_list tl ON cat.track_id =tl.id
JOIN album_list al ON tl.album_id = al.id
JOIN artist_album aa ON aa.album_id = al.id 
JOIN artist_list al2 ON aa.artist_id = al2.id 
WHERE al2.artist_name = 'Найк Борзов'
GROUP BY cl.collection_name;

SELECT count(genre_id), album_name FROM album_list al 
JOIN artist_album aa ON aa.album_id = al.id
JOIN artist_list al2 ON aa.artist_id = al2.id
JOIN artist_in_genre aig ON aig.artist_id =al2.id
GROUP BY al.album_name
HAVING count(genre_id) > 1;

SELECT track_name FROM track_list tl 
FULL JOIN collection_album_track cat ON tl.id = cat.track_id
LEFT JOIN collection_list cl ON cat.track_id = cl.id
WHERE cat.track_id IS NULL;

SELECT artist_name, track_name, track_time FROM artist_list al 
JOIN artist_album aa ON al.id = aa.artist_id 
JOIN album_list al2 ON al2.id = aa.album_id 
JOIN track_list tl ON al2.id = tl.album_id 
WHERE tl.track_time = (SELECT min(tl.track_time) FROM track_list tl);

SELECT album_name FROM album_list al 
JOIN track_list tl ON al.id = tl.album_id
GROUP BY al.album_name 
HAVING count(tl.track_name) = (SELECT MIN(count) FROM (SELECT al.album_name, COUNT(tl.track_name) FROM album_list al
JOIN track_list tl ON al.id = tl.album_id 
GROUP BY al.album_name) AS foo);


