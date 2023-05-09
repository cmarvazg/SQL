SELECT a.Nombre, a.ApellidoP Apellido, p.Nombre Premio
FROM Premios p INNER JOIN Artista_premio ap ON p.ID_premio = ap.ID_premio
INNER JOIN Artistas a ON ap.ID_artista = a.ID_artista;

SELECT nombre Obra
FROM ObraArte
where Fecha_realizacion > '01/01/1850';

SELECT  A.nombre, A.apellidoP, V.nombre
FROM Artistas A, vertienteArtistica V
WHERE A.ID_artista = V.ID_artista;

SELECT nombre, apellidoP,escuela_procedencia
FROM Artistas 
WHERE LOWER(escuela_procedencia) LIKE '%bellas artes%';

SELECT G.nombre, MAX(S.tamanio)
FROM Sala S, Galeria_sala GS, Galerias G 
WHERE S.ID_sala = GS.ID_sala AND GS.ID_galeria = G.ID_galeria
GROUP BY G.nombre;

SELECT A.nombre, COUNT(*) No_obras
FROM Artistas A FULL OUTER JOIN Colectivo C ON A.id_artista=C.id_artista FULL OUTER JOIN ObraArte O ON C.id_obra=O.id_obra
GROUP BY A.nombre;

SELECT T.nombre,  COUNT(*)
FROM Tematica T, Exposiciones E
WHERE T.id_exposicion=E.id_exposicion 
GROUP BY T.nombre;

SELECT A.nombre, COUNT(P.nombre) No_premios
FROM Artistas A FULL OUTER JOIN Artista_premio AP ON A.id_artista=AP.id_artista FULL OUTER JOIN Premios P ON AP.id_premio=P.id_premio
GROUP BY A.nombre
HAVING(COUNT(P.nombre)>=1);

SELECT T.nombre
FROM Tecnica T FULL OUTER JOIN ObraArte OA ON T.id_obra=OA.id_obra
GROUP BY T.nombre
HAVING COUNT(T.nombre)=(SELECT MAX(COUNT(T.nombre))
                        FROM Tecnica T FULL OUTER JOIN ObraArte OA ON T.id_obra=OA.id_obra
                        GROUP BY T.nombre);

SELECT T.nombre
FROM Tematica T FULL OUTER JOIN  Exposiciones E ON T.id_exposicion=E.id_exposicion
GROUP BY T.nombre
HAVING COUNT(T.nombre)=(SELECT MAX(COUNT(T.nombre))
                        FROM Tematica T FULL OUTER JOIN  Exposiciones E ON T.id_exposicion=E.id_exposicion
                        GROUP BY T.nombre);

SELECT MAX(S.num_disponible), G.id_galeria
FROM Sala S FULL OUTER JOIN Galeria_sala GS ON S.ID_sala = GS.ID_sala FULL OUTER JOIN Galerias G ON  GS.ID_galeria = G.ID_galeria 
GROUP BY G.id_galeria
HAVING MAX(S.num_disponible)=(SELECT MAX(num_disponible)
                              FROM Sala );

SELECT T.nombre
FROM Tematica T FULL OUTER JOIN  Exposiciones E ON T.id_exposicion=E.id_exposicion
GROUP BY T.nombre
HAVING COUNT(T.nombre)=(SELECT MIN(COUNT(T.nombre))
                        FROM Tematica T FULL OUTER JOIN  Exposiciones E ON T.id_exposicion=E.id_exposicion
                        GROUP BY T.nombre);

SELECT T.nombre
FROM Tecnica T FULL OUTER JOIN ObraArte OA ON T.id_obra=OA.id_obra
GROUP BY T.nombre
HAVING COUNT(T.nombre)=(SELECT MIN(COUNT(T.nombre))
                        FROM Tecnica T FULL OUTER JOIN ObraArte OA ON T.id_obra=OA.id_obra 
                        GROUP BY T.nombre);


