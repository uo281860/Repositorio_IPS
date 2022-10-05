
drop table reserva;  
drop table actividadlimitada; 
drop table actividad;  
drop table utiliza; 
drop table socio; 
drop table tipoactividad;
drop table recurso;

create table recurso(rc_nombre VARCHAR(20) not null, rc_cantidad DECIMAL(3,0), CONSTRAINT PK_RECURSOS PRIMARY KEY (rc_nombre), CONSTRAINT RC_CANTIDAD CHECK (rc_cantidad > 0));
create table tipoactividad(ta_nombre VARCHAR(20) not null, ta_intensidad VARCHAR(5) not null, CONSTRAINT PK_TIPOACTIVIDAD PRIMARY KEY (ta_nombre), CONSTRAINT TA_INTENSIDAD CHECK (ta_intensidad IN ('alta', 'media', 'baja'));
create table socio(s_id NUMBER, s_nombre VARCHAR(20) not null, CONSTRAINT PK_SOCIO PRIMARY KEY (s_id), CONSTRAINT S_ID CHECK (s_id > 0));
create table utiliza(rc_nombre VARCHAR(20) not null, ta_nombre VARCHAR(20) not null, CONSTRAINT PK_UTILIZA PRIMARY KEY (rc_nombre, ta_nombre), CONSTRAINT FK_UTILIZA_RECURSOS FOREIGN KEY (rc_nombre) REFERENCES RECURSOS (rc_nombre), CONSTRAINT FK_UTILIZA_TIPOACTIVIDAD FOREIGN KEY (ta_nombre) REFERENCES TIPOACTIVIDAD (ta_nombre));
create table actividad(a_id NUMBER, ta_nombre VARCHAR(20) not null, a_fecha TIMESTAMP not null, CONSTRAINT PK_ACTIVIDAD PRIMARY KEY (a_id), CONSTRAINT FK_ACTIVIDAD_TIPOACTIVIDAD FOREIGN KEY (ta_nombre) REFERENCES TIPOACTIVIDAD (ta_nombre), CONSTRAINT A_ID CHECK (a_id > 0), CONSTRAINT A_FECHA CHECK (a_fecha > NOW()));
create table actividadlimitada(a_id NUMBER not null, a_plazas DECIMAL(3,0), CONSTRAINT PK_ACTIVIDADLIMITADA PRIMARY KEY (a_id), CONSTRAINT FK_ACTIVIDADLIMITADA_ACTIVIDAD FOREIGN KEY (a_id) REFERENCES ACTIVIDAD (a_id), CONSTRAINT AL_PLAZAS CHECK (a_plazas > 0));
CREATE TABLE reserva(s_id NUMBER, a_id NUMBER, CONSTRAINT PK_RESERVA PRIMARY KEY (s_id, a_id), CONSTRAINT FK_RESERVA_SOCIO FOREIGN KEY (s_id) REFERENCES SOCIO (s_id), CONSTRAINT FK_RESERVA_ACTIVIDADLIMITADA FOREIGN KEY (a_id) REFERENCES ACTIVIDADLIMITADA (a_id), CONSTRAINT RE_S_ID CHECK (s_id > 0), CONSTRAINT RE_A_ID CHECK (a_id > 0));
