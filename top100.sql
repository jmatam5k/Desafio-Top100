--1. Crear base de datos llamada películas
CREATE DATABASE peliculas;

-- 2. Revisar los archivos peliculas.csv y reparto.csv para crear las tablas correspondientes,
--determinando la relación entre ambas tablas. 
--Respuesta: Determiné que la relación es el id de la pelicula

-- 3. Cargar ambos archivos a su tabla correspondiente (1 punto)
CREATE TABLE peliculas(id INT, pelicula VARCHAR(60), anio_estreno INT, director VARCHAR(60), PRIMARY KEY(id));
\copy peliculas FROM '/Users/jennifermatamalagodoy/Desktop/peliculas.csv' csv header;
CREATE TABLE reparto(id SERIAL, id_pelicula INT, actor VARCHAR(30), FOREIGN KEY (id_pelicula) REFERENCES peliculas(id)); 
\copy reparto(id_pelicula, actor) FROM '/Users/jennifermatamalagodoy/Desktop/reparto.csv' csv header;

--4. Listar todos los actores que aparecen en la película "Titanic", indicando el título de la película,
--año de estreno, director y todo el reparto. 
SELECT * FROM peliculas INNER JOIN reparto ON peliculas.id = reparto.id_pelicula WHERE pelicula = 'Titanic';

-- 5. Listar los titulos de las películas donde actúe Harrison Ford.
SELECT pelicula FROM peliculas JOIN reparto ON peliculas.id = reparto.id_pelicula WHERE actor = 'Harrison Ford';

--6. Listar los 10 directores mas populares, indicando su nombre y cuántas películas aparecen en el top 100.
SELECT director, COUNT(director) FROM peliculas GROUP BY director ORDER BY COUNT(director) DESC LIMIT 10;

-- 7. Indicar cuantos actores distintos hay 
SELECT COUNT(DISTINCT actor) FROM reparto;

--8. Indicar las películas estrenadas entre los años 1990 y 1999 (ambos incluidos) ordenadas por título de manera ascendente.
SELECT * FROM peliculas WHERE anio_estreno BETWEEN 1990 AND 1999 ORDER BY pelicula ASC;

-- 9. Listar el reparto de las películas lanzadas el año 2001
SELECT actor, pelicula FROM reparto JOIN peliculas ON reparto.id_pelicula = peliculas.id WHERE anio_estreno = 2001;

-- 10. Listar los actores de la película más nueva 
SELECT actor, pelicula, anio_estreno FROM reparto JOIN peliculas ON reparto.id_pelicula = peliculas.id ORDER BY peliculas.anio_estreno DESC LIMIT 1;