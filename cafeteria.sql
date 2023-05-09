alter session set nls_date_format = 'dd/mm/yyyy hh24:mi:ss';

CREATE TABLE clientes (id_cliente int PRIMARY KEY,
                      nombre  varchar(20) NOT NULL,
                      apellido varchar(20) NOT NULL);

insert into clientes values(1,'Rodrigo','Rojas');
insert into clientes values(2,'Fernanda','Morales');
insert into clientes values(3,'Valeria','Jimenez');
insert into clientes values(4,'Edgar','Barrera');
insert into clientes values(5,'Sofia','Miranda');
insert into clientes values(6,'Mauricio','Minas');
insert into clientes values(7,'Carlos','Lopez');
insert into clientes values(8,'Martha','Velazquez');
insert into clientes values(9,'Frida','Vega');
insert into clientes values(10,'Alberto','Martinez');



CREATE TABLE productos(id_producto int PRIMARY KEY,
                      descripcion VARCHAR (100) NOT NULL,
                      precio number(3) NOT NULL,
                      receta VARCHAR(100));

INSERT INTO productos VALUES (1, 'Mocha', 45,  'chocolate, leche, café espresso y nata');
INSERT INTO productos VALUES (2, 'Capuchino', 50,  'espresso (30 ml) + partes iguales de leche y crema de leche');
INSERT INTO productos VALUES (3, 'Americano', 40,  'Extraeremos el expreso, servimos más agua');
INSERT INTO productos VALUES (4, 'Expresso', 35,  'Moler café, colocarlo en la cafetera, limpiar el filtro con agua caliente');
INSERT INTO productos VALUES (5, 'Muffin', 40, 'calentar');
INSERT INTO productos VALUES (6, 'Croissants', 35, 'En el pan poner jamon, lechuga, queso y mayonesa');



CREATE TABLE tickets(id_ticket int PRIMARY KEY,
			         fecha	date	NOT NULL,
			         id_cliente	int REFERENCES clientes(id_cliente));

INSERT INTO tickets VALUES(1,'01/04/2022',1);
INSERT INTO tickets VALUES(2,'01/04/2022',2);
INSERT INTO tickets VALUES(3,'01/04/2022',3);
INSERT INTO tickets VALUES(4,'01/04/2022',4);
INSERT INTO tickets VALUES(5,'01/04/2022',5);
INSERT INTO tickets VALUES(6,'01/04/2022',6);
INSERT INTO tickets VALUES(7,'01/04/2022',7);
INSERT INTO tickets VALUES(8,'01/04/2022',8);
INSERT INTO tickets VALUES(9,'01/04/2022',9);
INSERT INTO tickets VALUES(10,'01/04/2022',10);



CREATE TABLE ventas(id_ventas int PRIMARY KEY,
                    id_producto int REFERENCES productos(id_producto),
                    id_ticket int REFERENCES tickets(id_ticket));

insert into ventas VALUES (1, 2, 6);
insert into ventas VALUES (2, 2, 7);
insert into ventas VALUES (3, 3, 8);
insert into ventas VALUES (4, 4, 9);
insert into ventas VALUES (5, 5, 10);
INSERT INTO ventas VALUES (6, 5, 1);
INSERT INTO ventas VALUES (7, 3, 2);
INSERT INTO ventas VALUES (8, 1, 3);
INSERT INTO ventas VALUES (9, 6, 4);
INSERT INTO ventas VALUES (10, 2, 5);
