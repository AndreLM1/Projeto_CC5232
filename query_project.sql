use project_spotify;

-- Criação das tabelas
 CREATE TABLE ARTISTA (
     ID_Artista INT PRIMARY KEY auto_increment,
     Nome VARCHAR(255) NOT NULL,
     Data_Nascimento DATE NOT NULL
 );

 CREATE TABLE DISCO (
     ID_Disco INT PRIMARY KEY auto_increment,
     Titulo VARCHAR(255) NOT NULL,
     Data_Lancamento DATE NOT NULL,
     ID_Artista INT,
     FOREIGN KEY (ID_Artista) REFERENCES ARTISTA(ID_Artista)
     ON UPDATE CASCADE ON DELETE CASCADE
 );

 CREATE TABLE USUARIO (
     ID_Usuario INT PRIMARY KEY auto_increment,
     Nome VARCHAR(255) NOT NULL,
     Email VARCHAR(255) UNIQUE NOT NULL,
     Data_Registro DATE NOT NULL
 );

CREATE TABLE MUSICA (
     ID_Musica INT PRIMARY KEY auto_increment,
     Titulo VARCHAR(255) NOT NULL,
     Duracao VARCHAR(255) NOT NULL,
     ID_Disco INT,
     FOREIGN KEY (ID_Disco) REFERENCES DISCO(ID_Disco)
     ON UPDATE CASCADE ON DELETE CASCADE
 );

 CREATE TABLE PLAYLIST (
     ID_Playlist INT PRIMARY KEY auto_increment,
     Titulo VARCHAR(255) NOT NULL,
     ID_Usuario INT,
     FOREIGN KEY (ID_Usuario) REFERENCES USUARIO(ID_Usuario)
     ON UPDATE CASCADE ON DELETE CASCADE
 );
 
 
 -- Tabela intermediária para relação M:N
 CREATE TABLE MUSICA_PLAYLIST(
	ID_Musica INT,
    ID_Playlist INT,
    PRIMARY KEY (ID_Playlist, ID_Musica),
	FOREIGN KEY (ID_Musica) REFERENCES musica(ID_Musica)
    ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (ID_Playlist) REFERENCES PLAYLIST(ID_Playlist)
	ON UPDATE CASCADE ON DELETE CASCADE
 );
 
 -- Tabela intermediária para relação M:N
 CREATE TABLE MUSICA_ARTISTA(
	ID_Musica INT,
    ID_Artista INT,
    FOREIGN KEY (ID_Musica) REFERENCES musica(ID_Musica)
    ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (ID_Artista) REFERENCES artista(ID_Artista)
    ON UPDATE CASCADE ON DELETE CASCADE
 );


-- -- Criação de um usuário
CREATE USER 'andre'@'localhost' IDENTIFIED BY 'senha'; 

create user 'teste1'@'localhost' identified by 'senha';

-- Permissões para o usuário criado
GRANT INSERT, DELETE, SELECT, UPDATE
ON project_spotify.* to andre;

-- Permissão para inserir na tabela
grant insert
on project_spotify.* to teste1@localhost;

SELECT User, Host FROM mysql.user;

select * from artista;
select * from disco;
select * from playlist;
select * from musica
where titulo= 'Bohemian Rhapsody';
select * from usuario;
select * from musica_playlist;



select id_musica, titulo, duracao from musica
where id_disco = '3';



-- teste update da tabela musica
update  musica
set duracao='3:02'
where titulo='Machine';


-- Deletar dados na tabela 
delete from disco
where ID_Disco='3';

-- Update na tabela
UPDATE usuario SET id_usuario='01' where nome='andre';

-- add artista
insert into artista(id_artista, nome, data_nascimento) values
('2','AC/DC', '1973-11-30');

-- add disco
insert into disco(titulo, data_lancamento, id_artista) values
('Highway to Hell', '1979-07-27', '2');

-- Add música 
insert into musica (titulo, duracao, id_disco) values
('Highway to Hell', '328', '30');

-- Criar um usuario do streaming 
insert into usuario(Nome, Email, Data_Registro) values
('spotify', 'spotify@gmail', '2015-01-10');

-- Criar uma playlist  
insert into playlist( titulo, id_usuario) values
('TOP50', '15');

-- Adicionar Musica a uma playlist 
insert into musica_playlist(ID_Musica, ID_Playlist) values
('71', '26');

-- Associar Musica a um artista 
insert into musica_artista(ID_Musica, ID_Artista) values
('71', '2');



-- DROP TABLE MUSICA_PLAYLIST;
-- DROP TABLE playlist;
-- DROP TABLE usuario;
-- DROP TABLE musica;
-- DROP TABLE disco;
-- DROP TABLE artista;
