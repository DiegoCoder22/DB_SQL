-- 1) CLIENTES
-- Crear Tabla Clientes
CREATE TABLE Clientes( 
    rut_cliente         NUMBER(11) NOT NULL, 
    dv                  CHAR(1) NOT NULL, 
    primer_nombre       VARCHAR2(250) NOT NULL,
    segundo_nombre      VARCHAR2(250), 
    apellido_paterno    VARCHAR2(250) NOT NULL, 
    apellido_materno    VARCHAR2(250), 
    direccion           VARCHAR2(250) NOT NULL, 
    fono                NUMBER NOT NULL,  
    correo              VARCHAR2(250) NOT NULL, 
    comuna_id           NUMBER NOT NULL
);

-- 2) COMUNAS
--Creo Tabla Comunas
CREATE TABLE Comunas( 
    id_comuna         NUMBER NOT NULL, 
    nombre            VARCHAR2(250) NOT NULL, 
    provincia_id      NUMBER NOT NULL
);

-- 3) PROVINCIA
-- Crear Tabla Provincias
CREATE TABLE Provincias( 
    id_provincia        NUMBER NOT NULL, 
    nombre              VARCHAR2(250) NOT NULL,
    region_id           NUMBER NOT NULL
);

-- 4) REGION
-- Crear Tabla Regiones
CREATE TABLE Regiones( 
    id_region         NUMBER NOT NULL, 
    nombre            VARCHAR2(250) NOT NULL
);

-- 5) SECTOR
-- Crear Tabla Sector
CREATE TABLE Sector( 
    id_sector         NUMBER NOT NULL, 
    nombre            VARCHAR2(250) NOT NULL,
    parque_id         NUMBER NOT NULL
);

-- 6) PARQUE
-- Crear Tabla Parques
CREATE TABLE Parques( 
    id_parque         NUMBER NOT NULL, 
    nombre            VARCHAR2(250) NOT NULL
);

-- 7) ACOMPAÑANTE
-- Crear Tabla Acompañante
CREATE TABLE Acompanantes( 
    rut_acompanante     NUMBER(11) NOT NULL, 
    dv                  CHAR(1) NOT NULL, 
    primer_nombre       VARCHAR2(250) NOT NULL, 
    segundo_nombre      VARCHAR2(250), 
    apellido_paterno    VARCHAR2(250) NOT NULL, 
    apellido_materno    VARCHAR2(250), 
    direccion           VARCHAR2(250) NOT NULL, 
    fono                NUMBER NOT NULL,  
    correo              VARCHAR2(250) NOT NULL, 
    comuna_id           NUMBER NOT NULL
);

-- 8) RESERVAS
-- Crear Tabla Reservas
CREATE TABLE Reservas( 
    numero_reserva      NUMBER NOT NULL,
    fecha_reserva       DATE NOT NULL,
    rut_cliente         NUMBER(11) NOT NULL,
    check_in            DATE NOT NULL,
    check_out           DATE NOT NULL,
    total_a_pagar       NUMBER NOT NULL,
    total_final         NUMBER NOT NULL,
    descuento_id        NUMBER NOT NULL,
    habitacion_id       NUMBER NOT NULL,
    parque_id           NUMBER NOT NULL
);

-- 9) RESERVA ACOMPAÑANTE
-- Crear Tabla Reservas_acompanantes
CREATE TABLE Reservas_acompanantes( 
    numero_reserva      NUMBER NOT NULL,
    rut_acompanante     NUMBER(11) NOT NULL
);

-- 10) DESCUENTOS
-- Crear Tabla Descuentos
CREATE TABLE Descuentos( 
    id_descuento            NUMBER NOT NULL,
    codigo_descuento        VARCHAR2(250) NOT NULL,
    es_festivo              CHAR(1) NOT NULL,
    descripcion             VARCHAR2(1000),
    porcentaje_descuento    NUMBER(2)
);

-- 11) SERVICIOS
-- Crear Tabla Servicios
CREATE TABLE Servicios(
    id_servicio         NUMBER NOT NULL,
    codigo_servicio     VARCHAR2(250) NOT NULL,
    nombre              VARCHAR2(250) NOT NULL,
    descripcion         VARCHAR2(1000) NOT NULL,
    valor_persona       NUMBER NOT NULL
);

-- 12) DETALLE SERVICIO
-- Crear Tabla Detalle_Servicio
CREATE TABLE Detalle_Servicio( 
    id_detalle           NUMBER NOT NULL,
    fecha_consumo        DATE NOT NULL,
    total_a_pagar        NUMBER,
    servicio_id          NUMBER,
    reserva_id           NUMBER,
    rut_cliente          NUMBER(11) NOT NULL
);

-- 13) HABITACION
-- Crear Tabla Habitaciones
CREATE TABLE Habitaciones( 
    id_habitacion        NUMBER NOT NULL,
    numero               NUMBER NOT NULL,
    valor_noche          NUMBER NOT NULL,
    capacidad_max        NUMBER(2) NOT NULL
);

-- 14) DOMOS
-- Crear Tabla Domos
CREATE TABLE Domos( 
    id_habitacion           NUMBER NOT NULL,
    tiene_minibar           CHAR(1) NOT NULL,
    tiene_baño_privado      CHAR(1) NOT NULL,
    tiene_calefaccion       CHAR(1) NOT NULL,
    cantidad_camas          NUMBER(2) NOT NULL
);

-- 15) CABAÑAS
-- Crear Tabla Cabanas
CREATE TABLE Cabanas( 
    id_habitacion           NUMBER NOT NULL,
    tiene_minibar           CHAR(1) NOT NULL,
    tiene_baño_privado      CHAR(1) NOT NULL,
    tiene_calefaccion       CHAR(1) NOT NULL,
    cantidad_camas          NUMBER(2) NOT NULL
);

--Añadir la PK a la Tabla Clientes
ALTER TABLE Clientes ADD CONSTRAINT cliente_PK PRIMARY KEY (rut_cliente);

-- Añadir la PK a la tabla Comunas
ALTER TABLE Comunas ADD CONSTRAINT comuna_PK PRIMARY KEY (id_comuna);

-- Añadir la PK a la tabla Provincia
ALTER TABLE Provincias ADD CONSTRAINT provincia_PK PRIMARY KEY (id_provincia);

-- Añadir la PK a la tabla Region
ALTER TABLE Regiones ADD CONSTRAINT region_PK PRIMARY KEY (id_region);

-- Añadir la PK a la tabla Sector
ALTER TABLE Sector ADD CONSTRAINT sector_PK PRIMARY KEY (id_sector);

-- Añadir la PK a la tabla Parque
ALTER TABLE Parques ADD CONSTRAINT parque_PK PRIMARY KEY (id_parque);

-- Añadir la PK a la tabla Acompañante
ALTER TABLE Acompanantes ADD CONSTRAINT acompanante_PK PRIMARY KEY (rut_acompanante);

-- Añadir la PK a la tabla Acompañante
ALTER TABLE Reservas ADD CONSTRAINT reservas_PK PRIMARY KEY (numero_reserva);

-- Añadir la PK a la tabla Reservas_acompanantes
ALTER TABLE Reservas_acompanantes ADD CONSTRAINT reservas_acompanantes_PK PRIMARY KEY (numero_reserva, rut_acompanante);

-- Añadir la PK a la tabla Descuentos
ALTER TABLE Descuentos ADD CONSTRAINT descuentos_PK PRIMARY KEY (id_descuento);

-- Añadir la PK a la tabla Servicios
ALTER TABLE Servicios ADD CONSTRAINT servicios_PK PRIMARY KEY (id_servicio);

-- Añadir la PK a la tabla Detalle_Servicio
ALTER TABLE Detalle_Servicio ADD CONSTRAINT detalle_servicio_PK PRIMARY KEY (id_detalle);

-- Añadir la PK a la tabla Habitaciones
ALTER TABLE Habitaciones ADD CONSTRAINT Habitaciones_PK PRIMARY KEY (id_habitacion);

-- Añadir la PK a la tabla Servicios
ALTER TABLE Domos ADD CONSTRAINT domos_PK PRIMARY KEY (id_habitacion);

-- Añadir la PK a la tabla Servicios
ALTER TABLE Cabanas ADD CONSTRAINT cabanas_PK PRIMARY KEY (id_habitacion);


-- TODAS LAS CLAVES FORANEAS o FK
-- Añadir la Clave Foranea o FK a la tabla Clientes
ALTER TABLE Clientes ADD CONSTRAINT cliente_comuna_FK FOREIGN KEY (comuna_id) 
    REFERENCES Comunas (id_comuna);

-- Añadir la Clave Foranea o FK a la tabla Comunas
ALTER TABLE Comunas ADD CONSTRAINT comuna_provincia_FK FOREIGN KEY (provincia_id) 
    REFERENCES Provincias (id_provincia);

-- Añadir la Clave Foranea o FK a la tabla Provincias
ALTER TABLE Provincias ADD CONSTRAINT provincia_region_FK FOREIGN KEY (region_id) 
    REFERENCES Regiones (id_region);

-- Añadir la Clave Foranea o FK a la tabla Sector
ALTER TABLE Sector ADD CONSTRAINT sector_parque_FK FOREIGN KEY (parque_id) 
    REFERENCES Parques (id_parque);

-- Añadir la Clave Foranea o FK a la tabla Reservas_acompanantes
ALTER TABLE Reservas_acompanantes ADD CONSTRAINT reserva_acompanante_reserva_FK FOREIGN KEY (numero_reserva) 
    REFERENCES Reservas (numero_reserva);

-- Añadir la Clave Foranea o FK a la tabla Reservas_acompanantes
ALTER TABLE Reservas_acompanantes ADD CONSTRAINT reserva_acompanante_FK FOREIGN KEY (rut_acompanante) 
    REFERENCES Acompanantes (rut_acompanante);

-- Añadir la Clave Foranea o FK a la tabla Reservas
ALTER TABLE Reservas ADD CONSTRAINT reserva_cliente_FK FOREIGN KEY (rut_cliente) 
    REFERENCES Clientes (rut_cliente);

-- Añadir la Clave Foranea o FK a la tabla Reservas
ALTER TABLE Reservas ADD CONSTRAINT reserva_descuento_FK FOREIGN KEY (descuento_id) 
    REFERENCES Descuentos (id_descuento);

-- Añadir la Clave Foranea o FK a la tabla Reservas
ALTER TABLE Reservas ADD CONSTRAINT reserva_habitacion_FK FOREIGN KEY (habitacion_id) 
    REFERENCES Habitaciones (id_habitacion);

-- Añadir la Clave Foranea o FK a la tabla Reservas
ALTER TABLE Reservas ADD CONSTRAINT acompanante_parque_FK FOREIGN KEY (parque_id) 
    REFERENCES Parques (id_parque);

-- Añadir la Clave Foranea o FK a la tabla Detalle Servicio
ALTER TABLE Detalle_Servicio ADD CONSTRAINT detalle_servicio_servicio_FK FOREIGN KEY (servicio_id) 
    REFERENCES Servicios (id_servicio);

-- Añadir la Clave Foranea o FK a la tabla Detalle Servicio
ALTER TABLE Detalle_Servicio ADD CONSTRAINT detalle_servicio_reserva_FK FOREIGN KEY (reserva_id) 
    REFERENCES Reservas (numero_reserva);

-- Añadir la Clave Foranea o FK a la tabla Detalle Servicio
ALTER TABLE Detalle_Servicio ADD CONSTRAINT detalle_servicio_cliente_FK FOREIGN KEY (rut_cliente) 
    REFERENCES Clientes (rut_cliente);

-- Añadir la Clave Foranea o FK a la tabla Domo
ALTER TABLE Domos ADD CONSTRAINT reserva_parque_FK FOREIGN KEY (id_habitacion) 
    REFERENCES Habitaciones (id_habitacion);

-- Añadir la Clave Foranea o FK a la tabla Cabaña
ALTER TABLE Cabanas ADD CONSTRAINT acompanante_reserva_FK FOREIGN KEY (id_habitacion) 
    REFERENCES Habitaciones (id_habitacion);


-- AGREGO DATOS:
-- Agrego datos a Clientes:
INSERT INTO Clientes VALUES (16234567,'5','Steve','','Henderson','Delgado','Su casa #123',5555464,'juanito@gmail.com',2 );
INSERT INTO Clientes VALUES (15987341,'6','Jhon','','Anderson','Glosh','Su casa #123',5555464,'juanito@gmail.com',2 );
INSERT INTO Clientes VALUES (14623874,'7','Samantha','','Mazar','Delgado','Su casa #123',5555464,'juanito@gmail.com',2 );
INSERT INTO Clientes VALUES (14633852,'3','Sara','','Hanemann','Román','Su casa #123',5555464,'juanito@gmail.com',2 );

-- Agrego datos a Acompañantes:
INSERT INTO Acompanantes VALUES (15678906,'9','Julieta','','Doltan','Romo','Su casa #123',5555464,'juanito@gmail.com',2 );
INSERT INTO Acompanantes VALUES (15879478,'8','Alberto','','Ramirez','Smith','Su casa #123',5555464,'juanito@gmail.com',2 );
INSERT INTO Acompanantes VALUES (15678989,'8','Romina','','Rhoms','Zurich','Su casa #123',5555464,'juanito@gmail.com',2 );

-- Agrego datos a Comunas:
INSERT INTO Comunas VAlUES (1,'Arica',1),
INSERT INTO Comunas VAlUES (2,'Camarones',1),
INSERT INTO Comunas VAlUES (3,'General Lagos',2),
INSERT INTO Comunas VAlUES (4,'Putre',2),
INSERT INTO Comunas VAlUES (5,'Alto Hospicio',3),
INSERT INTO Comunas VAlUES (6,'Iquique',3),
INSERT INTO Comunas VAlUES (7,'Camiña',4),
INSERT INTO Comunas VAlUES (8,'Colchane',4),
INSERT INTO Comunas VAlUES (9,'Huara',4),
INSERT INTO Comunas VAlUES (10,'Pica',4),
INSERT INTO Comunas VAlUES (11,'Pozo Almonte',4),
INSERT INTO Comunas VAlUES (12,'Antofagasta',5),
INSERT INTO Comunas VAlUES (13,'Mejillones',5),
INSERT INTO Comunas VAlUES (14,'Sierra Gorda',5),
INSERT INTO Comunas VAlUES (15,'Taltal',5),
INSERT INTO Comunas VAlUES (16,'Calama',6),
INSERT INTO Comunas VAlUES (17,'Ollague',6),
INSERT INTO Comunas VAlUES (18,'San Pedro de Atacama',6),
INSERT INTO Comunas VAlUES (19,'María Elena',7),
INSERT INTO Comunas VAlUES (20,'Tocopilla',7),
INSERT INTO Comunas VAlUES (21,'Chañaral',8),
INSERT INTO Comunas VAlUES (22,'Diego de Almagro',8),
INSERT INTO Comunas VAlUES (23,'Caldera',9),
INSERT INTO Comunas VAlUES (24,'Copiapó',9),
INSERT INTO Comunas VAlUES (25,'Tierra Amarilla',9),
INSERT INTO Comunas VAlUES (26,'Alto del Carmen',10),
INSERT INTO Comunas VAlUES (27,'Freirina',10),
INSERT INTO Comunas VAlUES (28,'Huasco',10),
INSERT INTO Comunas VAlUES (29,'Vallenar',10),
INSERT INTO Comunas VAlUES (30,'Canela',11),
INSERT INTO Comunas VAlUES (31,'Illapel',11),
INSERT INTO Comunas VAlUES (32,'Los Vilos',11),
INSERT INTO Comunas VAlUES (33,'Salamanca',11),
INSERT INTO Comunas VAlUES (34,'Andacollo',12),
INSERT INTO Comunas VAlUES (35,'Coquimbo',12),
INSERT INTO Comunas VAlUES (36,'La Higuera',12),
INSERT INTO Comunas VAlUES (37,'La Serena',12),
INSERT INTO Comunas VAlUES (38,'Paihuaco',12),
INSERT INTO Comunas VAlUES (39,'Vicuña',12),
INSERT INTO Comunas VAlUES (40,'Combarbalá',13),
INSERT INTO Comunas VAlUES (41,'Monte Patria',13),
INSERT INTO Comunas VAlUES (42,'Ovalle',13),
INSERT INTO Comunas VAlUES (43,'Punitaqui',13),
INSERT INTO Comunas VAlUES (44,'Río Hurtado',13),
INSERT INTO Comunas VAlUES (45,'Isla de Pascua',14),
INSERT INTO Comunas VAlUES (46,'Calle Larga',15),
INSERT INTO Comunas VAlUES (47,'Los Andes',15),
INSERT INTO Comunas VAlUES (48,'Rinconada',15),
INSERT INTO Comunas VAlUES (49,'San Esteban',15),
INSERT INTO Comunas VAlUES (50,'La Ligua',16),
INSERT INTO Comunas VAlUES (51,'Papudo',16),
INSERT INTO Comunas VAlUES (52,'Petorca',16),
INSERT INTO Comunas VAlUES (53,'Zapallar',16),
INSERT INTO Comunas VAlUES (54,'Hijuelas',17),
INSERT INTO Comunas VAlUES (55,'La Calera',17),
INSERT INTO Comunas VAlUES (56,'La Cruz',17),
INSERT INTO Comunas VAlUES (57,'Limache',17),
INSERT INTO Comunas VAlUES (58,'Nogales',17),
INSERT INTO Comunas VAlUES (59,'Olmué',17),
INSERT INTO Comunas VAlUES (60,'Quillota',17),
INSERT INTO Comunas VAlUES (61,'Algarrobo',18),
INSERT INTO Comunas VAlUES (62,'Cartagena',18),
INSERT INTO Comunas VAlUES (63,'El Quisco',18),
INSERT INTO Comunas VAlUES (64,'El Tabo',18),
INSERT INTO Comunas VAlUES (65,'San Antonio',18),
INSERT INTO Comunas VAlUES (66,'Santo Domingo',18),
INSERT INTO Comunas VAlUES (67,'Catemu',19),
INSERT INTO Comunas VAlUES (68,'Llaillay',19),
INSERT INTO Comunas VAlUES (69,'Panquehue',19),
INSERT INTO Comunas VAlUES (70,'Putaendo',19),
INSERT INTO Comunas VAlUES (71,'San Felipe',19),
INSERT INTO Comunas VAlUES (72,'Santa María',19),
INSERT INTO Comunas VAlUES (73,'Casablanca',20),
INSERT INTO Comunas VAlUES (74,'Concón',20),
INSERT INTO Comunas VAlUES (75,'Juan Fernández',20),
INSERT INTO Comunas VAlUES (76,'Puchuncaví',20),
INSERT INTO Comunas VAlUES (77,'Quilpué',20),
INSERT INTO Comunas VAlUES (78,'Quintero',20),
INSERT INTO Comunas VAlUES (79,'Valparaíso',20),
INSERT INTO Comunas VAlUES (80,'Villa Alemana',20),
INSERT INTO Comunas VAlUES (81,'Viña del Mar',20),
INSERT INTO Comunas VAlUES (82,'Colina',21),
INSERT INTO Comunas VAlUES (83,'Lampa',21),
INSERT INTO Comunas VAlUES (84,'Tiltil',21),
INSERT INTO Comunas VAlUES (85,'Pirque',22),
INSERT INTO Comunas VAlUES (86,'Puente Alto',22),
INSERT INTO Comunas VAlUES (87,'San José de Maipo',22),
INSERT INTO Comunas VAlUES (88,'Buin',23),
INSERT INTO Comunas VAlUES (89,'Calera de Tango',23),
INSERT INTO Comunas VAlUES (90,'Paine',23),
INSERT INTO Comunas VAlUES (91,'San Bernardo',23),
INSERT INTO Comunas VAlUES (92,'Alhué',24),
INSERT INTO Comunas VAlUES (93,'Curacaví',24),
INSERT INTO Comunas VAlUES (94,'María Pinto',24),
INSERT INTO Comunas VAlUES (95,'Melipilla',24),
INSERT INTO Comunas VAlUES (96,'San Pedro',24),
INSERT INTO Comunas VAlUES (97,'Cerrillos',25),
INSERT INTO Comunas VAlUES (98,'Cerro Navia',25),
INSERT INTO Comunas VAlUES (99,'Conchalí',25),
INSERT INTO Comunas VAlUES (100,'El Bosque',25),
INSERT INTO Comunas VAlUES (101,'Estación Central',25),
INSERT INTO Comunas VAlUES (102,'Huechuraba',25),
INSERT INTO Comunas VAlUES (103,'Independencia',25),
INSERT INTO Comunas VAlUES (104,'La Cisterna',25),
INSERT INTO Comunas VAlUES (105,'La Granja',25),
INSERT INTO Comunas VAlUES (106,'La Florida',25),
INSERT INTO Comunas VAlUES (107,'La Pintana',25),
INSERT INTO Comunas VAlUES (108,'La Reina',25),
INSERT INTO Comunas VAlUES (109,'Las Condes',25),
INSERT INTO Comunas VAlUES (110,'Lo Barnechea',25),
INSERT INTO Comunas VAlUES (111,'Lo Espejo',25),
INSERT INTO Comunas VAlUES (112,'Lo Prado',25),
INSERT INTO Comunas VAlUES (113,'Macul',25),
INSERT INTO Comunas VAlUES (114,'Maipú',25),
INSERT INTO Comunas VAlUES (115,'Ñuñoa',25),
INSERT INTO Comunas VAlUES (116,'Pedro Aguirre Cerda',25),
INSERT INTO Comunas VAlUES (117,'Peñalolén',25),
INSERT INTO Comunas VAlUES (118,'Providencia',25),
INSERT INTO Comunas VAlUES (119,'Pudahuel',25),
INSERT INTO Comunas VAlUES (120,'Quilicura',25),
INSERT INTO Comunas VAlUES (121,'Quinta Normal',25),
INSERT INTO Comunas VAlUES (122,'Recoleta',25),
INSERT INTO Comunas VAlUES (123,'Renca',25),
INSERT INTO Comunas VAlUES (124,'San Miguel',25),
INSERT INTO Comunas VAlUES (125,'San Joaquín',25),
INSERT INTO Comunas VAlUES (126,'San Ramón',25),
INSERT INTO Comunas VAlUES (127,'Santiago',25),
INSERT INTO Comunas VAlUES (128,'Vitacura',25),
INSERT INTO Comunas VAlUES (129,'El Monte',26),
INSERT INTO Comunas VAlUES (130,'Isla de Maipo',26),
INSERT INTO Comunas VAlUES (131,'Padre Hurtado',26),
INSERT INTO Comunas VAlUES (132,'Peñaflor',26),
INSERT INTO Comunas VAlUES (133,'Talagante',26),
INSERT INTO Comunas VAlUES (134,'Codegua',27),
INSERT INTO Comunas VAlUES (135,'Coínco',27),
INSERT INTO Comunas VAlUES (136,'Coltauco',27),
INSERT INTO Comunas VAlUES (137,'Doñihue',27),
INSERT INTO Comunas VAlUES (138,'Graneros',27),
INSERT INTO Comunas VAlUES (139,'Las Cabras',27),
INSERT INTO Comunas VAlUES (140,'Machalí',27),
INSERT INTO Comunas VAlUES (141,'Malloa',27),
INSERT INTO Comunas VAlUES (142,'Mostazal',27),
INSERT INTO Comunas VAlUES (143,'Olivar',27),
INSERT INTO Comunas VAlUES (144,'Peumo',27),
INSERT INTO Comunas VAlUES (145,'Pichidegua',27),
INSERT INTO Comunas VAlUES (146,'Quinta de Tilcoco',27),
INSERT INTO Comunas VAlUES (147,'Rancagua',27),
INSERT INTO Comunas VAlUES (148,'Rengo',27),
INSERT INTO Comunas VAlUES (149,'Requínoa',27),
INSERT INTO Comunas VAlUES (150,'San Vicente de Tagua Tagua',27),
INSERT INTO Comunas VAlUES (151,'La Estrella',28),
INSERT INTO Comunas VAlUES (152,'Litueche',28),
INSERT INTO Comunas VAlUES (153,'Marchihue',28),
INSERT INTO Comunas VAlUES (154,'Navidad',28),
INSERT INTO Comunas VAlUES (155,'Peredones',28),
INSERT INTO Comunas VAlUES (156,'Pichilemu',28),
INSERT INTO Comunas VAlUES (157,'Chépica',29),
INSERT INTO Comunas VAlUES (158,'Chimbarongo',29),
INSERT INTO Comunas VAlUES (159,'Lolol',29),
INSERT INTO Comunas VAlUES (160,'Nancagua',29),
INSERT INTO Comunas VAlUES (161,'Palmilla',29),
INSERT INTO Comunas VAlUES (162,'Peralillo',29),
INSERT INTO Comunas VAlUES (163,'Placilla',29),
INSERT INTO Comunas VAlUES (164,'Pumanque',29),
INSERT INTO Comunas VAlUES (165,'San Fernando',29),
INSERT INTO Comunas VAlUES (166,'Santa Cruz',29),
INSERT INTO Comunas VAlUES (167,'Cauquenes',30),
INSERT INTO Comunas VAlUES (168,'Chanco',30),
INSERT INTO Comunas VAlUES (169,'Pelluhue',30),
INSERT INTO Comunas VAlUES (170,'Curicó',31),
INSERT INTO Comunas VAlUES (171,'Hualañé',31),
INSERT INTO Comunas VAlUES (172,'Licantén',31),
INSERT INTO Comunas VAlUES (173,'Molina',31),
INSERT INTO Comunas VAlUES (174,'Rauco',31),
INSERT INTO Comunas VAlUES (175,'Romeral',31),
INSERT INTO Comunas VAlUES (176,'Sagrada Familia',31),
INSERT INTO Comunas VAlUES (177,'Teno',31),
INSERT INTO Comunas VAlUES (178,'Vichuquén',31),
INSERT INTO Comunas VAlUES (179,'Colbún',32),
INSERT INTO Comunas VAlUES (180,'Linares',32),
INSERT INTO Comunas VAlUES (181,'Longaví',32),
INSERT INTO Comunas VAlUES (182,'Parral',32),
INSERT INTO Comunas VAlUES (183,'Retiro',32),
INSERT INTO Comunas VAlUES (184,'San Javier',32),
INSERT INTO Comunas VAlUES (185,'Villa Alegre',32),
INSERT INTO Comunas VAlUES (186,'Yerbas Buenas',32),
INSERT INTO Comunas VAlUES (187,'Constitución',33),
INSERT INTO Comunas VAlUES (188,'Curepto',33),
INSERT INTO Comunas VAlUES (189,'Empedrado',33),
INSERT INTO Comunas VAlUES (190,'Maule',33),
INSERT INTO Comunas VAlUES (191,'Pelarco',33),
INSERT INTO Comunas VAlUES (192,'Pencahue',33),
INSERT INTO Comunas VAlUES (193,'Río Claro',33),
INSERT INTO Comunas VAlUES (194,'San Clemente',33),
INSERT INTO Comunas VAlUES (195,'San Rafael',33),
INSERT INTO Comunas VAlUES (196,'Talca',33),
INSERT INTO Comunas VAlUES (197,'Arauco',34),
INSERT INTO Comunas VAlUES (198,'Cañete',34),
INSERT INTO Comunas VAlUES (199,'Contulmo',34),
INSERT INTO Comunas VAlUES (200,'Curanilahue',34),
INSERT INTO Comunas VAlUES (201,'Lebu',34),
INSERT INTO Comunas VAlUES (202,'Los Álamos',34),
INSERT INTO Comunas VAlUES (203,'Tirúa',34),
INSERT INTO Comunas VAlUES (204,'Alto Biobío',35),
INSERT INTO Comunas VAlUES (205,'Antuco',35),
INSERT INTO Comunas VAlUES (206,'Cabrero',35),
INSERT INTO Comunas VAlUES (207,'Laja',35),
INSERT INTO Comunas VAlUES (208,'Los Ángeles',35),
INSERT INTO Comunas VAlUES (209,'Mulchén',35),
INSERT INTO Comunas VAlUES (210,'Nacimiento',35),
INSERT INTO Comunas VAlUES (211,'Negrete',35),
INSERT INTO Comunas VAlUES (212,'Quilaco',35),
INSERT INTO Comunas VAlUES (213,'Quilleco',35),
INSERT INTO Comunas VAlUES (214,'San Rosendo',35),
INSERT INTO Comunas VAlUES (215,'Santa Bárbara',35),
INSERT INTO Comunas VAlUES (216,'Tucapel',35),
INSERT INTO Comunas VAlUES (217,'Yumbel',35),
INSERT INTO Comunas VAlUES (218,'Chiguayante',36),
INSERT INTO Comunas VAlUES (219,'Concepción',36),
INSERT INTO Comunas VAlUES (220,'Coronel',36),
INSERT INTO Comunas VAlUES (221,'Florida',36),
INSERT INTO Comunas VAlUES (222,'Hualpén',36),
INSERT INTO Comunas VAlUES (223,'Hualqui',36),
INSERT INTO Comunas VAlUES (224,'Lota',36),
INSERT INTO Comunas VAlUES (225,'Penco',36),
INSERT INTO Comunas VAlUES (226,'San Pedro de La Paz',36),
INSERT INTO Comunas VAlUES (227,'Santa Juana',36),
INSERT INTO Comunas VAlUES (228,'Talcahuano',36),
INSERT INTO Comunas VAlUES (229,'Tomé',36),
INSERT INTO Comunas VAlUES (230,'Bulnes',37),
INSERT INTO Comunas VAlUES (231,'Chillán',37),
INSERT INTO Comunas VAlUES (232,'Chillán Viejo',37),
INSERT INTO Comunas VAlUES (233,'Cobquecura',37),
INSERT INTO Comunas VAlUES (234,'Coelemu',37),
INSERT INTO Comunas VAlUES (235,'Coihueco',37),
INSERT INTO Comunas VAlUES (236,'El Carmen',37),
INSERT INTO Comunas VAlUES (237,'Ninhue',37),
INSERT INTO Comunas VAlUES (238,'Ñiquen',37),
INSERT INTO Comunas VAlUES (239,'Pemuco',37),
INSERT INTO Comunas VAlUES (240,'Pinto',37),
INSERT INTO Comunas VAlUES (241,'Portezuelo',37),
INSERT INTO Comunas VAlUES (242,'Quillón',37),
INSERT INTO Comunas VAlUES (243,'Quirihue',37),
INSERT INTO Comunas VAlUES (244,'Ránquil',37),
INSERT INTO Comunas VAlUES (245,'San Carlos',37),
INSERT INTO Comunas VAlUES (246,'San Fabián',37),
INSERT INTO Comunas VAlUES (247,'San Ignacio',37),
INSERT INTO Comunas VAlUES (248,'San Nicolás',37),
INSERT INTO Comunas VAlUES (249,'Treguaco',37),
INSERT INTO Comunas VAlUES (250,'Yungay',37),
INSERT INTO Comunas VAlUES (251,'Carahue',38),
INSERT INTO Comunas VAlUES (252,'Cholchol',38),
INSERT INTO Comunas VAlUES (253,'Cunco',38),
INSERT INTO Comunas VAlUES (254,'Curarrehue',38),
INSERT INTO Comunas VAlUES (255,'Freire',38),
INSERT INTO Comunas VAlUES (256,'Galvarino',38),
INSERT INTO Comunas VAlUES (257,'Gorbea',38),
INSERT INTO Comunas VAlUES (258,'Lautaro',38),
INSERT INTO Comunas VAlUES (259,'Loncoche',38),
INSERT INTO Comunas VAlUES (260,'Melipeuco',38),
INSERT INTO Comunas VAlUES (261,'Nueva Imperial',38),
INSERT INTO Comunas VAlUES (262,'Padre Las Casas',38),
INSERT INTO Comunas VAlUES (263,'Perquenco',38),
INSERT INTO Comunas VAlUES (264,'Pitrufquén',38),
INSERT INTO Comunas VAlUES (265,'Pucón',38),
INSERT INTO Comunas VAlUES (266,'Saavedra',38),
INSERT INTO Comunas VAlUES (267,'Temuco',38),
INSERT INTO Comunas VAlUES (268,'Teodoro Schmidt',38),
INSERT INTO Comunas VAlUES (269,'Toltén',38),
INSERT INTO Comunas VAlUES (270,'Vilcún',38),
INSERT INTO Comunas VAlUES (271,'Villarrica',38),
INSERT INTO Comunas VAlUES (272,'Angol',39),
INSERT INTO Comunas VAlUES (273,'Collipulli',39),
INSERT INTO Comunas VAlUES (274,'Curacautín',39),
INSERT INTO Comunas VAlUES (275,'Ercilla',39),
INSERT INTO Comunas VAlUES (276,'Lonquimay',39),
INSERT INTO Comunas VAlUES (277,'Los Sauces',39),
INSERT INTO Comunas VAlUES (278,'Lumaco',39),
INSERT INTO Comunas VAlUES (279,'Purén',39),
INSERT INTO Comunas VAlUES (280,'Renaico',39),
INSERT INTO Comunas VAlUES (281,'Traiguén',39),
INSERT INTO Comunas VAlUES (282,'Victoria',39),
INSERT INTO Comunas VAlUES (283,'Corral',40),
INSERT INTO Comunas VAlUES (284,'Lanco',40),
INSERT INTO Comunas VAlUES (285,'Los Lagos',40),
INSERT INTO Comunas VAlUES (286,'Máfil',40),
INSERT INTO Comunas VAlUES (287,'Mariquina',40),
INSERT INTO Comunas VAlUES (288,'Paillaco',40),
INSERT INTO Comunas VAlUES (289,'Panguipulli',40),
INSERT INTO Comunas VAlUES (290,'Valdivia',40),
INSERT INTO Comunas VAlUES (291,'Futrono',41),
INSERT INTO Comunas VAlUES (292,'La Unión',41),
INSERT INTO Comunas VAlUES (293,'Lago Ranco',41),
INSERT INTO Comunas VAlUES (294,'Río Bueno',41),
INSERT INTO Comunas VAlUES (295,'Ancud',42),
INSERT INTO Comunas VAlUES (296,'Castro',42),
INSERT INTO Comunas VAlUES (297,'Chonchi',42),
INSERT INTO Comunas VAlUES (298,'Curaco de Vélez',42),
INSERT INTO Comunas VAlUES (299,'Dalcahue',42),
INSERT INTO Comunas VAlUES (300,'Puqueldón',42),
INSERT INTO Comunas VAlUES (301,'Queilén',42),
INSERT INTO Comunas VAlUES (302,'Quemchi',42),
INSERT INTO Comunas VAlUES (303,'Quellón',42),
INSERT INTO Comunas VAlUES (304,'Quinchao',42),
INSERT INTO Comunas VAlUES (305,'Calbuco',43),
INSERT INTO Comunas VAlUES (306,'Cochamó',43),
INSERT INTO Comunas VAlUES (307,'Fresia',43),
INSERT INTO Comunas VAlUES (308,'Frutillar',43),
INSERT INTO Comunas VAlUES (309,'Llanquihue',43),
INSERT INTO Comunas VAlUES (310,'Los Muermos',43),
INSERT INTO Comunas VAlUES (311,'Maullín',43),
INSERT INTO Comunas VAlUES (312,'Puerto Montt',43),
INSERT INTO Comunas VAlUES (313,'Puerto Varas',43),
INSERT INTO Comunas VAlUES (314,'Osorno',44),
INSERT INTO Comunas VAlUES (315,'Puero Octay',44),
INSERT INTO Comunas VAlUES (316,'Purranque',44),
INSERT INTO Comunas VAlUES (317,'Puyehue',44),
INSERT INTO Comunas VAlUES (318,'Río Negro',44),
INSERT INTO Comunas VAlUES (319,'San Juan de la Costa',44),
INSERT INTO Comunas VAlUES (320,'San Pablo',44),
INSERT INTO Comunas VAlUES (321,'Chaitén',45),
INSERT INTO Comunas VAlUES (322,'Futaleufú',45),
INSERT INTO Comunas VAlUES (323,'Hualaihué',45),
INSERT INTO Comunas VAlUES (324,'Palena',45),
INSERT INTO Comunas VAlUES (325,'Aisén',46),
INSERT INTO Comunas VAlUES (326,'Cisnes',46),
INSERT INTO Comunas VAlUES (327,'Guaitecas',46),
INSERT INTO Comunas VAlUES (328,'Cochrane',47),
INSERT INTO Comunas VAlUES (329,'O-iggins',47),
INSERT INTO Comunas VAlUES (330,'Tortel',47),
INSERT INTO Comunas VAlUES (331,'Coihaique',48),
INSERT INTO Comunas VAlUES (332,'Lago Verde',48),
INSERT INTO Comunas VAlUES (333,'Chile Chico',49),
INSERT INTO Comunas VAlUES (334,'Río Ibáñez',49),
INSERT INTO Comunas VAlUES (335,'Antártica',50),
INSERT INTO Comunas VAlUES (336,'Cabo de Hornos',50),
INSERT INTO Comunas VAlUES (337,'Laguna Blanca',51),
INSERT INTO Comunas VAlUES (338,'Punta Arenas',51),
INSERT INTO Comunas VAlUES (339,'Río Verde',51),
INSERT INTO Comunas VAlUES (340,'San Gregorio',51),
INSERT INTO Comunas VAlUES (341,'Porvenir',52),
INSERT INTO Comunas VAlUES (342,'Primavera',52),
INSERT INTO Comunas VAlUES (343,'Timaukel',52),
INSERT INTO Comunas VAlUES (344,'Natales',53),
INSERT INTO Comunas VAlUES (345,'Torres del Paine',53);

-- Agrego datos a Provincias:
INSERT INTO Provincias VALUES (1,'Arica',1),
INSERT INTO Provincias VALUES (2,'Parinacota',1),
INSERT INTO Provincias VALUES (3,'Iquique',2),
INSERT INTO Provincias VALUES (4,'El Tamarugal',2),
INSERT INTO Provincias VALUES (5,'Antofagasta',3),
INSERT INTO Provincias VALUES (6,'El Loa',3),
INSERT INTO Provincias VALUES (7,'Tocopilla',3),
INSERT INTO Provincias VALUES (8,'Chañaral',4),
INSERT INTO Provincias VALUES (9,'Copiapó',4),
INSERT INTO Provincias VALUES (10,'Huasco',4),
INSERT INTO Provincias VALUES (11,'Choapa',5),
INSERT INTO Provincias VALUES (12,'Elqui',5),
INSERT INTO Provincias VALUES (13,'Limarí',5),
INSERT INTO Provincias VALUES (14,'Isla de Pascua',6),
INSERT INTO Provincias VALUES (15,'Los Andes',6),
INSERT INTO Provincias VALUES (16,'Petorca',6),
INSERT INTO Provincias VALUES (17,'Quillota',6),
INSERT INTO Provincias VALUES (18,'San Antonio',6),
INSERT INTO Provincias VALUES (19,'San Felipe de Aconcagua',6),
INSERT INTO Provincias VALUES (20,'Valparaiso',6),
INSERT INTO Provincias VALUES (21,'Chacabuco',7),
INSERT INTO Provincias VALUES (22,'Cordillera',7),
INSERT INTO Provincias VALUES (23,'Maipo',7),
INSERT INTO Provincias VALUES (24,'Melipilla',7),
INSERT INTO Provincias VALUES (25,'Santiago',7),
INSERT INTO Provincias VALUES (26,'Talagante',7),
INSERT INTO Provincias VALUES (27,'Cachapoal',7),
INSERT INTO Provincias VALUES (28,'Cardenal Caro',8),
INSERT INTO Provincias VALUES (29,'Colchagua',8),
INSERT INTO Provincias VALUES (30,'Cauquenes',9),
INSERT INTO Provincias VALUES (31,'Curicó',9),
INSERT INTO Provincias VALUES (32,'Linares',9),
INSERT INTO Provincias VALUES (33,'Talca',9),
INSERT INTO Provincias VALUES (34,'Arauco',10),
INSERT INTO Provincias VALUES (35,'Bio Bío',10),
INSERT INTO Provincias VALUES (36,'Concepción',10),
INSERT INTO Provincias VALUES (37,'Ñuble',10),
INSERT INTO Provincias VALUES (38,'Cautín',11),
INSERT INTO Provincias VALUES (39,'Malleco',11),
INSERT INTO Provincias VALUES (40,'Valdivia',12),
INSERT INTO Provincias VALUES (41,'Ranco',12),
INSERT INTO Provincias VALUES (42,'Chiloé',13),
INSERT INTO Provincias VALUES (43,'Llanquihue',13),
INSERT INTO Provincias VALUES (44,'Osorno',13),
INSERT INTO Provincias VALUES (45,'Palena',13),
INSERT INTO Provincias VALUES (46,'Aisén',14),
INSERT INTO Provincias VALUES (47,'Capitán Prat',14),
INSERT INTO Provincias VALUES (48,'Coihaique',14),
INSERT INTO Provincias VALUES (49,'General Carrera',14),
INSERT INTO Provincias VALUES (50,'Antártica Chilena',15),
INSERT INTO Provincias VALUES (51,'Magallanes',15),
INSERT INTO Provincias VALUES (52,'Tierra del Fuego',15),
INSERT INTO Provincias VALUES (53,'Última Esperanza',15);

-- Agrego datos a Regiones:
INSERT INTO Regiones VALUES (1,'Arica y Parinacota'),
INSERT INTO Regiones VALUES (2,'Tarapacá'),
INSERT INTO Regiones VALUES (3,'Antofagasta'),
INSERT INTO Regiones VALUES (4,'Atacama'),
INSERT INTO Regiones VALUES (5,'Coquimbo'),
INSERT INTO Regiones VALUES (6,'Valparaiso'),
INSERT INTO Regiones VALUES (7,'Metropolitana de Santiago'),
INSERT INTO Regiones VALUES (8,'Libertador General Bernardo OHiggins'),
INSERT INTO Regiones VALUES (9,'Maule'),
INSERT INTO Regiones VALUES (10,'Biobío'),
INSERT INTO Regiones VALUES (11,'La Araucanía'),
INSERT INTO Regiones VALUES (12,'Los Ríos'),
INSERT INTO Regiones VALUES (13,'Los Lagos'),
INSERT INTO Regiones VALUES (14,'Aisén del General Carlos Ibáñez del Campo'),
INSERT INTO Regiones VALUES (15,'Magallanes y de la Antártica Chilena');

-- Agrego datos a Parques:
INSERT INTO Parques VALUES (1,'Parque Springfield');

-- Agrego datos a Sector:
INSERT INTO Sector VALUES (1,'Patagonia',1);

-- Agrego datos a Reserva:
INSERT INTO Reservas VALUES (01,'22-06-2022',16234567,'23-06-2022','30-06-2022',300000, 359000,1,4,1);
INSERT INTO Reservas VALUES (02,'22-06-2022',15987341,'23-06-2022','30-06-2022',300000, 359000,1,5,1);
INSERT INTO Reservas VALUES (03,'22-06-2022',14623874,'23-06-2022','30-06-2022',300000, 359000,1,6,1);
INSERT INTO Reservas VALUES (04,'22-06-2022',14633852,'23-06-2022','30-06-2022',300000, 359000,1,7,1);

-- Agrego datos a Acompañante:
INSERT INTO Sector VALUES (01,15678906,);
INSERT INTO Sector VALUES (02,15879478,);