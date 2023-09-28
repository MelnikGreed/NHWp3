CREATE TABLE Жанры(
	id SERIAL PRIMARY KEY,
	жанр VARCHAR(60) 
);

CREATE TABLE Исполнители(
	id SERIAL PRIMARY KEY,
	имя VARCHAR(60) NOT NULL,
	псевдоним VARCHAR(60)
);

CREATE TABLE ИсполнителиЖанры(
	id_исполнителя INT,
	id_жанра INT,
	FOREIGN KEY (id_исполнителя)
REFERENCES Исполнители(id),
	FOREIGN KEY (id_жанра)
REFERENCES Жанры(id)
);

CREATE TABLE Альбомы(
	id SERIAL PRIMARY KEY,
	название VARCHAR(60),
	год_выпуска INT
);

CREATE TABLE ИсполнителиАльбомы(
	id_исполнителя INT,
	id_альбома INT,
	FOREIGN KEY (id_исполнителя)
REFERENCES Исполнители (id),
	FOREIGN KEY (id_альбома)
REFERENCES Альбомы (id)
);

CREATE TABLE Треки(
	id SERIAL PRIMARY KEY,
	название VARCHAR(60),
	длительность INT,
	id_альбома INT,
	FOREIGN KEY (id_альбома)
REFERENCES Альбомы(id)
);

CREATE TABLE Сборники(
	id SERIAL PRIMARY KEY,
	название VARCHAR(60),
	год_выпуска INT
);

CREATE TABLE ТрекиСборники(
	id_сборника INT,
	id_трека INT,
	FOREIGN KEY (id_сборника)
REFERENCES Сборники (id),
	FOREIGN KEY (id_трека)
REFERENCES Треки (id)
);
	
ALTER TABLE Альбомы
ADD CONSTRAINT check_год_выпуска CHECK (год_выпуска >= 2010);

ALTER TABLE Сборники
ADD CONSTRAINT check_год_выпуска CHECK (год_выпуска >= 2010);

ALTER TABLE Жанры
ADD CONSTRAINT unique_название_жанра UNIQUE (жанр);

ALTER TABLE Треки
ADD CONSTRAINT check_длительность CHECK (длительность > 2);

ALTER TABLE ТрекиСборники
ADD CONSTRAINT pk_ТрекиСборники PRIMARY KEY (id_сборника, id_трека)
