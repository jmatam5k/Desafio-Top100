--1. Crear base de datos llamada películas
CREATE DATABASE peliculas;

-- 2. Revisar los archivos peliculas.csv y reparto.csv para crear las tablas correspondientes,
--determinando la relación entre ambas tablas. 
--Determiné que la relación es el id de la pelicula

-- 3. Cargar ambos archivos a su tabla correspondiente (1 punto)
CREATE TABLE peliculas(id INT, pelicula VARCHAR(60), anio_estreno INT, director VARCHAR(60), PRIMARY KEY(id));
\copy peliculas FROM '/Users/jennifermatamalagodoy/Desktop/peliculas.csv' csv header;
CREATE TABLE reparto(id SERIAL, id_pelicula INT, actor VARCHAR(30), FOREIGN KEY (id_pelicula) REFERENCES peliculas(id)); 
\copy reparto(id_pelicula, actor) FROM '/Users/jennifermatamalagodoy/Desktop/reparto.csv' csv header;

--4. Listar todos los actores que aparecen en la película "Titanic", indicando el título de la película,
--año de estreno, director y todo el reparto. (0.5 puntos)
SELECT * FROM peliculas INNER JOIN reparto ON peliculas.id = reparto.id_pelicula WHERE pelicula = 'Titanic';