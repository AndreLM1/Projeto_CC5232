import mysql.connector
from faker import Faker
import random
from datetime import datetime, timedelta

# Conexão com o banco de dados
conexao = mysql.connector.connect(
    # host= endereço do schema
    # user= usuário criado
    # password= senha do usuário
    # database= nome do banco 
    
    host='127.0.0.1',
    user='andre',
    password='senha',
    database='project_spotify'
)

print('Conexao feita!')


cursor = conexao.cursor()
fake = Faker()

# Funções para gerar dados e inserir nas tabelas


def gerar_artistas(qtd=10):
    for _ in range(qtd):
        nome = fake.name()
        data_nascimento = fake.date_of_birth(minimum_age=18, maximum_age=60)
        cursor.execute(
            "INSERT INTO ARTISTA (Nome, Data_Nascimento) VALUES (%s, %s)",
            (nome, data_nascimento)
        )
    conexao.commit()

def gerar_discos(qtd=10):
    cursor.execute("SELECT ID_Artista FROM ARTISTA")
    artistas = [artista[0] for artista in cursor.fetchall()]
    for _ in range(qtd):
        titulo = fake.sentence(nb_words=3)
        data_lancamento = fake.date_this_decade()
        id_artista = random.choice(artistas)
        cursor.execute(
            "INSERT INTO DISCO (Titulo, Data_Lancamento, ID_Artista) VALUES (%s, %s, %s)",
            (titulo, data_lancamento, id_artista)
        )
    conexao.commit()

def gerar_musicas(qtd=20):
    cursor.execute("SELECT ID_Disco FROM DISCO")
    discos = [disco[0] for disco in cursor.fetchall()]
    for _ in range(qtd):
        titulo = fake.sentence(nb_words=2)
        duracao = f"{random.randint(2, 5)}:{random.randint(0, 59):02d}"
        id_disco = random.choice(discos)
        cursor.execute(
            "INSERT INTO MUSICA (Titulo, Duracao, ID_Disco) VALUES (%s, %s, %s)",
            (titulo, duracao, id_disco)
        )
    conexao.commit()

def gerar_usuarios(qtd=5):
    for _ in range(qtd):
        nome = fake.name()
        email = fake.unique.email()
        data_registro = fake.date_this_year()
        cursor.execute(
            "INSERT INTO USUARIO (Nome, Email, Data_Registro) VALUES (%s, %s, %s)",
            (nome, email, data_registro)
        )
    conexao.commit()

def gerar_playlists(qtd=10):
    cursor.execute("SELECT ID_Usuario FROM USUARIO")
    usuarios = [usuario[0] for usuario in cursor.fetchall()]
    for _ in range(qtd):
        titulo = fake.sentence(nb_words=3)
        id_usuario = random.choice(usuarios)
        cursor.execute(
            "INSERT INTO PLAYLIST (Titulo, ID_Usuario) VALUES (%s, %s)",
            (titulo, id_usuario)
        )
    conexao.commit()

def gerar_musica_playlist():
    cursor.execute("SELECT ID_Musica FROM MUSICA")
    musicas = [musica[0] for musica in cursor.fetchall()]
    cursor.execute("SELECT ID_Playlist FROM PLAYLIST")
    playlists = [playlist[0] for playlist in cursor.fetchall()]
    for _ in range(30):
        id_musica = random.choice(musicas)
        id_playlist = random.choice(playlists)
        cursor.execute(
            "INSERT INTO MUSICA_PLAYLIST (ID_Musica, ID_Playlist) VALUES (%s, %s)",
            (id_musica, id_playlist)
        )
    conexao.commit()

def gerar_musica_artista():
    cursor.execute("SELECT ID_Musica FROM MUSICA")
    musicas = [musica[0] for musica in cursor.fetchall()]
    cursor.execute("SELECT ID_Artista FROM ARTISTA")
    artistas = [artista[0] for artista in cursor.fetchall()]
    for _ in range(30):
        id_musica = random.choice(musicas)
        id_artista = random.choice(artistas)
        cursor.execute(
            "INSERT INTO MUSICA_ARTISTA (ID_Musica, ID_Artista) VALUES (%s, %s)",
            (id_musica, id_artista)
        )
    conexao.commit()

def fechar_conexao():
    x=str(input('Deseja fechar a conexão [S] [N]? \n')).upper()
    if x == 'S':
        # Fechando a conexão
        cursor.close()
        conexao.close()
        print('Conexao encerrada')
    else:
        print('Conexao mantida')
    status= conexao.is_connected()
    print(f'Status da conexão {status}')
    return x




# # Chamando as funções para inserir dados
gerar_artistas()
gerar_discos()
gerar_musicas()
gerar_usuarios()
gerar_playlists()
gerar_musica_playlist()
gerar_musica_artista()

print("Dados inseridos com sucesso!")
fechar_conexao()




