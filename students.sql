alter session set nls_date_format = 'dd/mm/yyyy hh24:mi:ss';
create table carreras(id_carrera varchar(3) primary key,
creditos varchar(3)not null,
semestres varchar(1) not null,
nombre varchar(90) not null);
insert into carreras values('301','408','8','Administracion');
insert into carreras values('304','408','2','Contaduria');
insert into carreras values('308','408','3','Informatica');
insert into carreras values('310','408','4','Negocios');
create table alumnos(no_cuenta varchar(9) primary key,
id_carrera varchar(3) references carreras(id_carrera),
nombre varchar(30) not null,
direccion varchar(90) not null,
fecha_naci date not null,
telefono varchar(10) not null,
celular varchar(10) not null,
email varchar(50) not null);
insert into alumnos values('123456700','301','Jessica','direccion
1','01/01/2002','5548623564','5546897896','email@.com');
insert into alumnos values('123456704','301','Erick','direccion
2','02/01/2002','5549863547','5546358745','email@.com');
insert into alumnos values('123456705','301','George','direccion
3','03/01/2002','5546982356','5541326987','email@.com');
insert into alumnos values('123456706','301','Gonzalo','direccion
4','04/01/2002','5544998866','5547698563','email@.com');
insert into alumnos values('123456707','304','Rafael','direccion
5','05/01/2002','5548976321','5547321658','email@.com');
insert into alumnos values('123456708','304','Giovana','direccion
6','06/01/2002','5548978963','5547698532','email@.com');
insert into alumnos values('123456709','304','Javier','direccion
7','07/01/2002','5500102356','5510243201','email@.com');
insert into alumnos values('123456710','304','Tomas','direccion
8','08/01/2002','5549103579','5546987985','email@.com');
insert into alumnos values('123456711','304','Sebastian','direccion
9','09/01/2002','5549876321','5541023698','email@.com');
insert into alumnos values('123456712','304','Juan','direccion
10','01/10/2002','5546987369','5469876352','email@.com');
insert into alumnos values('123456713','308','Esther','direccion
11','11/01/2002','5549876325','5432103654','email@.com');
insert into alumnos values('123456714','310','Ana','direccion
12','12/01/2002','5547185236','5510201233','email@.com');insert into alumnos values('123456715','310','Jose','direccion
13','13/01/2002','5502365498','5547896988','email@.com');
create table grupos(id_grupo varchar(4) primary key,
semestre varchar(1) not null);
insert into grupos values('1000','1');
insert into grupos values('2000','2');
insert into grupos values('3000','3');
insert into grupos values('4000','4');
insert into grupos values('5000','5');
insert into grupos values('6000','6');
insert into grupos values('7000','7');
insert into grupos values('8000','8');
create table alumno_grupo(no_cuenta varchar(9) references alumnos(no_cuenta),
id_grupo varchar(4) references grupos(id_grupo),
primary key(no_cuenta,id_grupo));
insert into alumno_grupo values('123456700','1000');
insert into alumno_grupo values('123456704','2000');
insert into alumno_grupo values('123456705','3000');
insert into alumno_grupo values('123456706','4000');
insert into alumno_grupo values('123456707','5000');
insert into alumno_grupo values('123456708','6000');
insert into alumno_grupo values('123456709','7000');
insert into alumno_grupo values('123456710','8000');
insert into alumno_grupo values('123456711','1000');
insert into alumno_grupo values('123456712','2000');
insert into alumno_grupo values('123456713','3000');
insert into alumno_grupo values('123456714','4000');
insert into alumno_grupo values('123456715','5000');
create table materias(id_materia varchar(4) primary key,
nombre varchar(90) not null,
creditos varchar(2) not null,
obligatoria varchar(2) not null,
descripcion varchar(90) not null,
laboratorio varchar(2) not null,
calificacion number(2));
insert into materias values('1','Administracios','10','si','Descripcion 1','no',9);
insert into materias values('2','Contabilidad','10','si','Descripcion 2','no',8);
insert into materias values('3','Matematicas 1','10','si','Descripcion 3','no',9);
insert into materias values('4','Algebra','10','si','Descripcion 4','no',7);insert into materias values('5','Programacion','10','si','Descripcion 5','no',9);
insert into materias values('6','RH','10','si','Descripcion 6','no',9);
insert into materias values('7','Calculo','10','si','Descripcion 7','no',8);
insert into materias values('8','Finanzas','10','si','Descripcion 8','no',8);
insert into materias values('9','Estados financieros','10','si','Descripcion 9','no',7);
insert into materias values('10','Locochon','10','si','Descripcion 10','no',6);
create table alumno_materia(no_cuenta varchar(9) references alumnos(no_cuenta),
id_materia varchar(4) references materias(id_materia),
primary key(no_cuenta,id_materia));
insert into alumno_materia values('123456700','1');
insert into alumno_materia values('123456704','2');
insert into alumno_materia values('123456705','3');
insert into alumno_materia values('123456706','4');
insert into alumno_materia values('123456707','5');
insert into alumno_materia values('123456708','6');
insert into alumno_materia values('123456709','7');
insert into alumno_materia values('123456710','8');
insert into alumno_materia values('123456711','9');
insert into alumno_materia values('123456712','10');
insert into alumno_materia values('123456713','1');
insert into alumno_materia values('123456714','2');
insert into alumno_materia values('123456715','3');
insert into alumno_materia values('123456700','4');
insert into alumno_materia values('123456704','5');
insert into alumno_materia values('123456705','6');
insert into alumno_materia values('123456706','7');
insert into alumno_materia values('123456707','8');
insert into alumno_materia values('123456708','9');
insert into alumno_materia values('123456709','10');
create table profesores(id_profesor varchar(3) primary key,
nombre varchar(30) not null,
telefono varchar(10) not null,
celular varchar(10) not null,
facha_naci date not null,
email varchar(50) not null,
direccion varchar(90) not null);
insert into profesores
values('100','Magnus','5548798869','5548798644','01/05/1990','email@.com','direccion 21');
insert into profesores
values('200','Richard','5548796898','5546983625','02/05/1990','email@.com','direccion 22');
insert into profesores
values('300','Faiano','5546987210','5546987632','03/05/1990','email@.com','direccion 23');insert into profesores
values('400','Alireza','5510324698','5546987632','04/05/1990','email@.com','direccion 24');
insert into profesores
values('500','Gary','5549873546','5546987896','05/05/1990','email@.com','direccion 25');
create table materia_profesor(id_materia varchar(4) references materias(id_materia),
id_profesor varchar(3) references profesores(id_profesor),
primary key(id_materia,id_profesor));
insert into materia_profesor values('1','100');
insert into materia_profesor values('2','200');
insert into materia_profesor values('3','300');
insert into materia_profesor values('4','400');
insert into materia_profesor values('5','500');
insert into materia_profesor values('6','500');
insert into materia_profesor values('7','400');
insert into materia_profesor values('8','300');
insert into materia_profesor values('9','200');
insert into materia_profesor values('10','200');
insert into materia_profesor values('1','300');
insert into materia_profesor values('2','500');
insert into materia_profesor values('5','300');
insert into materia_profesor values('6','100');
insert into materia_profesor values('7','200');
insert into materia_profesor values('8','100');
