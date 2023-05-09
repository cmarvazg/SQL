alter session set nls_date_format = 'dd/mm/yyyy hh24:mi:ss';

CREATE TABLE Artistas(
    ID_artista INT PRIMARY KEY NOT NULL,
    Nombre VARCHAR(30) NOT NULL,
    ApellidoP VARCHAR(20) NOT NULL,
    ApellidoM VARCHAR(20),
    Fecha_nacimiento DATE NOT NULL,
    Escuela_procedencia VARCHAR(60),
    Biografia VARCHAR(500) NOT NULL
);

CREATE TABLE Especialidad(
    ID_especialiad INT PRIMARY KEY NOT NULL,
    Nombre VARCHAR(80) NOT NULL,
    ID_artista INT REFERENCES Artistas (ID_artista) NOT NULL
);

CREATE TABLE VertienteArtistica(
    ID_vertiente INT PRIMARY KEY NOT NULL,
    Nombre VARCHAR(70) NOT NULL,
    ID_artista INT REFERENCES Artistas (ID_artista) NOT NULL
);


CREATE TABLE Premios(
	ID_premio INT PRIMARY KEY NOT NULL,
	Nombre VARCHAR(50),
	Anio INT,
	Institucion VARCHAR(50)
);

CREATE TABLE Galerias(
    ID_galeria INT PRIMARY KEY NOT NULL,
    Nombre VARCHAR(50) NOT NULL,
    Direccion VARCHAR(100) NOT NULL,
    Telefono VARCHAR(10)
);

CREATE TABLE Exposiciones(
    ID_exposicion INT PRIMARY KEY NOT NULL,
    ID_galeria INT REFERENCES Galerias(ID_galeria) NOT NULL,
    Permanencia VARCHAR(15) NOT NULL,
    CHECK (LOWER(Permanencia) IN ('itinerante','permanente')),
    Fecha_inicio DATE NOT NULL, 
    Fecha_fin DATE 
);

CREATE TABLE Tematica(
    ID_tematica INT PRIMARY KEY NOT NULL,
    Nombre VARCHAR(20) NOT NULL,
    ID_exposicion INT REFERENCES Exposiciones(ID_exposicion)
);

CREATE TABLE Sala(
	ID_sala INT PRIMARY KEY NOT NULL,
	Tamanio VARCHAR(15) NOT NULL,
	Num_disponible INT NOT NULL
);

CREATE TABLE Galeria_sala(
    ID_galeria INT REFERENCES Galerias(ID_galeria) NOT NULL,
    ID_sala INT REFERENCES Sala (ID_sala) NOT NULL,
    CONSTRAINT GSPK PRIMARY KEY (ID_galeria,ID_sala)
);

CREATE TABLE ObraArte(
    ID_obra  INT PRIMARY KEY NOT NULL,
    ID_exposicion INT REFERENCES Exposiciones(ID_exposicion) NOT NULL,
    Nombre VARCHAR(50) NOT NULL,
    Fecha_realizacion DATE NOT NULL,
    Dimensiones VARCHAR(20) NOT NULL,
    Peso INT NOT NULL,
    Iluminacion VARCHAR(20) NOT NULL,
    Temperatura VARCHAR(15) NOT NULL,
    Humedad VARCHAR(15) NOT NULL
);

CREATE TABLE Tecnica(
    ID_tecnica INT PRIMARY KEY NOT NULL,
    Nombre VARCHAR(35) NOT NULL,
    ID_obra INT REFERENCES ObraArte(ID_obra) NOT NULL
);

CREATE TABLE EncargadoMontaje(
    ID_encargado INT PRIMARY KEY NOT NULL,
    ID_galeria INT REFERENCES Galerias(ID_galeria) NOT NULL,
    Nombre VARCHAR(20) NOT NULL,
    ApellidoP VARCHAR(20) NOT NULL,
    ApellidoM VARCHAR(20)
);

CREATE TABLE Artista_premio(
    ID_artista INT REFERENCES Artistas(ID_artista) NOT NULL,
    ID_premio INT REFERENCES Premios(ID_premio) NOT NULL,
    CONSTRAINT APPK PRIMARY KEY(ID_artista, ID_premio)
);

CREATE TABLE Colectivo(
    ID_artista INT REFERENCES Artistas(ID_artista) NOT NULL, 
    ID_obra INT REFERENCES ObraArte(ID_obra) NOT NULL,
    CONSTRAINT CPK PRIMARY KEY(ID_artista, ID_obra),
    Nombre VARCHAR(50),
    Fecha_inicio DATE NOT NULL,
    Fecha_fin DATE 
);
