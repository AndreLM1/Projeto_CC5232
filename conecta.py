from faker import Faker
import random

# Classe para ARTISTA
class Artista:
    def __init__(self, nome, data_nascimento):
        self.nome = nome
        self.data_nascimento = data_nascimento

    def create(self):
        return f"INSERT INTO ARTISTA (Nome, Data_Nascimento) VALUES (\'{self.nome}\', \'{self.data_nascimento}\');\n"

# Classe para DISCO
class Disco:
    def __init__(self, titulo, data_lancamento, id_artista):
        self.titulo = titulo
        self.data_lancamento = data_lancamento
        self.id_artista = id_artista

    def create(self):
        return f"INSERT INTO DISCO (Titulo, Data_Lancamento, ID_Artista) VALUES (\'{self.titulo}\', \'{self.data_lancamento}\', {self.id_artista});\n"

# Classe para USUARIO
class Usuario:
    def __init__(self, nome, email, data_registro):
        self.nome = nome
        self.email = email
        self.data_registro = data_registro

    def create(self):
        return f"INSERT INTO USUARIO (Nome, Email, Data_Registro) VALUES (\'{self.nome}\', \'{self.email}\', \'{self.data_registro}\');\n"

# Classe para MUSICA
class Musica:
    def __init__(self, titulo, duracao, id_disco):
        self.titulo = titulo
        self.duracao = duracao
        self.id_disco = id_disco

    def create(self):
        return f"INSERT INTO MUSICA (Titulo, Duracao, ID_Disco) VALUES (\'{self.titulo}\', \'{self.duracao}\', {self.id_disco});\n"

# Classe para PLAYLIST
class Playlist:
    def __init__(self, titulo, id_usuario):
        self.titulo = titulo
        self.id_usuario = id_usuario

    def create(self):
        return f"INSERT INTO PLAYLIST (Titulo, ID_Usuario) VALUES (\'{self.titulo}\', {self.id_usuario});\n"

# Classe para a tabela intermediária MUSICA_PLAYLIST
class MusicaPlaylist:
    def __init__(self, id_musica, id_playlist):
        self.id_musica = id_musica
        self.id_playlist = id_playlist

    def create(self):
        return f"INSERT INTO MUSICA_PLAYLIST (ID_Musica, ID_Playlist) VALUES ({self.id_musica}, {self.id_playlist});\n"

# Classe para a tabela intermediária MUSICA_ARTISTA
class MusicaArtista:
    def __init__(self, id_musica, id_artista):
        self.id_musica = id_musica
        self.id_artista = id_artista

    def create(self):
        return f"INSERT INTO MUSICA_ARTISTA (ID_Musica, ID_Artista) VALUES ({self.id_musica}, {self.id_artista});\n"

# Gerando dados fictícios
fake = Faker(['pt_BR'])

# Dados de ARTISTAS
artistas = [Artista(fake.name(), fake.date_of_birth()) for _ in range(10)]

# Dados de DISCOS
discos = [Disco(fake.word(), fake.date(), random.randint(1, 10)) for _ in range(10)]

# Dados de USUARIOS
usuarios = [Usuario(fake.name(), fake.email(), fake.date()) for _ in range(10)]

# Dados de MUSICAS
musicas = [Musica(fake.word(), f"{random.randint(2, 5)}:{random.randint(0, 59):02d}", random.randint(1, 10)) for _ in range(10)]

# Dados de PLAYLISTS
playlists = [Playlist(fake.word(), random.randint(1, 10)) for _ in range(10)]

# Relação MUSICA_PLAYLIST (M:N)
musica_playlists = [MusicaPlaylist(random.randint(1, 10), random.randint(1, 10)) for _ in range(15)]

# Relação MUSICA_ARTISTA (M:N)
musica_artistas = [MusicaArtista(random.randint(1, 10), random.randint(1, 10)) for _ in range(15)]

# Salvando as queries em um arquivo SQL
with open("./seeder.sql", "w", encoding='utf-8') as f:
    # Inserindo ARTISTAS
    for artista in artistas:
        f.write(artista.create())
    
    f.write("\n")

    # Inserindo DISCOS
    for disco in discos:
        f.write(disco.create())
    
    f.write("\n")

    # Inserindo USUARIOS
    for usuario in usuarios:
        f.write(usuario.create())
    
    f.write("\n")

    # Inserindo MUSICAS
    for musica in musicas:
        f.write(musica.create())
    
    f.write("\n")

    # Inserindo PLAYLISTS
    for playlist in playlists:
        f.write(playlist.create())
    
    f.write("\n")

    # Inserindo relações MUSICA_PLAYLIST
    for musica_playlist in musica_playlists:
        f.write(musica_playlist.create())
    
    f.write("\n")

    # Inserindo relações MUSICA_ARTISTA
    for musica_artista in musica_artistas:
        f.write(musica_artista.create())

