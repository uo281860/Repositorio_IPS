INSERT INTO RECURSO (rc_nombre, rc_cantidad) VALUES ('esterillas', 20), ('bicis', 15);
INSERT INTO TIPOACTIVIDAD (ta_nombre, ta_intensidad) VALUES ('yoga', 'media'), ('pilates', 'baja'), ('bicicleta', 'alta');
INSERT INTO SOCIO (s_id, s_nombre) VALUES (1, 'Pedro'), (2, 'Marcos'), (3, 'Mario');
INSERT INTO UTILIZA (rc_nombre, ta_nombre) VALUES ('esterillas', 'yoga'), ('bicis', 'bicicleta');
INSERT INTO ACTIVIDAD(a_id, ta_nombre, a_dia, a_hora) VALUES (1, 'pilates', '2022-10-19', 10), (2, 'yoga', '2022-10-19', 11), (3, 'bicicleta', '2022-10-19', 12);
INSERT INTO ACTIVIDADLIMITADA(a_id, a_plazas) VALUES (2, 20), (3, 15);
INSERT INTO RESERVA(s_id, a_id) VALUES (1, 1), (2, 2), (3, 3);