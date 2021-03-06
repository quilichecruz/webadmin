create database if not exists bdenei
default character set utf8
collate utf8_general_ci;
use bdenei;

create table admin(
user_admin varchar(10),
pass_admin varchar(10) not null,
nombre_admin varchar(50) not null, 
apellidos_admin varchar(50) not null,
primary key(user_admin));

insert into admin(user_admin,pass_admin,nombre_admin,apellidos_admin) 
values ('admin','pass','Gonzalo','Anchante Hurtado');

create table profesores(
dni_pro varchar(10) NOT NULL,
nombre_pro varchar(50) NOT NULL, 
apellidos_pro varchar(50) NOT NULL,
tele_pro varchar(50) NULL,
dire_pro varchar(100) NULL,
corr_pro varchar(100) NULL,
cpre_pro varchar(100) NULL,     
grad_pro varchar(50) NULL,
prof_pro varchar(50) NULL,
tipo_pro varchar(100) NULL,
cpos_pro varchar(100) NULL,
espe_pro varchar(600) NULL,
dipl_pro varchar(600) NULL,
expe_pro varchar(600) NULL,
sede_pro varchar(50) NULL,
c1 varchar(100) NULL,
c2 varchar(100) NULL,
c3 varchar(100) NULL,
c4 varchar(100) NULL,
c5 varchar(100) NULL,
c6 varchar(100) NULL,
c7 varchar(100) NULL,
c8 varchar(100) NULL,
c9 varchar(100) NULL,
c10 varchar(100) NULL,
c11 varchar(100) NULL,
c12 varchar(100) NULL,
PRIMARY KEY  (dni_pro));

create table cursos(
cod_cur int(10) auto_increment NOT NULL,
nombre_cur varchar(200) NOT NULL,
vaca_cur int(10) NOT NULL,
cost float(10) NULL,
desc_cur varchar(400) NULL,
PRIMARY KEY  (cod_cur));

create table registro(
id_registro int(10) auto_increment NOT NULL,
dni_pro varchar(10) NOT NULL,
cod_cur int(10) NOT NULL,
fechatini varchar(50) NOT NULL,
fechatfin varchar(50) NOT NULL,
esta varchar(50) NOT NULL,
labo varchar(50) NULL,
paga int(10) NULL,
frec varchar(100) NULL,
PRIMARY KEY  (id_registro));
ALTER TABLE registro ADD FOREIGN KEY(dni_pro) REFERENCES profesores(dni_pro);
ALTER TABLE registro ADD FOREIGN KEY(cod_cur) REFERENCES cursos(cod_cur);

create table sesion(
id_sesion int(10) auto_increment NOT NULL,
id_registro int(10) NOT NULL,
fecha varchar(15) NOT NULL,
horasini varchar(15) NOT NULL,
horasfin varchar(15) NOT NULL,
PRIMARY KEY  (id_sesion));
ALTER TABLE sesion ADD FOREIGN KEY(id_registro) REFERENCES registro(id_registro);

create table ingreso(
id_ingreso int(10) auto_increment NOT NULL,
id_sesion int(10) NOT NULL,
horaingreso varchar(50) NOT NULL,
PRIMARY KEY  (id_ingreso));
ALTER TABLE ingreso ADD FOREIGN KEY(id_sesion) REFERENCES sesion(id_sesion);

create table salida(
id_salida int(10) auto_increment NOT NULL,
id_ingreso int(10) NOT NULL,
horasalida varchar(50) NOT NULL,
PRIMARY KEY  (id_salida));
ALTER TABLE salida ADD FOREIGN KEY(id_ingreso) REFERENCES ingreso(id_ingreso);


select T1.id_registro,T1.cod_cur,T3.nombre_cur,
T1.paga,T1.dni_pro,T2.nombre_pro,T2.apellidos_pro,
T1.fechatini,T1.fechatfin,T1.esta,T1.labo,T3.vaca_cur,
-sum(paga-vaca_cur),T1.frec,T2.apellidos_pro,T2.nombre_pro
FROM registro T1 
INNER JOIN profesores T2 
INNER JOIN cursos T3
ON T1.dni_pro = T2.dni_pro 
AND T1.cod_cur = T3.cod_cur 
group by T1.id_registro



select if(I.id_ingreso='' or I.id_ingreso=null,'F','A'),S.id_sesion
from ingreso I
inner join sesion S
on I.id_sesion=S.id_sesion;

select S.id_sesion,I.id_sesion
from sesion S
inner join ingreso I
on I.id_sesion=S.id_sesion
group by S.id_sesion;


INSERT INTO `cursos` (`nombre_cur`,`vaca_cur`,`cost`,`desc_cur`) VALUES ('Administración de Proyectos con MS Project',50,350,'');
INSERT INTO `cursos` (`nombre_cur`,`vaca_cur`,`cost`,`desc_cur`) VALUES ('Elaboración de Balanced Scorecard en EXCEL',50,350,'');
INSERT INTO `cursos` (`nombre_cur`,`vaca_cur`,`cost`,`desc_cur`) VALUES ('Macros en Excel para el Análisis de la Información Estadística ',50,350,'');
INSERT INTO `cursos` (`nombre_cur`,`vaca_cur`,`cost`,`desc_cur`) VALUES ('Planeamiento y Ejecución de Encuestas',50,350,'');
INSERT INTO `cursos` (`nombre_cur`,`vaca_cur`,`cost`,`desc_cur`) VALUES ('Técnicas de Muestreo y sus Aplicaciones',50,350,'');
INSERT INTO `cursos` (`nombre_cur`,`vaca_cur`,`cost`,`desc_cur`) VALUES ('Microstrategy Business Intelligence',50,350,'');
INSERT INTO `cursos` (`nombre_cur`,`vaca_cur`,`cost`,`desc_cur`) VALUES ('Análisis de Datos con SPSS',50,350,'');
INSERT INTO `cursos` (`nombre_cur`,`vaca_cur`,`cost`,`desc_cur`) VALUES ('Métodos Estadisticos',50,350,'');
INSERT INTO `cursos` (`nombre_cur`,`vaca_cur`,`cost`,`desc_cur`) VALUES ('Estadística Descriptiva e Inferencial',50,350,'');
INSERT INTO `cursos` (`nombre_cur`,`vaca_cur`,`cost`,`desc_cur`) VALUES ('Esp. en Desarrollo Web con Python/Django- Desarrollo web con PYTHON/DJANGO',50,350,'');
INSERT INTO `cursos` (`nombre_cur`,`vaca_cur`,`cost`,`desc_cur`) VALUES ('Esp. de Administración y Gestión de Servidores Linux-Administración Básica de Linux',50,350,'');
INSERT INTO `cursos` (`nombre_cur`,`vaca_cur`,`cost`,`desc_cur`) VALUES ('STATA Intermedio',50,350,'');
INSERT INTO `cursos` (`nombre_cur`,`vaca_cur`,`cost`,`desc_cur`) VALUES ('Análisis de Datos con I SPSS',50,350,'');
INSERT INTO `cursos` (`nombre_cur`,`vaca_cur`,`cost`,`desc_cur`) VALUES ('Análisis de Datos con R – Nivel Básico',50,350,'');
INSERT INTO `cursos` (`nombre_cur`,`vaca_cur`,`cost`,`desc_cur`) VALUES ('Análisis de datos con uso de software estadístico para la toma de decisiones del alto mando Policial',50,350,'');
INSERT INTO `cursos` (`nombre_cur`,`vaca_cur`,`cost`,`desc_cur`) VALUES ('Análisis de Datos II con SPSS',50,350,'');
INSERT INTO `cursos` (`nombre_cur`,`vaca_cur`,`cost`,`desc_cur`) VALUES ('Análisis de Indicadores y elaboración de reportes socioeconómicos',50,350,'');
INSERT INTO `cursos` (`nombre_cur`,`vaca_cur`,`cost`,`desc_cur`) VALUES ('Análisis Económico Financiero',50,350,'');
INSERT INTO `cursos` (`nombre_cur`,`vaca_cur`,`cost`,`desc_cur`) VALUES ('ARCGIS Básico',50,350,'');
INSERT INTO `cursos` (`nombre_cur`,`vaca_cur`,`cost`,`desc_cur`) VALUES ('Construcción e Inter. de Indicadores Económicos y Sociales',50,350,'');
INSERT INTO `cursos` (`nombre_cur`,`vaca_cur`,`cost`,`desc_cur`) VALUES ('Curso Taller Documentación Virtual de Investigaciones Estadísticas ',50,350,'');
INSERT INTO `cursos` (`nombre_cur`,`vaca_cur`,`cost`,`desc_cur`) VALUES ('Curso taller internacional "Hacia un Sistema Estadístico Integrado basado en Registros Administrativos"',50,350,'');
INSERT INTO `cursos` (`nombre_cur`,`vaca_cur`,`cost`,`desc_cur`) VALUES ('Curso Taller Sistemas de Información Geográfica con ARCGIS',50,350,'');
INSERT INTO `cursos` (`nombre_cur`,`vaca_cur`,`cost`,`desc_cur`) VALUES ('Curso Taller Software R',50,350,'');
INSERT INTO `cursos` (`nombre_cur`,`vaca_cur`,`cost`,`desc_cur`) VALUES ('Diseño y manejo de Base de datos Ofimáticas con Excel y Access',50,350,'');
INSERT INTO `cursos` (`nombre_cur`,`vaca_cur`,`cost`,`desc_cur`) VALUES ('Esp. en Estadística Aplicada - Análisis Multivariado',50,350,'');
INSERT INTO `cursos` (`nombre_cur`,`vaca_cur`,`cost`,`desc_cur`) VALUES ('Esp. en Estadística Aplicada - Diseño Experimentales',50,350,'');
INSERT INTO `cursos` (`nombre_cur`,`vaca_cur`,`cost`,`desc_cur`) VALUES ('Esp. en Estadística Aplicada - Muestreo I',50,350,'');
INSERT INTO `cursos` (`nombre_cur`,`vaca_cur`,`cost`,`desc_cur`) VALUES ('Esp. en Estadística Aplicada  - Seminario',50,350,'');
INSERT INTO `cursos` (`nombre_cur`,`vaca_cur`,`cost`,`desc_cur`) VALUES ('Esp. en Estadíst. Aplicada - Regresión Lineal y Mét. No Paramétri.',50,350,'');
INSERT INTO `cursos` (`nombre_cur`,`vaca_cur`,`cost`,`desc_cur`) VALUES ('Esp. en en Estadística Aplicada - Métodos Estadísticos',50,350,'');
INSERT INTO `cursos` (`nombre_cur`,`vaca_cur`,`cost`,`desc_cur`) VALUES ('Esp. en Excel - Análisis de Datos y Macros en Excel',50,350,'');
INSERT INTO `cursos` (`nombre_cur`,`vaca_cur`,`cost`,`desc_cur`) VALUES ('Esp. en Excel - Excel Aplicado a las Finanzas',50,350,'');
INSERT INTO `cursos` (`nombre_cur`,`vaca_cur`,`cost`,`desc_cur`) VALUES ('Esp. en Excel - Funciones y gráficos en Excel',50,350,'');
INSERT INTO `cursos` (`nombre_cur`,`vaca_cur`,`cost`,`desc_cur`) VALUES ('Esp. en Excel - Procesos e indicadores de Gestión en Excel',50,350,'');
INSERT INTO `cursos` (`nombre_cur`,`vaca_cur`,`cost`,`desc_cur`) VALUES ('Esp. en Muestreo - Muestras Complejas y Análisis con SPSS',50,350,'');
INSERT INTO `cursos` (`nombre_cur`,`vaca_cur`,`cost`,`desc_cur`) VALUES ('Esp. en Muestreo - Muestreo II',50,350,'');
INSERT INTO `cursos` (`nombre_cur`,`vaca_cur`,`cost`,`desc_cur`) VALUES ('Esp. en Muestreo - Planeamiento y Ejecución de Encuestas',50,350,'');
INSERT INTO `cursos` (`nombre_cur`,`vaca_cur`,`cost`,`desc_cur`) VALUES ('Estadistica Descriptiva con Excel',50,350,'');
INSERT INTO `cursos` (`nombre_cur`,`vaca_cur`,`cost`,`desc_cur`) VALUES ('Estadística Descriptiva e Inferencial',50,350,'');
INSERT INTO `cursos` (`nombre_cur`,`vaca_cur`,`cost`,`desc_cur`) VALUES ('Excel Básico',50,350,'');
INSERT INTO `cursos` (`nombre_cur`,`vaca_cur`,`cost`,`desc_cur`) VALUES ('Excel Intermedio',50,350,'');
INSERT INTO `cursos` (`nombre_cur`,`vaca_cur`,`cost`,`desc_cur`) VALUES ('Herramientas ofimáticas Avanzadas',50,350,'');
INSERT INTO `cursos` (`nombre_cur`,`vaca_cur`,`cost`,`desc_cur`) VALUES ('Herramientas ofimáticas Básica',50,350,'');
INSERT INTO `cursos` (`nombre_cur`,`vaca_cur`,`cost`,`desc_cur`) VALUES ('Herramientas Ofimáticas Intermedias',50,350,'');
INSERT INTO `cursos` (`nombre_cur`,`vaca_cur`,`cost`,`desc_cur`) VALUES ('Herramientas Ofimáticas para la Gestión Administrativa',50,350,'');
INSERT INTO `cursos` (`nombre_cur`,`vaca_cur`,`cost`,`desc_cur`) VALUES ('Indicadores demográficos y proyecciones de población',50,350,'');
INSERT INTO `cursos` (`nombre_cur`,`vaca_cur`,`cost`,`desc_cur`) VALUES ('Indicadores Económicos y Cuentas Nacionales',50,350,'');
INSERT INTO `cursos` (`nombre_cur`,`vaca_cur`,`cost`,`desc_cur`) VALUES ('LINUX',50,350,'');
INSERT INTO `cursos` (`nombre_cur`,`vaca_cur`,`cost`,`desc_cur`) VALUES ('Macros en Excel para el Análisis de la Información Estadística',50,350,'');
INSERT INTO `cursos` (`nombre_cur`,`vaca_cur`,`cost`,`desc_cur`) VALUES ('Planeamiento Estratégico',50,350,'');
INSERT INTO `cursos` (`nombre_cur`,`vaca_cur`,`cost`,`desc_cur`) VALUES ('Planeamiento y Ejecución de Encuestas',50,350,'');
INSERT INTO `cursos` (`nombre_cur`,`vaca_cur`,`cost`,`desc_cur`) VALUES ('SPSS Avanzado',50,350,'');
INSERT INTO `cursos` (`nombre_cur`,`vaca_cur`,`cost`,`desc_cur`) VALUES ('SPSS Básico',50,350,'');
INSERT INTO `cursos` (`nombre_cur`,`vaca_cur`,`cost`,`desc_cur`) VALUES ('SPSS Intermedio',50,350,'');
INSERT INTO `cursos` (`nombre_cur`,`vaca_cur`,`cost`,`desc_cur`) VALUES ('STATA Básico',50,350,'');
INSERT INTO `cursos` (`nombre_cur`,`vaca_cur`,`cost`,`desc_cur`) VALUES ('Técnica de Muestreo y sus Aplicaciones',50,350,'');
INSERT INTO `cursos` (`nombre_cur`,`vaca_cur`,`cost`,`desc_cur`) VALUES ('Uso y Explotación de Base de Datos con SQL',50,350,'');





INSERT INTO `profesores` (`dni_pro`,`nombre_pro`,`apellidos_pro`,`tele_pro`,`dire_pro`,`corr_pro`,`cpre_pro`,`grad_pro`,`prof_pro`,`tipo_pro`,`cpos_pro`,`espe_pro`,`dipl_pro`,`expe_pro`,`sede_pro`) VALUES ('02445284','Alex','Mamami Cordova','992971172 / 991685925','Jr J. P. Fernandini 1015 –Breña','Alex.Mamani@inei.gob.pe','null','Bachiller','Computación e Informática','','','ESPECIALISTA ESTADISTICO II','Análisis de Datos I con SPSS - Loreto / STATA Básico','Profesional Económico Social IV – Encuesta Nacional de Hogares – Análisis y estimación de Indicadores económicos sociales de la Encuesta Nacional de hogares para el cálculo de la pobreza. De  Mayo 2014 a la fecha','Lima');
INSERT INTO `profesores` (`dni_pro`,`nombre_pro`,`apellidos_pro`,`tele_pro`,`dire_pro`,`corr_pro`,`cpre_pro`,`grad_pro`,`prof_pro`,`tipo_pro`,`cpos_pro`,`espe_pro`,`dipl_pro`,`expe_pro`,`sede_pro`) VALUES ('06002748','Walter Jaime','Abanto Sanchez','4245462 / 994603469','Jr. Ica N° 844 Dpto. 112 Lima','walter.abanto@inei.gob.pe','null','Titulado','Estadística e Informática','','','','INEI - Uso y aplicación del sistema de información geográfica STATA /SPSS /Microsoft / access y visual FoxPro / Microsoft windows','Ministerio de Produccion / Essalud /SEPTIS DE VIDA / Instituto Nacional de Estadistica e Informatica','Lima');
INSERT INTO `profesores` (`dni_pro`,`nombre_pro`,`apellidos_pro`,`tele_pro`,`dire_pro`,`corr_pro`,`cpre_pro`,`grad_pro`,`prof_pro`,`tipo_pro`,`cpos_pro`,`espe_pro`,`dipl_pro`,`expe_pro`,`sede_pro`) VALUES ('06182224','Yoni Jose','Ornay Snachez','5646175/993967528','Urb. Palomino 5ta Zona S-4-22- Cercado de Lima','taurus_1011@hotmail.com','null','Egresado','Computación e Informática','','','','Ensamblaje y reparacion de PCs , Instalacion de Redes y Cabinas de nternet- SENATI / operación S /36 , Implementacion S /36, Utilitarios SDA,SEU, DFU , SORT','IDAT Programa de especializacion en el area de Diseño Grafico y Diseño Web / IST Metropolitano  coordinador PNI -instructor / Escuela Superior de Administracion de empresas - Jefe Administrador de Red','Lima');
INSERT INTO `profesores` (`dni_pro`,`nombre_pro`,`apellidos_pro`,`tele_pro`,`dire_pro`,`corr_pro`,`cpre_pro`,`grad_pro`,`prof_pro`,`tipo_pro`,`cpos_pro`,`espe_pro`,`dipl_pro`,`expe_pro`,`sede_pro`) VALUES ('07122015','Daniel Dario','Segura Ferry','966759371','Psje. Mendez Ibañez 39A .San Roque , Santiago de Surco','seguraferrydaniel@gmail.com','null','Bachiller','Economía','','','','Diplomado de Especializacion de Proyectos bajo el margen del Sistema Nacional de Inversion publica -Instituto peruano de Asuntos Publicos , Politicos y Gobierno / Diplomado de anlisis de Base de Datos y Construccion de indices para el desarrolllo Sostenible -Univ. Ricardo Palma / Especializacion en Finanzas -Lambda Group / Formulacion de Proyectos de inversion publica -Congreso de la Republica Faculta de Ciencias Economicas Federico Villarreal','Analista de base de Datos de la encuesta provincial de Hogares Rurales - EMPROHRU /Analista  de Base de Datos de la encuesta nacional de Hogares ENAHO/ practicante de la Division de Estudios Estadisticos de la Sunat','Lima');
INSERT INTO `profesores` (`dni_pro`,`nombre_pro`,`apellidos_pro`,`tele_pro`,`dire_pro`,`corr_pro`,`cpre_pro`,`grad_pro`,`prof_pro`,`tipo_pro`,`cpos_pro`,`espe_pro`,`dipl_pro`,`expe_pro`,`sede_pro`) VALUES ('07502607','Edgar Eduardo','Huaman vera','993191104 / 993585785','Jirón Enrique Barreda 346, Urbanización Apolo, La Victoria','Edgar.huaman@inei.gob.pe','null','Titulado','Ingeniería de Sistemas','','','','Cursos de capacitación para los Censos Nacionales 2007: XI de Población VI de Vivienda','Sub Jefatura de Estadística. Cargo: Especialista Estadístico Procesar y analizar bases de datos de los Censos nacionales y Encuestas que produce el INEI para la generación de estadísticas e indicadores económicos, sociales y demográficos. Elaborar aplicaciones dinámicas para los informes de la alta dirección con la finalidad de contar con material informático. Sistematizar información estadística de los diferentes registros administrativos','Lima');
INSERT INTO `profesores` (`dni_pro`,`nombre_pro`,`apellidos_pro`,`tele_pro`,`dire_pro`,`corr_pro`,`cpre_pro`,`grad_pro`,`prof_pro`,`tipo_pro`,`cpos_pro`,`espe_pro`,`dipl_pro`,`expe_pro`,`sede_pro`) VALUES ('07686040','Jose Carlos','Garcia La Riva','485558 / 988678660','Jr. Fitzcarrald 1225 -Covida Los Olivos','jgarcialariva@gmail.com','null','Titulado','Ingeniería de Sistemas','Maestría','','Ingenieria de Sistemas con mencion en Tecnologias de Informacion','Operación , RPG BASICO ,QUERY ,SQL , DISEÑO DE PROGRAMAS , RPG INTERACTIVO','Coordinador academico de CETIS- UTP /Coordinador academico de Computacion y Redes/ Jefe del Centro de Informacion e investigacion CIDAT','Lima');
INSERT INTO `profesores` (`dni_pro`,`nombre_pro`,`apellidos_pro`,`tele_pro`,`dire_pro`,`corr_pro`,`cpre_pro`,`grad_pro`,`prof_pro`,`tipo_pro`,`cpos_pro`,`espe_pro`,`dipl_pro`,`expe_pro`,`sede_pro`) VALUES ('07746459','Luis','Meza Santa Cruz','6204711 / 954305120 / 999877488','MANCO CÁPAC 141 DEPTO. 401 - MAGDALENA DEL MAR','luis.meza@inei.gob.pe / lamezasc@gmail.com','null','Licenciado','Estadística / Demógrafo','','','ESPECIALISTA EN ANÁLISIS DEMOGRÁFICO, ESTIMACIONES Y PROYECCIONES DE POBLACIÓN, ESTUDIOS DE POBLACIÓN, Y  ANÁLISIS ESTADÍSTICO','Facultad de Ciencias Sociales de la PONTIFICIA UNIVERSIDAD CATÓLICA DEL PERÚ (PUCP), 1985','Profesor del Curso “Indicadores Demográficos y Proyecciones de Población”, organizado por el Instituto Nacional de Estadística e Informática, en el Centro Andino de Formación y Capacitación en Estadística (CAFCE) (Escuela del INEI), del 17 de octubre al 09 de noviembre del 2016','Lima');
INSERT INTO `profesores` (`dni_pro`,`nombre_pro`,`apellidos_pro`,`tele_pro`,`dire_pro`,`corr_pro`,`cpre_pro`,`grad_pro`,`prof_pro`,`tipo_pro`,`cpos_pro`,`espe_pro`,`dipl_pro`,`expe_pro`,`sede_pro`) VALUES ('07830380','Edison','Asurza Olaechea','955753169 / 2767416 / 991182604','Av. Andres A. Caceres Mz P  lote 23  TRebol Azul  San Juan de Miraflores','edison.asurza@inei.gob.pe','null','Bachiller','Ingeniería  de  Minas','','','Ingeniería  de  minas','','10 años de experiencia trabajando en diferentes empresas  privadas dedicadas a la minería (Compañía Minera “Los Mantos  S.A”,  Compañía Minera “Raura S. A”.  entre otras)','Lima');
INSERT INTO `profesores` (`dni_pro`,`nombre_pro`,`apellidos_pro`,`tele_pro`,`dire_pro`,`corr_pro`,`cpre_pro`,`grad_pro`,`prof_pro`,`tipo_pro`,`cpos_pro`,`espe_pro`,`dipl_pro`,`expe_pro`,`sede_pro`) VALUES ('07973299','Cesar Augusto','Frassinetti Ochoa','942742795','Pasaje. Chacas 227 dpto 402- Breña','cfrassinetti@gmail.com','null','Titulado','Administración','LICENCIADO','','','Especializacion de metodologia y estrategias para los procesos de enseñanza aprendizaje','Coordinador Nacional: Actualizacion Cartografica y registro de viviendas y establecimientos de los Censos Nacionales: XII de Poblacion, VII de Vivienda y III de Comunidades Indigenas (Profesional Economico Social IV) en la Direccion Nacional de Censos y Encuestas','Lima');
INSERT INTO `profesores` (`dni_pro`,`nombre_pro`,`apellidos_pro`,`tele_pro`,`dire_pro`,`corr_pro`,`cpre_pro`,`grad_pro`,`prof_pro`,`tipo_pro`,`cpos_pro`,`espe_pro`,`dipl_pro`,`expe_pro`,`sede_pro`) VALUES ('08135430','Rosario Maritza','Javier Rimay','3810513/988728024','Av Brazil 1055 - Dpto . 1104 B - Jesus Maria','rosariojav@gmail.com','null','Titulado','Economía','Maestría','','Gerencia Social','Planeamiento y Ejecucion de Ecnuestas -INEI y Herrmaientas Estadisticas SPSS - STATA /especialista en informatica y Computacion - Universidad Inca Garcilazo de la Vega','Jefa de Proyectos /Direcion Nacional deCensos (ENHCO2013)/Direccion de Censos y Ecnuestas ENAPRES Y SISFOH / Metodologia Principal -Encuesta Juventud , Empleo y Migracion Internacional 2009','Lima');
INSERT INTO `profesores` (`dni_pro`,`nombre_pro`,`apellidos_pro`,`tele_pro`,`dire_pro`,`corr_pro`,`cpre_pro`,`grad_pro`,`prof_pro`,`tipo_pro`,`cpos_pro`,`espe_pro`,`dipl_pro`,`expe_pro`,`sede_pro`) VALUES ('09377754','Luis Humberto','Guillen Grados','985316859 / 948977181','URB.SAN ILDEFONSO CASA 17 MONTERRICO','lguilleng@gmail.com / lguilleng@uni.edu.pe','null','Licenciado','Ingeniería de Sistemas y Cómputo','Maestría','','','EL SISTEMA ESTADÍSTICO NACIONAL Y LA PRESPECTIVA MUNDIAL DE LA ESTADÍSTICA','Jefe (e) de la Unidad de Planeamiento\r\nConducción en la formulación del Plan Estratégico Institucional.\r\nElaboración y seguimiento de estadísticas  institucionales.\r\nMonitoreo de indicadores de gestión.\r\nRepresentante ante el Comité Interinstitucional de Estadística.\r\nMiembro del equipo técnico para la formulación y evaluación del Programa Presupuestal','Lima');
INSERT INTO `profesores` (`dni_pro`,`nombre_pro`,`apellidos_pro`,`tele_pro`,`dire_pro`,`corr_pro`,`cpre_pro`,`grad_pro`,`prof_pro`,`tipo_pro`,`cpos_pro`,`espe_pro`,`dipl_pro`,`expe_pro`,`sede_pro`) VALUES ('09426763','Mabel Beatriz','Garcia Davila','5641517','Jr.Victorino Laynez 1454 Urb.Elio-Lima','mbdg9598@hotmail.com','null','Bachiller','Computación e Informática','Maestría','','Docencia Universitaria','Windows 7 y 8 - Lenguajes de Programacion( PHP , Visual NET, SQL SERVER  2005)-Software Estadistico y Matematico -Desarrollo de Pagina Web y cursos de Hardware','Capacitador de Paquetes Estadisticos -NEI / Capacitador en Estadistica descirptiva  e Inferencia estadistica- CONGRESO DE LA REPUBLICA / Capacitador de Informatica -UNMSM','Lima');
INSERT INTO `profesores` (`dni_pro`,`nombre_pro`,`apellidos_pro`,`tele_pro`,`dire_pro`,`corr_pro`,`cpre_pro`,`grad_pro`,`prof_pro`,`tipo_pro`,`cpos_pro`,`espe_pro`,`dipl_pro`,`expe_pro`,`sede_pro`) VALUES ('10313840','Willer','Chaduvi Puicon','998762306','Calle C – 1 Nº 137 Urb. Los Precursores – Santiago de Surco','wdchpunmsm@yahoo.es','null','Bachiller','Ingeniería Estadística','','','','','Profesor en la Escuela Académico Profesional de Ciencias Contables y Financieras de los cursos Tesis I y Tesis II Semestre Académico 2014 – II','Lima');
INSERT INTO `profesores` (`dni_pro`,`nombre_pro`,`apellidos_pro`,`tele_pro`,`dire_pro`,`corr_pro`,`cpre_pro`,`grad_pro`,`prof_pro`,`tipo_pro`,`cpos_pro`,`espe_pro`,`dipl_pro`,`expe_pro`,`sede_pro`) VALUES ('10487050','Ernesto','Mercado Ocampo','6825269 / 984710492','J.r Jose Santos Figueroa  N° 234 segundo piso Urb. Santa Luzmila -Comas','econ.mercado@gmail.com','null','Titulado','Economía','Maestría','','Gestion de Inversion Publica','Experto en Ofimatica -Universidad Nacional Federico Villarreal /SPSS Intermedio  - INEI / Universidad  Nacional de Ingenieria -\" Estrategia de Gestion Ambiental y Desarrollo de la Tecnologiade las Minas e  Industrias a fines\" /Oficina General de Cooperacion y Relaciones Interinstitucionales de la UNMSM -Identificacion y Formulacion de proyectos en Cooperacion con el Desarrollo/Consultores Inmobiliarios SA -\"Como invertir con Exito en Proyectos MiVivienda \"/UNMSM - Actualizacion del nuevo plan contable','INEI-Direccion Nacional de Cuentas Nacionales y Asistente especialista Economico Social I, II, III y IV / Asistente Personal de la ingeniera Gladis Vilca Achata Ex congresista de la Republica','Lima');
INSERT INTO `profesores` (`dni_pro`,`nombre_pro`,`apellidos_pro`,`tele_pro`,`dire_pro`,`corr_pro`,`cpre_pro`,`grad_pro`,`prof_pro`,`tipo_pro`,`cpos_pro`,`espe_pro`,`dipl_pro`,`expe_pro`,`sede_pro`) VALUES ('18070102','Patricia','Vásquez Sotero','999980532 / 4401620','Av. Libertadores 485-5°piso, San Isidro (Lima 27)','patricia.vsotero@gmail.com /  vasquez.pe@pucp.pe','null','Licenciada','Ingeniería Estadística','Maestría','','Estadisticas','El Enfoque por Resultados en el Presupuesto. PUCP','Enseñanza de cursos de especialización en Estadística\r\nAplicada (Métodos estadísticos, Análisis Multivariante,Técnicas de Muestreo, Diseño de Experimentos, entre otros),\r\nutilizando R, SPSS, STATA, entre otros','Lima');
INSERT INTO `profesores` (`dni_pro`,`nombre_pro`,`apellidos_pro`,`tele_pro`,`dire_pro`,`corr_pro`,`cpre_pro`,`grad_pro`,`prof_pro`,`tipo_pro`,`cpos_pro`,`espe_pro`,`dipl_pro`,`expe_pro`,`sede_pro`) VALUES ('21463382','Rosa Maria','Salazar Salas','998191366 / 2250285','Calle 2 Nro. 215 Urb. Corpac San Isidro','rmsalazar44@gmail.com','null','Titulado','Economía','MBA','','Negocios Internacionales','Universidad de Piura- Programa de alta Direccion / Winsdows y Office y sistemas empresariales / ESAM - Diplomado en gerencia y Desarrollo de Emprendedores / Universidad San Martín de Porres -Curso: Administración de Empresas Televisivas','M&G PROFESIONAL ESTHETIC SAC - Gerente General /ANDINA DE RADIODIFUSIÓN SAC. (Canal 9) -  Gerente de Administración, Finanzas y Recursos Humanos/  FOXTON SAC.  (Holding del grupo ATV)\r\nGerente  de Finanzas','Lima');
INSERT INTO `profesores` (`dni_pro`,`nombre_pro`,`apellidos_pro`,`tele_pro`,`dire_pro`,`corr_pro`,`cpre_pro`,`grad_pro`,`prof_pro`,`tipo_pro`,`cpos_pro`,`espe_pro`,`dipl_pro`,`expe_pro`,`sede_pro`) VALUES ('25570359','Guido','Trujillo Valdiviezo','7048825','Calle 36 Block B Dpto. 312, condominio El trebol - Los  Olivos','guido.trujillo@inei.gob.pe','null','Bachiller','Ingeniería de Sistemas','Maestría','','Maestría en Gestion Publica','Diplomados :  Gestión Financiera y Gubernamental - Gerencia Empresarial - Metodos y Tecnicas de Investigacion y Docencia Universitaria','Docente del Curso de Proyectos de Investigacion - UNI / Especialista en Sistemas e Informatica en instituciones del Estado y empresas Privadas  / Profesor con mas de 20 años de experiencia en Ienstitutos Superiores Tecnologicos en las Asignaturas Funadmentos de Programacion y Programacion Visual ( Basic , Powerbuilder, etc)','Lima');
INSERT INTO `profesores` (`dni_pro`,`nombre_pro`,`apellidos_pro`,`tele_pro`,`dire_pro`,`corr_pro`,`cpre_pro`,`grad_pro`,`prof_pro`,`tipo_pro`,`cpos_pro`,`espe_pro`,`dipl_pro`,`expe_pro`,`sede_pro`) VALUES ('25595833','Ricardo','Rosas Roque','2636975 / 993578959','San Guido 183 – 402, Urbanización Santa Florencia, San Miguel','rirosas@hotmail.com','null','Titulado','Economía','Maestría','','Ciencias Empresariales','Costos y Presupuesto. ESAN / Docencia Universitaria: Estrategias Metodológicas. UTP / Diplomado de Seguridad y Defensa Nacional. U. Inca Garcilaso de la Vega','Universidad Tecnológica del Perú -  Docente\r\nFacultad de Ingeniería Mecánica e Industrial : Estadística Descriptiva y Probabilidades- Estadística Inferencial- Herramientas Informáticas para la Toma de Decisiones / Universidad Ricardo Palma-Facultad de Ciencias Económicas y Empresariales\r\nDocente de Escuela de Turismo y Hotelería','Lima');
INSERT INTO `profesores` (`dni_pro`,`nombre_pro`,`apellidos_pro`,`tele_pro`,`dire_pro`,`corr_pro`,`cpre_pro`,`grad_pro`,`prof_pro`,`tipo_pro`,`cpos_pro`,`espe_pro`,`dipl_pro`,`expe_pro`,`sede_pro`) VALUES ('25789994','Gonzalo','Anchante Hurtado','986789744 / 991681388','Calle Los crisantemos 426, urb. Jardines Viru','gonzalo.anchante@inei.gob.pe / gonzalo.anchante@gmail.com','null','Titulado','Ingeniería de Sistemas','','','Formacion de Instructores en Informatica para la Administracion Pública - PCIAP','Educacion Superior Universitaria - UNMSM/Diseño y Formulacion del Plan Curricular por Competencias para la Educacion Superior- UTP/ taller especializadosobre metodologias y Tendencias En Capacitacion a Distancia -IDAT/ Gestion de Proyectos Informaticos -INEI','Responsable de la Plataforma virtual del INEI - Especialista en el Area Informatica - OTIN / Docente de cursos para Profesionales con la modalidad de Educacion a Distancia - UTP / Coordinador Academico de Informatica -GAUSS Data Virtual ','Lima');
INSERT INTO `profesores` (`dni_pro`,`nombre_pro`,`apellidos_pro`,`tele_pro`,`dire_pro`,`corr_pro`,`cpre_pro`,`grad_pro`,`prof_pro`,`tipo_pro`,`cpos_pro`,`espe_pro`,`dipl_pro`,`expe_pro`,`sede_pro`) VALUES ('25857412','Balvina','Merino Saldaña','999626221','J.R Colina N°218-Bellavista Callao','balvina.merino@inei.gob.pe / balvinam@gmail.com','null','Titulado','Estadística e Informática','Maestría','','Ingeniería de Sistemas con mención en Gestión en Tecnologías de la Información','Diplomado en Computacion -Universidad Nacional  Enrique Guzman y Valle / SPSS Basico , Intermedio y Avanzado -Facultad de Estadistica en Universidad Nacional Mayor de San Marcos /Metodologia de encuestas y Establecimientos , Analisis Estadistico , Muestras Complejas , Muestro , Construccion y Analisis de Indicadores con SPSS- INEI','Jefe de Proyecto - INEI / Analista en Metodologia - Encuesta nacional de Hogares sobre consumo de hoja de Coca /Encuesta distrital de Poblacion y Vivienda 2012 / Consejo Nacional Agropecuario (CENAGRO) Jefe de proyectos responsable de la elboracion y publicacion de los indicadores de Empleo - EPE - SUPERVISOR lOCAL / Coordinador Departamental -Sede Pucllpa (ENAHO)/ Instructora - ENAHO','Lima');
INSERT INTO `profesores` (`dni_pro`,`nombre_pro`,`apellidos_pro`,`tele_pro`,`dire_pro`,`corr_pro`,`cpre_pro`,`grad_pro`,`prof_pro`,`tipo_pro`,`cpos_pro`,`espe_pro`,`dipl_pro`,`expe_pro`,`sede_pro`) VALUES ('40037134','Jose Hernan','Huaman Sanchez','2542422 / 997339690','Av. Los Andenes , MZ L  LT9 . Urbanizacion San juan  Bautista  de Villa - Chorrillos','sentinel_1978@yahoo.es','null','Titulado','Computación e Informática','','','Ensamblaje y Mantenimiento , electrocnica y Reparacion de Celulares/ diseño Web en HTML y FrontPage 2000','Curso modular en redes : Fundamentos , Novell Netware , windows NT , Linux Conectiva y Linux Mandrake','Docente de archivos Multimedia de Animaciones con Flash mediante el lenguaje XML- UTP/ Jurado para Sutentacion de Tesis- programa de computacion e informatica - IDAT / Docente de Ensamblaje , Computacion y Diseño de Sitios Web - Sociedad Nacional de Informatica','Lima');
INSERT INTO `profesores` (`dni_pro`,`nombre_pro`,`apellidos_pro`,`tele_pro`,`dire_pro`,`corr_pro`,`cpre_pro`,`grad_pro`,`prof_pro`,`tipo_pro`,`cpos_pro`,`espe_pro`,`dipl_pro`,`expe_pro`,`sede_pro`) VALUES ('40715610','Juan','Trejo Bedón','#994603527','Calle Lucy Antunez de Maggliolo 269 - Los Olivos','jtrejo.tstats@gmail.com','null','Titulado','Ingeniero Estadístico e Informático','Maestría','','Tratamiento Estadístico Computacional de la Información','','Consultor BID (Código PRISM PE25465)  Asistente Técnico del Director Ejecutivo del Proyecto.  Efectuar la administración, seguimiento directo y permanente para asegurar la calidad de las actividades programadas en los documentos de gestión del Proyecto.  Elaboración de documentos metodológicos, análisis de la información estadística a nivel descriptivo y analítico sobre la criminalidad y seguridad ciudadana','Lima');
INSERT INTO `profesores` (`dni_pro`,`nombre_pro`,`apellidos_pro`,`tele_pro`,`dire_pro`,`corr_pro`,`cpre_pro`,`grad_pro`,`prof_pro`,`tipo_pro`,`cpos_pro`,`espe_pro`,`dipl_pro`,`expe_pro`,`sede_pro`) VALUES ('42992493','Gloria Del Pilar','Alvarez Vásquez','988501169','Av. Los postes este 520 SJL','Gloria.Alvarez@inei.gob.pe','null','Titulado','Economía','Maestría','','Gestión de Inversión Pública','','Setiembre 2010 - Actualidad: Instituto Nacional de Estadística e Informática / Descripción del puesto: Asistente en Metodología y Normatividad de Investigaciones','Lima');
INSERT INTO `profesores` (`dni_pro`,`nombre_pro`,`apellidos_pro`,`tele_pro`,`dire_pro`,`corr_pro`,`cpre_pro`,`grad_pro`,`prof_pro`,`tipo_pro`,`cpos_pro`,`espe_pro`,`dipl_pro`,`expe_pro`,`sede_pro`) VALUES ('44066591','Luis Alonzo','Salazar Pacheco','3484824 / 948942513','Jr. Alberto Ureta 229 , Urb Covima -La Molina','spluis87@gmail.com','null','','','','','','Fundamentos de GIS - CAD / Topografia /Catastro /Publicacion en GIS Web y Base de Datos / Programacion aplicada y Cartografia /Diseño Grafico','Experiencia en Censos Nacionales - INEI / Jefe de Seccion urbana - Capacitador de Empradonadores - Experiencia en encuestas CPI   / GIS INGENIEROS SAC - Docente de de sistemas de informacion Geografica / Ecoplaneacion Civil S.A - Digitalizacion y Edicion de planos en base  al Sistema de  Informacion Geografica /Instituto Catastral de Lima - Programador en el Area Especial De Sistemas','Lima');
INSERT INTO `profesores` (`dni_pro`,`nombre_pro`,`apellidos_pro`,`tele_pro`,`dire_pro`,`corr_pro`,`cpre_pro`,`grad_pro`,`prof_pro`,`tipo_pro`,`cpos_pro`,`espe_pro`,`dipl_pro`,`expe_pro`,`sede_pro`) VALUES ('44288570','Jose Maria','Renteria Vazques','997532439','Urb. Santa Raquel melgar 173 -Dpt .102','josrenteria@gmail.com','null','Titulado','Economía','Maestría','','Desarrollo Social y Economia aplicada / Economia Publica','Econometria Aplicada - Universidad de Ingenieria / Especializacion en muestreo - ENEI/Curso Avanzado de cuentas Nacionales -ENEI  /Curso de ArGis Basico -Universidad Agraria La molina','MINEDU- Direccion de Promocion del Bienestar y Reconomicento de docente /Instituto de estudios Peruanos - Se desempeño como investigador','Lima');
INSERT INTO `profesores` (`dni_pro`,`nombre_pro`,`apellidos_pro`,`tele_pro`,`dire_pro`,`corr_pro`,`cpre_pro`,`grad_pro`,`prof_pro`,`tipo_pro`,`cpos_pro`,`espe_pro`,`dipl_pro`,`expe_pro`,`sede_pro`) VALUES ('44494368','Cesar Augusto','Maldonado Bellido','988336385','J.r Rio Brando 1722 alt. Cudra.17 Av. Peru -San Martin de Porres','cesarmb88@hotmail.com','null','Titulado','Ingeniería Geográfica','Maestría','','Ingenieria Ambiental','Diplomado en Gestion de Evaluacion y Estudios de impacto Ambiental -Colegio de Ingenieros del Perú/ Normativa de Seguridad y Salud en el Trabajo - Instituto Peruano De Seguridad , Salud y medio Ambiente /ArcGis (nivel avanzado) -UNI/ AutoCad(nivel basico)-UNI','Servicio de Consultoria como Asistente Especialista Economico - INEI / Consultoria como Especialista Ambiental para la Elaboracion  del Estudio Ambiental de Pre- inversion -DATUM INGENIEROS SAC / Servicio de Consultoria en sistemas de informacion Geografica - Proyecto CENAGRO - CENSO NACIONAL AGROPECUARIO -INEI','Lima');
INSERT INTO `profesores` (`dni_pro`,`nombre_pro`,`apellidos_pro`,`tele_pro`,`dire_pro`,`corr_pro`,`cpre_pro`,`grad_pro`,`prof_pro`,`tipo_pro`,`cpos_pro`,`espe_pro`,`dipl_pro`,`expe_pro`,`sede_pro`) VALUES ('46349280','Leydi','Rico Yancce','98327042','Jr. J.J Pasa N° 731 - Pueblo Libre','Leydi.rico@pucp.pe','null','Titulado','Economía','Maestría','','Economia','Especializacion en muestreo , Econometria en Software 12 / cursos de Analisis de indicadores Economicos y Elaboracion de Reportes Socioeconomicos /Analisis Economico Financiero / Analisis e Interpretacion de Indicadores Economicos , SPSS intermedio','Analista de base de Datos del SISFOH , ENAHO, ENPRORU y Software STATA 13 y SPSS 21 / Asistente Especialista Economico- Social / Analisis de Bases de Datos Socioeconomicos / profesional Economico Social  -INEI','Lima');
INSERT INTO `profesores` (`dni_pro`,`nombre_pro`,`apellidos_pro`,`tele_pro`,`dire_pro`,`corr_pro`,`cpre_pro`,`grad_pro`,`prof_pro`,`tipo_pro`,`cpos_pro`,`espe_pro`,`dipl_pro`,`expe_pro`,`sede_pro`) VALUES ('70273788','Alfredo Manuel','Hijar Arquije','2846563 / 987729333','Av.La rosa Lozano 5 MZ C LT 6 Surco ','alfredomanuelhijar@gmail.com','null','Titulado','Administración de Negocios Internacionales','','','','ENEI-INEI-Capacitador sobre mapas  de Probreza en  POVMAP / Especializacion en cursos de Excel avanzado y Financiero /Universidad  De Piura - Estrategias y Tacticas avanzadas de SEO','INEI-2014 - Elaborar cuadros de Estadisticas y analisis de informes trimestrales identificando programas Presupuestales /Corporacion Logistica SPC.SAC Se desempeño en el area de Logistica referente a los proveedores , base de datos de clientes , Abastecimiento de Almacen /SCOTIABANK-2006 - Se desarllo en el area de Promocion de Servicio/Unique -2012  Auxiliar de Back Office','Lima');
INSERT INTO `profesores` (`dni_pro`,`nombre_pro`,`apellidos_pro`,`tele_pro`,`dire_pro`,`corr_pro`,`cpre_pro`,`grad_pro`,`prof_pro`,`tipo_pro`,`cpos_pro`,`espe_pro`,`dipl_pro`,`expe_pro`,`sede_pro`) VALUES ('73262198','Aylin','Pajuelo Lozano','2402535/996038008','JR. LORETO 658 DPTO 503 - BREÑA','aylin.pl.18@hotmail.com','null','Egresado','Administración','','','','','Dictado de curso de Ofimática en la Escuela del INEI','Lima');
INSERT INTO `profesores` (`dni_pro`,`nombre_pro`,`apellidos_pro`,`tele_pro`,`dire_pro`,`corr_pro`,`cpre_pro`,`grad_pro`,`prof_pro`,`tipo_pro`,`cpos_pro`,`espe_pro`,`dipl_pro`,`expe_pro`,`sede_pro`) VALUES ('7401647','Máximo A','Parra Cerrate','975976441','Calle Las Palomas 238 # 30 Urb. Limatambo – Surquillo','max.parracerrate@hotmail.com','null','Titulado','Educación','','','','Diplomado en Gestión Estratégica de Administración - IPAE  /  Diplomado en Contrataciones y Adquisiciones del Estado - Inca Garcilazo De La Vega  /  ESCUELA SUPERIOR DE ADMINISTRACION PUBLICA - ESAP Administración Publica Superior','Especialista en Capacitación II -INEI / Director de Sistema Administrativo II -OFICINA ADMINISRATIVA DEL INEI /  Jefe de Unidad de Critica Codificación -CENSO DE POBLACION Y VIVIENDA  / Asistente Censal /  Instructor Censal de Lima Metropolitana','Lima');
INSERT INTO `profesores` (`dni_pro`,`nombre_pro`,`apellidos_pro`,`tele_pro`,`dire_pro`,`corr_pro`,`cpre_pro`,`grad_pro`,`prof_pro`,`tipo_pro`,`cpos_pro`,`espe_pro`,`dipl_pro`,`expe_pro`,`sede_pro`) VALUES ('8720591','César Alberto','Salinas Castañeda','5785948 / 990086269','Calle 16-Pasaje 3 -N°171- Miramar-San Miguel(16 Av. Libertad)','cesarsalinas66@yahoo.com.ar / a19796129@pucp.edu.pe','null','Titulado','Economía','Maestría','','Maestría','Programa de Gobernabilidad, Gerencia Política y Gestión Pública 2016” (junio-nov. 2016). Programa auspiciado por la CAF y la Universidad George Washington. Desarrollado por la Escuela de Gobierno y Políticas Publicas de la Pontificia Universidad Católica del Perú-PUCP','','Lima');
INSERT INTO `profesores` (`dni_pro`,`nombre_pro`,`apellidos_pro`,`tele_pro`,`dire_pro`,`corr_pro`,`cpre_pro`,`grad_pro`,`prof_pro`,`tipo_pro`,`cpos_pro`,`espe_pro`,`dipl_pro`,`expe_pro`,`sede_pro`) VALUES ('9882749','Julio Alejandro','Ccari Mullisaca','950193457 / 5387093','','lcari2103@gmail.com','null','','','','','','','','Lima');
INSERT INTO `profesores` (`dni_pro`,`nombre_pro`,`apellidos_pro`,`tele_pro`,`dire_pro`,`corr_pro`,`cpre_pro`,`grad_pro`,`prof_pro`,`tipo_pro`,`cpos_pro`,`espe_pro`,`dipl_pro`,`expe_pro`,`sede_pro`) VALUES ('SIN DNI1','Peter','Abad Altamirano','989100621','','peter.abad@inei.gob.pe','null','Bachiller','','','','','','','Lima');
INSERT INTO `profesores` (`dni_pro`,`nombre_pro`,`apellidos_pro`,`tele_pro`,`dire_pro`,`corr_pro`,`cpre_pro`,`grad_pro`,`prof_pro`,`tipo_pro`,`cpos_pro`,`espe_pro`,`dipl_pro`,`expe_pro`,`sede_pro`) VALUES ('SIN DNI10','Victor','Lazarte Escobar','994603513','','alfabetagamma_9@hotmail.com','','','','','','','','','Lima');
INSERT INTO `profesores` (`dni_pro`,`nombre_pro`,`apellidos_pro`,`tele_pro`,`dire_pro`,`corr_pro`,`cpre_pro`,`grad_pro`,`prof_pro`,`tipo_pro`,`cpos_pro`,`espe_pro`,`dipl_pro`,`expe_pro`,`sede_pro`) VALUES ('SIN DNI11','Francisco','Luicho Goicochea','951991312','','francisco_luicho@hotmail.com','','','','','','','','','Lima');
INSERT INTO `profesores` (`dni_pro`,`nombre_pro`,`apellidos_pro`,`tele_pro`,`dire_pro`,`corr_pro`,`cpre_pro`,`grad_pro`,`prof_pro`,`tipo_pro`,`cpos_pro`,`espe_pro`,`dipl_pro`,`expe_pro`,`sede_pro`) VALUES ('SIN DNI12','Jorge Luis','Manrique Cienfuegos','4352843 / 943444083','Av. Evitamiento 1233-A Salamanca- Ate','jomanrique@ hotmail.com','null','Titulado','Estadística e Informática','Doctorado','','Economia','Curso de Proyectos de inversion Publica y de Costos presupuestados de obras urbanas','Municipalida de Lima Metropolitana - Gerencia de Administracion / Asamblea Nacional de Rectores - Coordinaador del Proyecto Observatotio Laboral universitario y Director de Estadistica /Organización ]Internacional para las Organizaciones - Coordinador Nacional  de Proyectos Internacionales - Consultor sobre Migracion Internacional /Congreso de la Republica Nacional - Asesor principal de la Oficina de Congresistas - Asesor de Pequeña Empresa','Lima');
INSERT INTO `profesores` (`dni_pro`,`nombre_pro`,`apellidos_pro`,`tele_pro`,`dire_pro`,`corr_pro`,`cpre_pro`,`grad_pro`,`prof_pro`,`tipo_pro`,`cpos_pro`,`espe_pro`,`dipl_pro`,`expe_pro`,`sede_pro`) VALUES ('SIN DNI13','Angela','Morales Sanchez','988607410','','a_morales22@yahoo.com','null','','','','','','','','Lima');
INSERT INTO `profesores` (`dni_pro`,`nombre_pro`,`apellidos_pro`,`tele_pro`,`dire_pro`,`corr_pro`,`cpre_pro`,`grad_pro`,`prof_pro`,`tipo_pro`,`cpos_pro`,`espe_pro`,`dipl_pro`,`expe_pro`,`sede_pro`) VALUES ('SIN DNI14','Gregorio','Navarro León','','','Gregorio.Navarro@inei.gob.pe','null','','','','','','','','Lima');
INSERT INTO `profesores` (`dni_pro`,`nombre_pro`,`apellidos_pro`,`tele_pro`,`dire_pro`,`corr_pro`,`cpre_pro`,`grad_pro`,`prof_pro`,`tipo_pro`,`cpos_pro`,`espe_pro`,`dipl_pro`,`expe_pro`,`sede_pro`) VALUES ('SIN DNI15','Ezio Ivan','Quispe Fernandez','959014118','','ezioquispe@gmail.com','null','','','','','','','','Lima');
INSERT INTO `profesores` (`dni_pro`,`nombre_pro`,`apellidos_pro`,`tele_pro`,`dire_pro`,`corr_pro`,`cpre_pro`,`grad_pro`,`prof_pro`,`tipo_pro`,`cpos_pro`,`espe_pro`,`dipl_pro`,`expe_pro`,`sede_pro`) VALUES ('SIN DNI16','Fidel','Reynoso Guerrero','#999-913-224 / 436-5610','Urb. Santa Raquel melgar 173 -Dpt .102','fidel.reynoso@inei.gob.pe','null','Bachiller','Estadística e Informática','Maestría','','Maestría en Gerencia Estadistica e Informatica','Diploma de Aprovechamiento -  “XIV Curso Regional Intensivo de Análisis \r\nDemográfico para el Desarrollo” Universidad de Costa Rica yl   \r\nCentro Latinoamericano de Demografía \r\n (CELADE)-Costa Rica','INSTITUTO NACIONAL DE ESTADÍSTICA E   INFORMATICA (INEI) / Estadístico II en la \r\nDirección Ejecutiva de Estudios e  Investigación','Lima');
INSERT INTO `profesores` (`dni_pro`,`nombre_pro`,`apellidos_pro`,`tele_pro`,`dire_pro`,`corr_pro`,`cpre_pro`,`grad_pro`,`prof_pro`,`tipo_pro`,`cpos_pro`,`espe_pro`,`dipl_pro`,`expe_pro`,`sede_pro`) VALUES ('SIN DNI17','Rolando','Rosas Roque','993578959','','rirosas@hotmail.com','','','','','','','','','Lima');
INSERT INTO `profesores` (`dni_pro`,`nombre_pro`,`apellidos_pro`,`tele_pro`,`dire_pro`,`corr_pro`,`cpre_pro`,`grad_pro`,`prof_pro`,`tipo_pro`,`cpos_pro`,`espe_pro`,`dipl_pro`,`expe_pro`,`sede_pro`) VALUES ('SIN DNI18','Javier','Torres Gomez','976196033','Av. Salaverry 2020 -Jesus Maria','j.torresgomez@up.edu.pe','null','Titulado','Economía','Maestría','','Economia','Matablab , Econometria Views , Stata , Latex , SPSS','Ministerio De Desarrollo e Inclusion Social - (Cooperacion Alemana) y gestiono las Directrices del uso de Base De Datos Administrativos / Consultor Externo','Lima');
INSERT INTO `profesores` (`dni_pro`,`nombre_pro`,`apellidos_pro`,`tele_pro`,`dire_pro`,`corr_pro`,`cpre_pro`,`grad_pro`,`prof_pro`,`tipo_pro`,`cpos_pro`,`espe_pro`,`dipl_pro`,`expe_pro`,`sede_pro`) VALUES ('SIN DNI19','Eduardo','Villa Morocho','','','eduardo.villa@inei.gob.pe	','null','','','','','','','','Lima');
INSERT INTO `profesores` (`dni_pro`,`nombre_pro`,`apellidos_pro`,`tele_pro`,`dire_pro`,`corr_pro`,`cpre_pro`,`grad_pro`,`prof_pro`,`tipo_pro`,`cpos_pro`,`espe_pro`,`dipl_pro`,`expe_pro`,`sede_pro`) VALUES ('SIN DNI2','Enzo','Bravo Burgos','','','edison.asurza@inei.gob.pe / enzo_bravo@hotmail.com	','null','','','','','','','','Lima');
INSERT INTO `profesores` (`dni_pro`,`nombre_pro`,`apellidos_pro`,`tele_pro`,`dire_pro`,`corr_pro`,`cpre_pro`,`grad_pro`,`prof_pro`,`tipo_pro`,`cpos_pro`,`espe_pro`,`dipl_pro`,`expe_pro`,`sede_pro`) VALUES ('SIN DNI3','Julio Alejandro','Ccari Guerra','950193457','','julio.ccari@hotmail.com','null','','','','','','','','Lima');
INSERT INTO `profesores` (`dni_pro`,`nombre_pro`,`apellidos_pro`,`tele_pro`,`dire_pro`,`corr_pro`,`cpre_pro`,`grad_pro`,`prof_pro`,`tipo_pro`,`cpos_pro`,`espe_pro`,`dipl_pro`,`expe_pro`,`sede_pro`) VALUES ('SIN DNI4','Pedro','Enriquez Pimentel','985832501','','pedro@enriquez.pe','','','','','','','','','Lima');
INSERT INTO `profesores` (`dni_pro`,`nombre_pro`,`apellidos_pro`,`tele_pro`,`dire_pro`,`corr_pro`,`cpre_pro`,`grad_pro`,`prof_pro`,`tipo_pro`,`cpos_pro`,`espe_pro`,`dipl_pro`,`expe_pro`,`sede_pro`) VALUES ('SIN DNI5','Saul','Garcia Mendoza','','','saul.garcia@inei.gob.pe','','','','','','','','','Lima');
INSERT INTO `profesores` (`dni_pro`,`nombre_pro`,`apellidos_pro`,`tele_pro`,`dire_pro`,`corr_pro`,`cpre_pro`,`grad_pro`,`prof_pro`,`tipo_pro`,`cpos_pro`,`espe_pro`,`dipl_pro`,`expe_pro`,`sede_pro`) VALUES ('SIN DNI6','Kadir Adhull','Huamani Posso','993745866','','kadirhp86@gmail.com','null','','Ingeniería Geográfica','Maestría','','Maestría De Ordenamiento Ambiental Del  Territorial En La Escuela De Post Grado De La Universidad Nacional De San Marcos','','Encargado de la información geográfica en el Encuesta Nacional de Empresas.INEI','Lima');
INSERT INTO `profesores` (`dni_pro`,`nombre_pro`,`apellidos_pro`,`tele_pro`,`dire_pro`,`corr_pro`,`cpre_pro`,`grad_pro`,`prof_pro`,`tipo_pro`,`cpos_pro`,`espe_pro`,`dipl_pro`,`expe_pro`,`sede_pro`) VALUES ('SIN DNI7','Jose Luis','Huertas Chumbes','5215160/976157268','Urb. Los alizos MzA.B-29 .San Martin de Porres Lima-Peru','jhuertas@inei.gob.pe','null','Titulado','Economía','Maestría','','Financiamiento de Empresas','Curso de Estadistica para cuentas Nacionales Trimestrales ,FMI, CEPAL, BRAZILIA -BRAZIL-2010 / Seminario Plan Contable General -Ministerio de Economia y Finanzas','INEI: Director nacional de Cuentas Nacionales y metodologia - Direccion de Bienes y Servicios (1996-2015)','Lima');
INSERT INTO `profesores` (`dni_pro`,`nombre_pro`,`apellidos_pro`,`tele_pro`,`dire_pro`,`corr_pro`,`cpre_pro`,`grad_pro`,`prof_pro`,`tipo_pro`,`cpos_pro`,`espe_pro`,`dipl_pro`,`expe_pro`,`sede_pro`) VALUES ('SIN DNI8','Oscar','Kuroiwa Quispe','','','Oscar.Kuroiwa@inei.gob.pe','','','','','','','','','Lima');
INSERT INTO `profesores` (`dni_pro`,`nombre_pro`,`apellidos_pro`,`tele_pro`,`dire_pro`,`corr_pro`,`cpre_pro`,`grad_pro`,`prof_pro`,`tipo_pro`,`cpos_pro`,`espe_pro`,`dipl_pro`,`expe_pro`,`sede_pro`) VALUES ('SIN DNI9','Cesar','Lara Ponce','994603513','','cesar.lara@inei.gob.pe','','','','','','','','','Lima');












