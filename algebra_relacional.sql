-- item 1 Liste o título de todas as músicas e suas durações.
select 
titulo,
duracao
from musica;

-- item 2 Encontre o nome de todos os artistas que têm mais de 5 músicas em seu repertório.
select count(a.id_artista) as Musicas, a.nome from artista a
inner join disco b on a.id_artista = b.id_artista
inner join musica c on b.id_disco = c.id_disco
group by a.id_artista
having count(a.id_artista) > 5;

-- item 3 Quais são os títulos dos discos lançados após 2020?
select titulo, data_lancamento from disco
where year(Data_Lancamento) > '2020';

-- item 4 Liste os títulos das músicas e os nomes dos artistas que as interpretam, ordenados pelo título da música.
select a.titulo as Musica, b.nome from musica a
left join disco c on a.id_disco = c.id_disco
left join artista b on c.id_artista =  b.id_artista
order by musica asc;

-- item 5 Encontre os títulos das playlists que contêm a música com o título 'Certain.'.
select a.titulo Playlist, b.titulo Musica
from playlist a, musica b
where b.titulo = 'Certain.';

-- item 6 Liste os usuários que criaram playlists que contêm músicas do disco 'Employee difference.'. 
select a.nome as Nome, d.titulo as Musica, b.titulo as Playlist from usuario a
inner join playlist b on a.id_usuario = b.id_usuario
inner join musica_playlist c on b.id_playlist = c.id_playlist
inner join musica d on c.id_musica = d.id_musica
where d.titulo= 'Employee difference.';

-- item 7 Qual é a duração média das músicas de um artista específico?
select round(avg(a.duracao),2) as Duracao, b.nome Artista 
from musica a, artista b
where b.nome = 'Lisa Landry';

-- item 8 Encontre todos os artistas que não têm músicas
select a.id_artista ID, a.nome Artista FROM artista a
left join disco b on a.id_artista = b.id_artista
left join musica c on b.id_disco = c.id_disco
where c.id_musica is NULL;

-- item 9 Liste todos os discos que contêm mais de 3 músicas.
select a.titulo as Disco, count(a.id_disco) as Musicas from disco a
inner join musica b on a.id_disco = b.id_disco
group by Disco
having count(a.id_disco) > 3;


-- item 10 Quais são os nomes dos artistas que têm discos lançados antes de 2010 e que têm músicas na playlist 'Top 50'? (NAO sei)
SELECT DISTINCT  A.Nome AS Artista, d.titulo as Disco FROM ARTISTA A
JOIN MUSICA_ARTISTA MA ON A.ID_Artista = MA.ID_Artista
JOIN MUSICA M ON MA.ID_Musica = M.ID_Musica
JOIN DISCO D ON M.ID_Disco = D.ID_Disco
JOIN MUSICA_PLAYLIST MP ON M.ID_Musica = MP.ID_Musica
JOIN PLAYLIST P ON MP.ID_Playlist = P.ID_Playlist
WHERE D.Data_Lancamento < '2010-01-01' AND P.Titulo = 'TOP50';


-- 11 Quais músicas são interpretadas por mais de um artista?
select a.titulo as Musica, c.nome as Artista from musica a
left join musica_artista b on a.id_musica =  b.id_musica
inner join artista c on b.id_artista = c.id_artista
order by Musica asc;

-- 12 Liste os títulos das músicas que aparecem em mais de uma playlist.
select a.titulo as Musica, count(b.id_playlist) as Playlist from musica a
inner join musica_playlist b on a.id_musica = b.id_musica
group by Musica
having count(b.id_playlist)>1;

-- 13 Encontre os nomes dos usuários que têm playlists que incluem a música 'Bohemian Rhapsody'.
select a.nome as Nome, d.titulo as Musica, b.titulo as Playlist from usuario a
inner join playlist b on a.id_usuario = b.id_usuario
inner join musica_playlist c on b.id_playlist = c.id_playlist
inner join musica d on c.id_musica = d.id_musica
where d.titulo= 'Bohemian Rhapsody';

-- 14 Qual é o título da música mais longa do disco 'Six identify.'?
select titulo as Musica, duracao as Tempo, titulo as Disco from musica
where id_disco=25 and duracao = (select max(duracao) from musica where id_disco=25);


-- 15 Liste todos os discos lançados por um artista específico em um determinado ano.
select d.titulo as Disco, d.Data_Lancamento, a.nome as Artista from  disco d
left join  artista a on d.ID_Artista = a.ID_Artista
where a.nome = 'Lisa Landry' and year(D.Data_Lancamento) = 2020;


-- 16 Quais são os nomes dos artistas que têm músicas em playlists criadas por um usuário específico?

SELECT DISTINCT A.Nome AS Artista FROM USUARIO U
JOIN PLAYLIST P ON U.ID_Usuario = P.ID_Usuario
JOIN MUSICA_PLAYLIST MP ON P.ID_Playlist = MP.ID_Playlist
JOIN MUSICA M ON MP.ID_Musica = M.ID_Musica
JOIN MUSICA_ARTISTA MA ON M.ID_Musica = MA.ID_Musica
JOIN ARTISTA A ON MA.ID_Artista = A.ID_Artista
WHERE U.Nome = 'Kim Peters';


-- 17. Encontre a lista de músicas que não estão em nenhuma playlist.
SELECT M.Titulo AS Musica  FROM MUSICA M
LEFT JOIN MUSICA_PLAYLIST MP ON M.ID_Musica = MP.ID_Musica
WHERE MP.ID_Musica IS NULL;

-- 18. Liste os títulos das músicas e os nomes dos artistas que têm mais de 1 músicas em uma mesma playlist.
SELECT A.Nome AS Artista, M.Titulo AS Musica, P.Titulo AS Playlist, COUNT(M.ID_Musica) AS Total_Musicas FROM MUSICA M
JOIN MUSICA_ARTISTA MA ON M.ID_Musica = MA.ID_Musica
JOIN ARTISTA A ON MA.ID_Artista = A.ID_Artista
JOIN MUSICA_PLAYLIST MP ON M.ID_Musica = MP.ID_Musica
JOIN PLAYLIST P ON MP.ID_Playlist = P.ID_Playlist
GROUP BY A.Nome, P.Titulo, M.Titulo
HAVING COUNT(M.ID_Musica) > 1;

-- 19. Quais são os discos que contêm músicas de artistas que têm pelo menos 2 discos lançados?
SELECT DISTINCT D.Titulo AS Disco FROM DISCO D
JOIN MUSICA M ON D.ID_Disco = M.ID_Disco
JOIN MUSICA_ARTISTA MA ON M.ID_Musica = MA.ID_Musica
JOIN ARTISTA A ON MA.ID_Artista = A.ID_Artista
WHERE A.ID_Artista IN (SELECT ID_Artista FROM DISCO GROUP BY ID_Artista  HAVING COUNT(ID_Disco) >= 2);

-- 20. Liste todos os usuários e suas playlists, mas apenas para playlists que contêm pelo menos 5 músicas?
SELECT U.Nome AS Usuario, P.Titulo AS Playlist, COUNT(MP.ID_Musica) AS Total_Musicas FROM USUARIO U
JOIN PLAYLIST P ON U.ID_Usuario = P.ID_Usuario
JOIN MUSICA_PLAYLIST MP ON P.ID_Playlist = MP.ID_Playlist
GROUP BY U.Nome, P.Titulo
HAVING COUNT(MP.ID_Musica) >= 5;










