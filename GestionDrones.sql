--Creacion de tablas

create table DRON (
   DRON_ID              INT4                 not null,
   DRON_FECHAOPERACION  DATE                 null,
   constraint PK_DRON primary key (DRON_ID)
);

create table DRON_GRABACION (
   DRON_GRAB            INT4                 not null,
   DRON_ID              INT4                 not null,
   DRON_TIEMPOGRABHORAST INT4                 null,
   constraint PK_DRON_GRABACION primary key (DRON_GRAB)
);

create table DRON_TIEMPO (
   DRONTIME_ID          INT4                 not null,
   DRON_ID              INT4                 not null,
   DRONTIME_TIEMPODIA   INT4                 null,
   DRONTIME_TIEMPOTOTAL INT4                 not null,
   constraint PK_DRON_TIEMPO primary key (DRONTIME_ID)
);


create table EMPLEADO (
   EMPLEADO_ID          INT4                 not null,
   EMPLEADO_NOMBRE      CHAR(15)             null,
   EMPLEADO_APELLIDO    CHAR(15)             null,
   EMPLEADO_CI          CHAR(20)             null,
   constraint PK_EMPLEADO primary key (EMPLEADO_ID)
);

create table EMPLEADO_OPERADOR (
   EMPLOPERAD_ID        INT4                 not null,
   EMPLEADO_ID          INT4                 not null,
   DRON_ID              INT4                 not null,
   EMPLOPERAD_TIEMPOMANEJO INT4                 null,
   constraint PK_EMPLEADO_OPERADOR primary key (EMPLOPERAD_ID)
);


create table EMPLEADO_TECNICO (
   TEC_ID               INT4                 not null,
   EMPLEADO_ID          INT4                 not null,
   constraint PK_EMPLEADO_TECNICO primary key (TEC_ID)
);

create table PROVEEDOR (
   PROV_ID              INT4                 not null,
   PROV_NOMBRE          CHAR(30)             null,
   constraint PK_PROVEEDOR primary key (PROV_ID)
);

create table REPARACION_DRON (
   REPDRON_ID           INT4                 not null,
   DRON_ID              INT4                 not null,
   PRODUCT_ID           INT4                 not null,
   TEC_ID               INT4                 not null,
   REPDRON_FECHA        DATE                 null,
   constraint PK_REPARACION_DRON primary key (REPDRON_ID)
);

create table REPARACION_REPORTE (
   REPORTE_ID           INT4                 not null,
   REPDRON_ID           INT4                 not null,
   REPORTE_COMENTARIO   CHAR(30)             null,
   constraint PK_REPARACION_REPORTE primary key (REPORTE_ID)
);


create table REPUESTO (
   PRODUCT_ID           INT4                 not null,
   PROV_ID              INT4                 not null,
   PRODUCT_FECHA        DATE                 null,
   PRODUCT_NOMBRE       CHAR(20)             null,
   constraint PK_REPUESTO primary key (PRODUCT_ID)
);


alter table DRON_GRABACION
   add constraint FK_DRON_GRA_GRABA_DRON foreign key (DRON_ID)
      references DRON (DRON_ID)
      on delete restrict on update restrict;

alter table DRON_TIEMPO
   add constraint FK_DRON_TIE_A_DRON foreign key (DRON_ID)
      references DRON (DRON_ID)
      on delete restrict on update restrict;

alter table EMPLEADO_OPERADOR
   add constraint FK_EMPLEADO_CONTIENE_DRON foreign key (DRON_ID)
      references DRON (DRON_ID)
      on delete restrict on update restrict;

alter table EMPLEADO_OPERADOR
   add constraint FK_EMPLEADO_DISPONE_EMPLEADO foreign key (EMPLEADO_ID)
      references EMPLEADO (EMPLEADO_ID)
      on delete restrict on update restrict;

alter table EMPLEADO_TECNICO
   add constraint FK_EMPLEADO_TIENE_EMPLEADO foreign key (EMPLEADO_ID)
      references EMPLEADO (EMPLEADO_ID)
      on delete restrict on update restrict;

alter table REPARACION_DRON
   add constraint FK_REPARACI_HACE_EMPLEADO foreign key (TEC_ID)
      references EMPLEADO_TECNICO (TEC_ID)
      on delete restrict on update restrict;

alter table REPARACION_DRON
   add constraint FK_REPARACI_POSEE_DRON foreign key (DRON_ID)
      references DRON (DRON_ID)
      on delete restrict on update restrict;

alter table REPARACION_DRON
   add constraint FK_REPARACI_VA_REPUESTO foreign key (PRODUCT_ID)
      references REPUESTO (PRODUCT_ID)
      on delete restrict on update restrict;

alter table REPARACION_REPORTE
   add constraint FK_REPARACI_GENERA_REPARACI foreign key (REPDRON_ID)
      references REPARACION_DRON (REPDRON_ID)
      on delete restrict on update restrict;

alter table REPUESTO
   add constraint FK_REPUESTO_DA_PROVEEDO foreign key (PROV_ID)
      references PROVEEDOR (PROV_ID)
      on delete restrict on update restrict;

-Inserccion de datos
insert into DRON (DRON_ID, DRON_FECHAOPERACION) values (1, '31/8/2019');
insert into DRON (DRON_ID, DRON_FECHAOPERACION) values (2, '8/5/2019');
insert into DRON (DRON_ID, DRON_FECHAOPERACION) values (3, '19/6/2019');
insert into DRON (DRON_ID, DRON_FECHAOPERACION) values (4, '20/7/2019');
insert into DRON (DRON_ID, DRON_FECHAOPERACION) values (5, '26/3/2020');
insert into DRON (DRON_ID, DRON_FECHAOPERACION) values (6, '9/4/2020');
insert into DRON (DRON_ID, DRON_FECHAOPERACION) values (7, '15/11/2019');
insert into DRON (DRON_ID, DRON_FECHAOPERACION) values (8, '21/10/2020');
insert into DRON (DRON_ID, DRON_FECHAOPERACION) values (9, '26/11/2020');
insert into DRON (DRON_ID, DRON_FECHAOPERACION) values (10, '2/12/2020');

insert into DRON_GRABACION (DRON_GRAB, DRON_ID, DRON_TIEMPOGRABHORAST) values (1, 1, 37);
insert into DRON_GRABACION (DRON_GRAB, DRON_ID, DRON_TIEMPOGRABHORAST) values (2, 2, 38);
insert into DRON_GRABACION (DRON_GRAB, DRON_ID, DRON_TIEMPOGRABHORAST) values (3, 3, 41);
insert into DRON_GRABACION (DRON_GRAB, DRON_ID, DRON_TIEMPOGRABHORAST) values (4, 4, 49);
insert into DRON_GRABACION (DRON_GRAB, DRON_ID, DRON_TIEMPOGRABHORAST) values (5, 5, 14);
insert into DRON_GRABACION (DRON_GRAB, DRON_ID, DRON_TIEMPOGRABHORAST) values (6, 6, 2);
insert into DRON_GRABACION (DRON_GRAB, DRON_ID, DRON_TIEMPOGRABHORAST) values (7, 7, 38);
insert into DRON_GRABACION (DRON_GRAB, DRON_ID, DRON_TIEMPOGRABHORAST) values (8, 8, 30);
insert into DRON_GRABACION (DRON_GRAB, DRON_ID, DRON_TIEMPOGRABHORAST) values (9, 9, 49);
insert into DRON_GRABACION (DRON_GRAB, DRON_ID, DRON_TIEMPOGRABHORAST) values (10, 10, 18);

insert into DRON_TIEMPO (DRONTIME_ID, DRON_ID, DRONTIME_TIEMPODIA,  DRONTIME_TIEMPOTOTAL) values (1, 1, 16, 55);
insert into DRON_TIEMPO (DRONTIME_ID, DRON_ID, DRONTIME_TIEMPODIA,  DRONTIME_TIEMPOTOTAL) values (2, 2, 14, 104);
insert into DRON_TIEMPO (DRONTIME_ID, DRON_ID, DRONTIME_TIEMPODIA,  DRONTIME_TIEMPOTOTAL) values (3, 3, 16, 11);
insert into DRON_TIEMPO (DRONTIME_ID, DRON_ID, DRONTIME_TIEMPODIA,  DRONTIME_TIEMPOTOTAL) values (4, 4, 17, 137);
insert into DRON_TIEMPO (DRONTIME_ID, DRON_ID, DRONTIME_TIEMPODIA,  DRONTIME_TIEMPOTOTAL) values (5, 5, 20, 130);
insert into DRON_TIEMPO (DRONTIME_ID, DRON_ID, DRONTIME_TIEMPODIA,  DRONTIME_TIEMPOTOTAL) values (6, 6, 12, 34);
insert into DRON_TIEMPO (DRONTIME_ID, DRON_ID, DRONTIME_TIEMPODIA,  DRONTIME_TIEMPOTOTAL) values (7, 7, 11, 68);
insert into DRON_TIEMPO (DRONTIME_ID, DRON_ID, DRONTIME_TIEMPODIA,  DRONTIME_TIEMPOTOTAL) values (8, 8, 17, 65);
insert into DRON_TIEMPO (DRONTIME_ID, DRON_ID, DRONTIME_TIEMPODIA,  DRONTIME_TIEMPOTOTAL) values (9, 9, 20, 59);
insert into DRON_TIEMPO (DRONTIME_ID, DRON_ID, DRONTIME_TIEMPODIA,  DRONTIME_TIEMPOTOTAL) values (10, 10, 10, 113);

insert into EMPLEADO (EMPLEADO_ID, EMPLEADO_NOMBRE, EMPLEADO_APELLIDO,  EMPLEADO_CI) values (1, 'Sybila', 'Josephsen', '960130159');
insert into EMPLEADO (EMPLEADO_ID, EMPLEADO_NOMBRE, EMPLEADO_APELLIDO,  EMPLEADO_CI) values (2, 'Janka', 'De Dantesie', '387630051');
insert into EMPLEADO (EMPLEADO_ID, EMPLEADO_NOMBRE, EMPLEADO_APELLIDO,  EMPLEADO_CI) values (3, 'Daria', 'Allott', '649415419');
insert into EMPLEADO (EMPLEADO_ID, EMPLEADO_NOMBRE, EMPLEADO_APELLIDO,  EMPLEADO_CI) values (4, 'Rora', 'Bumpus', '542587183');
insert into EMPLEADO (EMPLEADO_ID, EMPLEADO_NOMBRE, EMPLEADO_APELLIDO,  EMPLEADO_CI) values (5, 'Alberto', 'Dermot', '821822775');
insert into EMPLEADO (EMPLEADO_ID, EMPLEADO_NOMBRE, EMPLEADO_APELLIDO,  EMPLEADO_CI) values (6, 'Michal', 'Gallie', '921166324');
insert into EMPLEADO (EMPLEADO_ID, EMPLEADO_NOMBRE, EMPLEADO_APELLIDO,  EMPLEADO_CI) values (7, 'Ofelia', 'Darrigrand', '782408796');
insert into EMPLEADO (EMPLEADO_ID, EMPLEADO_NOMBRE, EMPLEADO_APELLIDO,  EMPLEADO_CI) values (8, 'Nickolas', 'Seabrocke', '347035428');
insert into EMPLEADO (EMPLEADO_ID, EMPLEADO_NOMBRE, EMPLEADO_APELLIDO,  EMPLEADO_CI) values (9, 'Gustavo', 'Butlin', '877525560');
insert into EMPLEADO (EMPLEADO_ID, EMPLEADO_NOMBRE, EMPLEADO_APELLIDO,  EMPLEADO_CI) values (10, 'Annaliese', 'Sarjeant', '257557948');

insert into EMPLEADO_OPERADOR (EMPLOPERAD_ID,EMPLEADO_ID, DRON_ID, EMPLOPERAD_TIEMPOMANEJO) values (1,1, 1, 130);
insert into EMPLEADO_OPERADOR (EMPLOPERAD_ID,EMPLEADO_ID, DRON_ID, EMPLOPERAD_TIEMPOMANEJO) values (2,2, 2, 26);
insert into EMPLEADO_OPERADOR (EMPLOPERAD_ID,EMPLEADO_ID, DRON_ID, EMPLOPERAD_TIEMPOMANEJO) values (3,3, 3, 22);
insert into EMPLEADO_OPERADOR (EMPLOPERAD_ID,EMPLEADO_ID, DRON_ID, EMPLOPERAD_TIEMPOMANEJO) values (4,4, 4, 105);
insert into EMPLEADO_OPERADOR (EMPLOPERAD_ID,EMPLEADO_ID, DRON_ID, EMPLOPERAD_TIEMPOMANEJO) values (5,5, 5, 54);
insert into EMPLEADO_OPERADOR (EMPLOPERAD_ID,EMPLEADO_ID, DRON_ID, EMPLOPERAD_TIEMPOMANEJO) values (6,6, 6, 119);

insert into PROVEEDOR (PROV_ID, PROV_NOMBRE) values (1, 'Electrical Products');
insert into PROVEEDOR (PROV_ID, PROV_NOMBRE) values (2, 'Retail: Computer Software');
insert into PROVEEDOR (PROV_ID, PROV_NOMBRE) values (3, 'Electrical Products');
insert into PROVEEDOR (PROV_ID, PROV_NOMBRE) values (4, 'Power Generation');

insert into REPUESTO (PRODUCT_ID, PROV_ID, PRODUCT_FECHA, PRODUCT_NOMBRE) values (1, 1, '24/9/2020', 'Bateria');
insert into REPUESTO (PRODUCT_ID, PROV_ID, PRODUCT_FECHA, PRODUCT_NOMBRE) values (2, 3, '30/6/2019', 'Helices');
insert into REPUESTO (PRODUCT_ID, PROV_ID, PRODUCT_FECHA, PRODUCT_NOMBRE) values (3, 1, '13/11/2020', 'Camara');
insert into REPUESTO (PRODUCT_ID, PROV_ID, PRODUCT_FECHA, PRODUCT_NOMBRE) values (4, 4, '15/3/2019', 'Cargador');
insert into REPUESTO (PRODUCT_ID, PROV_ID, PRODUCT_FECHA, PRODUCT_NOMBRE) values (5, 2, '2/7/2020', 'GPS');
insert into REPUESTO (PRODUCT_ID, PROV_ID, PRODUCT_FECHA, PRODUCT_NOMBRE) values (6, 4, '12/3/2019', 'Cables');
insert into REPUESTO (PRODUCT_ID, PROV_ID, PRODUCT_FECHA, PRODUCT_NOMBRE) values (7, 2, '11/4/2020', 'Control');

insert into EMPLEADO_TECNICO (TEC_ID, EMPLEADO_ID) values (1, 7);
insert into EMPLEADO_TECNICO (TEC_ID, EMPLEADO_ID) values (2, 8);
insert into EMPLEADO_TECNICO (TEC_ID, EMPLEADO_ID) values (3, 9);
insert into EMPLEADO_TECNICO (TEC_ID, EMPLEADO_ID) values (4, 10);


insert into REPARACION_DRON (REPDRON_ID, DRON_ID , PRODUCT_ID, TEC_ID, REPDRON_FECHA   ) values (1, 7, 2, 1, '8/3/2020');
insert into REPARACION_DRON (REPDRON_ID, DRON_ID , PRODUCT_ID, TEC_ID, REPDRON_FECHA   ) values (2, 8, 3, 2, '14/5/2019');
insert into REPARACION_DRON (REPDRON_ID, DRON_ID , PRODUCT_ID, TEC_ID, REPDRON_FECHA   ) values (3, 10, 4, 3, '15/6/2019');
insert into REPARACION_DRON (REPDRON_ID, DRON_ID , PRODUCT_ID, TEC_ID, REPDRON_FECHA   ) values (4, 9, 2, 4, '5/5/2020');

insert into REPARACION_REPORTE (REPORTE_ID, REPDRON_ID, REPORTE_COMENTARIO) values (1, 1, 'Error solucionado');
insert into REPARACION_REPORTE (REPORTE_ID, REPDRON_ID, REPORTE_COMENTARIO) values (2, 2, 'Repuesto no encontrado');
insert into REPARACION_REPORTE (REPORTE_ID, REPDRON_ID, REPORTE_COMENTARIO) values (3, 3, 'Sin solucion');
insert into REPARACION_REPORTE (REPORTE_ID, REPDRON_ID, REPORTE_COMENTARIO) values (4, 4, 'Aun en revision');

--Consultas realizadas

--Cuáles son los drones con más de 50 horas totales activas.

SELECT dron_id,
	   drontime_tiempototal
FROM dron_tiempo
where drontime_tiempototal >= '50'

--Consultar cuantas veces se uso el repuesto de “hélices” al momento de realizar un mantenimiento.

SELECT
repuesto.product_id,
repuesto.product_nombre,
count(reparacion_dron.repdron_id) as cantidad
from reparacion_dron
inner join public.repuesto on repuesto.product_id=reparacion_dron.product_id
where repuesto.product_id = '2'
group by repuesto.product_id,
repuesto.product_nombre

--Mostrar los mantenimientos de drones que fueron realizadas en el año 2019 y cuantas se generaron por cada día  

SELECT
reparacion_dron.repdron_id,
count(reparacion_dron.repdron_fecha) as num_reparaciones,
reparacion_dron.repdron_fecha
from reparacion_dron
where (reparacion_dron.repdron_fecha >= '1/1/2019' and reparacion_dron.repdron_fecha <='31/12/2019')
group by reparacion_dron.repdron_id,reparacion_dron.repdron_fecha


--Mostrar el nombre del empleado con sus horas totales de manejo de dron con el id=1 para el dron con el id=1

SELECT
empleado.empleado_id,
dron.dron_id,
empleado.empleado_nombre,
empleado.empleado_apellido,
empleado.empleado_ci,
empleado_operador.emploperad_tiempomanejo
from empleado_operador
INNER JOIN PUBLIC.empleado on empleado.empleado_id = empleado_operador.emploperad_id
INNER JOIN PUBLIC.dron on dron.dron_id = empleado_operador.dron_id
where empleado.empleado_id = 1 and dron.dron_id = 1
