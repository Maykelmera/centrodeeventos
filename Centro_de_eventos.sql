/*==============================================================*/
/* DBMS name:      PostgreSQL 8                                 */
/* Created on:     08/06/2022 11:50:26                          */
/* MERA PÁRRAGA JOAHAN MAYKEL					*/
/*==============================================================*/

/*==============================================================*/
/* Table: ARBITRO                                               */
/*==============================================================*/
create table ARBITRO (
   ID_ARBITRO           SERIAL               not null,
   NOMBRE_ARBITRO       CHAR(30)             null,
   APELLIDO_ARBITRO     CHAR(30)             null,
   NCEDULA_ARBITRO      CHAR(10)             null,
   DIRECCION_ARBITRO    CHAR(30)             null,
   NTELEFONO_ARBITRO    CHAR(10)             null,
   CORREO_ARBITRO       CHAR(30)             null,
   constraint PK_ARBITRO primary key (ID_ARBITRO)
);

/*==============================================================*/
/* Table: CAMPEONATO                                            */
/*==============================================================*/
create table CAMPEONATO (
   ID_CAMPEONATO        SERIAL               not null,
   ID_CENTRODEEVENTO    INT4                 not null,
   TIPO_CAMPEONATO      CHAR(25)             null,
   TIPO_EVENTODEPORTIVO CHAR(30)             null,
   FECHAINICIO_CAMPEONATO DATE                 null,
   FECHAFIN_CAMPEONATO  DATE                 null,
   constraint PK_CAMPEONATO primary key (ID_CAMPEONATO)
);

/*==============================================================*/
/* Table: CENTRO_DE_EVENTO                                      */
/*==============================================================*/
create table CENTRO_DE_EVENTO (
   ID_CENTRODEEVENTO    SERIAL               not null,
   NOMBRE_CENTRODEEVENTO CHAR(30)             null,
   DIRECCION_CENTRODEEVENTO CHAR(30)             null,
   TELEFONO_CENTRODEEVENTO CHAR(10)             null,
   CORREO_CENTRODEEVENTO CHAR(30)             null,
   PWEB_CENTRODEEVENTO  CHAR(50)             null,
   constraint PK_CENTRO_DE_EVENTO primary key (ID_CENTRODEEVENTO)
);

/*==============================================================*/
/* Table: CLIENTE_RESERVADOR                                    */
/*==============================================================*/
create table CLIENTE_RESERVADOR (
   ID_CLIENTE           SERIAL               not null,
   NOMBRE_CLIENTE       CHAR(30)             null,
   APELLIDO_CLIENTE     CHAR(30)             null,
   CEDULA_CLIENTE       CHAR(10)             null,
   FNACIMIENTO_CLIENTE  DATE                 null,
   DIRECCION_CLIENTE    CHAR(30)             null,
   NTELEFONO_CLIENTE    CHAR(10)             null,
   CORREO_CLIENTE       CHAR(30)             null,
   constraint PK_CLIENTE_RESERVADOR primary key (ID_CLIENTE)
);

/*==============================================================*/
/* Table: EMPLEADO                                              */
/*==============================================================*/
create table EMPLEADO (
   ID_EMPLEADO          SERIAL               not null,
   ID_CENTRODEEVENTO    INT4                 not null,
   NOMBRE_EMPLEADO      CHAR(30)             null,
   APELLIDO_EMPLEADO    CHAR(30)             null,
   NCEDULA_EMPLEADO     CHAR(10)             null,
   DIRECCION_EMPLEADO   CHAR(30)             null,
   FNACIMIENTO_EMPLEADO DATE                 null,
   FINGRESO_EMPLEADO    DATE                 null,
   ENFERMEDAD_EMPLEADO  CHAR(30)             null,
   TIPO_EMPLEADO        CHAR(25)             null,
   NTELEFONO_EMPLEADO   CHAR(10)             null,
   CORREO_EMPLEADO      CHAR(30)             null,
   constraint PK_EMPLEADO primary key (ID_EMPLEADO)
);

/*==============================================================*/
/* Table: ESPACIO                                               */
/*==============================================================*/
create table ESPACIO (
   ID_ESPACIO           SERIAL               not null,
   ID_CENTRODEEVENTO    INT4                 not null,
   DISPONIBILIDAD_ESPACIO CHAR(25)             null,
   CAPACIDAD_ESPACIO    NUMERIC(3)           null,
   HORARIOR_ESPACIO     CHAR(25)             null,
   constraint PK_ESPACIO primary key (ID_ESPACIO)
);

/*==============================================================*/
/* Table: REALIZA                                               */
/*==============================================================*/
create table REALIZA (
   ID_RESERVACION       INT4                 not null,
   ID_CLIENTE           INT4                 not null,
   ESTADO               VARCHAR(30)          null,
   constraint PK_REALIZA primary key (ID_RESERVACION, ID_CLIENTE)
);


/*==============================================================*/
/* Table: EFECTUA                                               */
/*==============================================================*/
create table EFECTUA (
   ID_CLIENTE           INT4                 not null,
   ID_EMPLEADO          INT4                 not null,
   ID_SERVICIO          INT4                 not null,
   constraint PK_EFECUTA primary key (ID_CLIENTE, ID_EMPLEADO, ID_SERVICIO)
);


/*==============================================================*/
/* Table: ATIENDE                                               */
/*==============================================================*/
create table ATIENDE (
   ID_EMPLEADO          INT4                 not null,
   ID_CLIENTE           INT4                 not null,
   constraint PK_ATIENDE primary key (ID_EMPLEADO, ID_CLIENTE)
);


/*==============================================================*/
/* Table: DIRIGE                                       */
/*==============================================================*/
create table DIRIGE (
   ID_ARBITRO           INT4                 not null,
   ID_CAMPEONATO        INT4                 not null,
   COSTO                NUMERIC(3)           null,
   OBSERVACION          VARCHAR(30)          null,
   constraint PK_DIRIGE primary key (ID_ARBITRO, ID_CAMPEONATO)
);

/*==============================================================*/
/* Table: RESERVACION                                           */
/*==============================================================*/
create table RESERVACION (
   ID_RESERVACION       SERIAL               not null,
   ID_CENTRODEEVENTO    INT4                 not null,
   NOMBRE_RESERVACION   CHAR(25)             null,
   TIEMPO_RESERVACION   TIME                 null,
   TIPO_EVENTO_RESERVACION CHAR(20)             null,
   COSTO_RESERVACION    NUMERIC(3)           null,
   FECHA_RESERVACION    DATE                 null,
   AREA_RESERVACION     CHAR(30)             null,
   constraint PK_RESERVACION primary key (ID_RESERVACION)
);

/*==============================================================*/
/* Table: SERVICIO                                              */
/*==============================================================*/
create table SERVICIO (
   ID_SERVICIO          SERIAL               not null,
   ACTIVIDAD_SERVICIO   CHAR(25)             null,
   constraint PK_SERVICIO primary key (ID_SERVICIO)
);



alter table CAMPEONATO
   add constraint FK_CAMPEONA_RELATIONS_CENTRO_D foreign key (ID_CENTRODEEVENTO)
      references CENTRO_DE_EVENTO (ID_CENTRODEEVENTO)
      on delete restrict on update restrict;

alter table EMPLEADO
   add constraint FK_EMPLEADO_RELATIONS_CENTRO_D foreign key (ID_CENTRODEEVENTO)
      references CENTRO_DE_EVENTO (ID_CENTRODEEVENTO)
      on delete restrict on update restrict;

alter table ESPACIO
   add constraint FK_ESPACIO_RELATIONS_CENTRO_D foreign key (ID_CENTRODEEVENTO)
      references CENTRO_DE_EVENTO (ID_CENTRODEEVENTO)
      on delete restrict on update restrict;

alter table REALIZA
   add constraint FK_RELATION_RELATIONS_CLIENTE_ foreign key (ID_CLIENTE)
      references CLIENTE_RESERVADOR (ID_CLIENTE)
      on delete restrict on update restrict;

alter table REALIZA
   add constraint FK_RELATION_RELATIONS_RESERVAC foreign key (ID_RESERVACION)
      references RESERVACION (ID_RESERVACION)
      on delete restrict on update restrict;

alter table EFECTUA
   add constraint FK_RELATION_RELATIONS_SERVICIO foreign key (ID_SERVICIO)
      references SERVICIO (ID_SERVICIO)
      on delete restrict on update restrict;

alter table EFECTUA
   add constraint FK_RELATION_RELATIONS_CLIENTE_ foreign key (ID_CLIENTE)
      references CLIENTE_RESERVADOR (ID_CLIENTE)
      on delete restrict on update restrict;

alter table EFECTUA
   add constraint FK_RELATION_RELATIONS_EMPLEADO foreign key (ID_EMPLEADO)
      references EMPLEADO (ID_EMPLEADO)
      on delete restrict on update restrict;

alter table ATIENDE
   add constraint FK_RELATION_RELATIONS_CLIENTE_ foreign key (ID_CLIENTE)
      references CLIENTE_RESERVADOR (ID_CLIENTE)
      on delete restrict on update restrict;

alter table ATIENDE
   add constraint FK_RELATION_RELATIONS_EMPLEADO foreign key (ID_EMPLEADO)
      references EMPLEADO (ID_EMPLEADO)
      on delete restrict on update restrict;

alter table DIRIGE
   add constraint FK_RELATION_RELATIONS_CAMPEONA foreign key (ID_CAMPEONATO)
      references CAMPEONATO (ID_CAMPEONATO)
      on delete restrict on update restrict;

alter table DIRIGE
   add constraint FK_RELATION_RELATIONS_ARBITRO foreign key (ID_ARBITRO)
      references ARBITRO (ID_ARBITRO)
      on delete restrict on update restrict;

alter table RESERVACION
   add constraint FK_RESERVAC_RELATIONS_CENTRO_D foreign key (ID_CENTRODEEVENTO)
      references CENTRO_DE_EVENTO (ID_CENTRODEEVENTO)
      on delete restrict on update restrict;


/*=============================================================*/
/*			  INSERTAR DATOS		       */
/*=============================================================*/
----------------------Añadir dato CLIENTE-RESERVADOR------------------------
INSERT INTO cliente_reservador (id_cliente, nombre_cliente, apellido_cliente, cedula_cliente, 
							   fnacimiento_cliente, direccion_cliente, ntelefono_cliente) 
							   VALUES 
							   (20026, 'Joahan', 'Mera', '1316895281', '2002/06/25', 'Calle 17b av 28', '0969720246'),
							   (20064, 'Astri', 'Alcivar', '1351635113', '2006/04/18', 'Calle 18 av 28', '0981080645'), 
							   (20025, 'Ana', 'Lucas', '1315247302', '2002/05/27', 'Calle 16b av 28', '0988343483'),
							   (20022, 'Karen', 'Anchundia', '1316664604', '2000/11/06', 'Manta, vía a Colisa', '0994624487'),
							   (20127, 'Diana', 'Becerra', '0986712835', '2003/04/01', 'Calle 13 av 23', '0963441049');



----------------------Añadir datos a ARBITRO------------------------
INSERT INTO arbitro (id_arbitro, nombre_arbitro, apellido_arbitro, ncedula_arbitro, direccion_arbitro, ntelefono_arbitro) 
							   VALUES 
							   (12345, 'Geam', 'Mera', '1315857945', 'Calle 108 av 109', '0985479341'),
							   (15879, 'Jean', 'Crespo', '0974268317', 'Calle 16 av 37', '0988510345'), 
							   (45687, 'Fernando', 'Saldarriaga', '1316244481', 'Calle 15 av 21', '0973049921'),
							   (73021, 'Diogo', 'Saltos', '0923149670', 'Calle 23 av 7', '0999546272'),
							   (16001, 'Josean', 'Sánchez', '1315689562', 'Universitaria calle U3', '0959806275');



----------------------Añadir datos a CENTRO DE EVENTO------------------------
INSERT INTO centro_de_evento (id_centrodeevento, nombre_centrodeevento, direccion_centrodeevento, telefono_centrodeevento, correo_centrodeevento, pweb_centrodeevento) 
							   VALUES 
							   (25897, 'DETOX', 'Via Circunvalación', '0986574238', 'detox@gmail.com', 'detoxecu.com.ec');



----------------------Añadir datos a CAMPEONATO------------------------
INSERT INTO campeonato (id_campeonato, id_centrodeevento, tipo_campeonato, tipo_eventodeportivo, fechainicio_campeonato, fechafin_campeonato) 
							   VALUES 
							   (86152, '25897', 'Amistoso', 'Basquet', '2022/06/21', '2022/06/23'),
							   (93001, '25897', 'Campeonato', 'Volley', '2022/05/25', '2022/05/29'), 
							   (82356, '25897', 'Amistoso',  'Fútbol', '2022/05/06', '2022/05/10'),
							   (14575, '25897', 'Campeonato', 'Basquet', '2022/06/11', '2022/06/16'),
							   (38982, '25897', 'Cuadrangular', 'Fútbol', '2022/07/15', '2022/07/15');


---------------------Añadir datos a ESPACIO------------------------
INSERT INTO espacio (id_espacio, id_centrodeevento, disponibilidad_espacio, capacidad_espacio, horarior_espacio) 
							   VALUES 
							   (10256, 25897, 'libre' , 250, '06/06/2022 a las 1pm'),
							   (12486, 25897, 'Ocupado' , 100, '25/06/2022 a las 5pm'),
							   (12368, 25897, 'libre' , 220, '08/07/2022 a las 10am'),
							   (20452, 25897, 'Ocupado' , 350, '28/06/2022 a las 9pm'),
							   (58932, 25897, 'Ocupado' , 180, '12/06/2022 a las 11am');



---------------------Añadir datos a EMPLEADO------------------------
INSERT INTO empleado (id_empleado, id_centrodeevento, nombre_empleado, apellido_empleado, ncedula_empleado, direccion_empleado,
					 fnacimiento_empleado, fingreso_empleado, enfermedad_empleado, tipo_empleado, ntelefono_empleado) 
							   VALUES 
							   (25869, 25897, 'Alex', 'Murillo', '1315897458', 'Calle 20 av 24', '1997/06/11', '2018/04/15',
							    'Diabétes', 'Mantenimiento', '0986452478'),
							   (25217, 25897, 'Celena', 'Rodriguez', '0987548210', 'Barrio La Proaño', '2000/10/28', '2019/01/05',
							    'Hipertensión', 'Atención al cliente', '0963520041'),
							   (25897, 25897, 'Ted', 'Diaz', '1752896214', 'Calle 8 av 26', '1989/12/15', '2022/01/29',
							    'Hipertensión', 'Atención al cliente', '0978736850'),
							   (20585, 25897, 'Josselyne', 'Basurto', '1312711269', 'Calle 303 av 207', '1997/10/13', '2018/05/05',
							   'Diabétes', 'Mantenimiento', '0998313846'),
							   (22785, 25897, 'Adriana', 'Baque', '0186528474', 'Calle 12 av 33', '2002/04/19', '2020/01/09',
							    'Hipertensión', 'Atención al cliente', '0968356991');


---------------------Añadir datos a SERVICIO------------------------
INSERT INTO servicio (id_servicio, actividad_servicio) 
							   VALUES 
							   (58620, 'Alimentación'),
							   (25006, 'Animación'),
							   (85015, 'Alimentación'),
							   (48643, 'Bebidas'),
							   (24525, 'Bebidas');


---------------------Añadir datos a EFECTUA------------------------
INSERT INTO efectua (id_cliente, id_empleado, id_servicio) 
							   VALUES 
							   (20022, 20585, 24525),
							   (20025, 22785, 25006),
							   (20026, 25217, 48643),
							   (20064, 25869, 58620),
							   (20127, 25897, 85015);


---------------------Añadir datos a ATIENDE------------------------
INSERT INTO atiende (id_empleado, id_cliente) 
							   VALUES 
							   (20585, 20022),
							   (22785, 20025),
							   (25217, 20026),
							   (25869, 20064),
							   (25897, 20127);



---------------------Añadir datos a RESERVACION------------------------
INSERT INTO reservacion (id_reservacion, id_centrodeevento, nombre_reservacion, tiempo_reservacion, tipo_evento_reservacion,
						 costo_reservacion, fecha_reservacion, area_reservacion) 
							   VALUES 
							   (53666, 25897, 'Campeonato FullBasquet', '12:00', 'Privado', 250, '2022/06/05', 'Cancha de basquet'),
							   (25624, 25897, 'Cuadrangular Zanahoria', '06:00', 'Público', 150, '2022/07/10', 'Cancha de fútbol'),
							   (46562, 25897, 'Amistoso ULEAM', '10:00', 'Privado', 200, '2022/05/02','Cancha de fútbol'),
							   (20225, 25897, 'Amistoso UTM', '07:00', 'Privado', 175, '2022/06/15', 'Cancha de basquet'),
							   (22557, 25897, 'Campeonato JP', '05:00', 'Público', 100, '2022/05/21', 'Cancha de volley');


---------------------Añadir datos a REALIZA------------------------
INSERT INTO realiza (id_reservacion, id_cliente, estado) 
							   VALUES 
							   (20225, 20022, 'Confirmado'),
							   (22557, 20025, 'Por confirmar'),
							   (25624, 20026, 'Confirmado'),
							   (46562, 20064, 'Confirmado'),
							   (53666, 20127, 'Por confirmar');



---------------------Añadir datos a DIRIGE------------------------
INSERT INTO dirige (id_arbitro, id_campeonato, costo, observacion) 
							   VALUES 
							   (12345, 14575, 50, 'Dos tarjetas amarillas'),
							   (15879, 38982, 35, 'Sin novedad alguna'),
							   (16001, 82356, 75, 'Dos tarjetas rojas'),
							   (45687, 86152, 40, 'Una tarjeta roja'),
							   (73021, 93001, 50, 'Sin novedad alguna');


/*=============================================================*/
/*			    CONSULTAS	  		       */
/*=============================================================*/
-----------------------------Primera consulta-----------------------------------
/*
Mostrar los espacio que tienen una capacidad entre 150 y 200:
	En una columna mostrar el id del espacio
	En otra mostrar la capacidad del espacio
	En otra la disponibilidad del espacio
	En otra el horario de reserva del espacio
*/

SELECT 
	ESPACIO.ID_ESPACIO AS IDENTIFICACION, 
	ESPACIO.CAPACIDAD_ESPACIO AS CAPACIDAD,
	ESPACIO.DISPONIBILIDAD_ESPACIO AS DISPONIBILIDAD,
	ESPACIO.HORARIOR_ESPACIO AS HORARIO
FROM ESPACIO
	WHERE CAPACIDAD_ESPACIO BETWEEN 150 AND 250; 



----------------------------Segunda consulta-------------------------------------
/*
➢ Mostrar a los empleado nacidos antes del 2000, adicionalmente evidenciar los siguientes datos:
	o En una columna debe aparecer el ID del empleado
	o En otra el nombre de empleado.
	o En otra el apellido de empleado.
	o En otra la fecha de nacimiento del empleado.
	o En otra el área en el cual se desempeña.
	o En otra la enfermedad que posee.	
*/

SELECT 
	EMPLEADO.ID_EMPLEADO AS IDENTIFICACION, 
	EMPLEADO.NOMBRE_EMPLEADO AS NOMBRE,
	EMPLEADO.APELLIDO_EMPLEADO AS APELLIDO,
	EMPLEADO.FNACIMIENTO_EMPLEADO AS FECHA_NACIMIENTO,
	EMPLEADO.TIPO_EMPLEADO AS ÁREA,
	EMPLEADO.ENFERMEDAD_EMPLEADO AS ENFERMEDAD
FROM EMPLEADO
	WHERE FNACIMIENTO_EMPLEADO <'01/01/2000'; 


-----------------------------Tercer consulta-----------------------------------
/*
Mostrar la tabla de EFECTÚA (Relationship_6) los id_servicios mayores a 4000, además:
	En una columna mostrar el id del cliente
	En otra el nombre del cliente
	En otra el id del empleado
	En otra el nombre del empleado
	En otra el id del servicio
	En otra el nombre o actividad del servicio
*/

SELECT
	CLIENTE_RESERVADOR.ID_CLIENTE AS IDENTIFICACION_CLIENTE,
	CLIENTE_RESERVADOR.NOMBRE_CLIENTE AS NOMBRE_CLIENTE,
	EMPLEADO.ID_EMPLEADO AS IDENTIFICACION_EMPLEADO,
	EMPLEADO.NOMBRE_EMPLEADO AS NOMBRE_EMPLEADO,
	SERVICIO.ID_SERVICIO AS IDENTIFICACION_SERVICIO,
	SERVICIO.ACTIVIDAD_SERVICIO AS NOMBRE_SERVICIO
FROM EFECTUA
	INNER JOIN CLIENTE_RESERVADOR ON CLIENTE_RESERVADOR.ID_CLIENTE = EFECTUA.ID_CLIENTE
	INNER JOIN EMPLEADO ON EMPLEADO.ID_EMPLEADO = EFECTUA.ID_EMPLEADO
	INNER JOIN SERVICIO ON SERVICIO.ID_SERVICIO = EFECTUA.ID_SERVICIO
	WHERE EFECTUA.ID_SERVICIO > 40000;


-----------------------------Cuarta consulta-----------------------------------
/*
Mostrar la tabla de DIRIGE (Relationship_9) las observaciones que inician con "D", además:
	En una columna mostrar el id del arbitro
	En otra el nombre del arbitro
	En otra el id del campeonato
	En otra el tipo de campeonato
	En otra el costo del arbitro
	En otra la observcacion que hizo arbitro
*/

SELECT
	ARBITRO.ID_ARBITRO AS IDENTIFICACION_ARBITRO,
	ARBITRO.NOMBRE_ARBITRO AS NOMBRE_ARBITRO,
	CAMPEONATO.ID_CAMPEONATO AS IDENTIFICACION_CAMPEONATO,
	CAMPEONATO.TIPO_CAMPEONATO AS TIPO_CAMPEONATO,
	DIRIGE.COSTO AS COSTO,
	DIRIGE.OBSERVACION AS OBSERVACION
FROM DIRIGE
	INNER JOIN ARBITRO ON ARBITRO.ID_ARBITRO = DIRIGE.ID_ARBITRO
	INNER JOIN CAMPEONATO ON CAMPEONATO.ID_CAMPEONATO = DIRIGE.ID_CAMPEONATO
	WHERE DIRIGE.OBSERVACION LIKE 'D%';