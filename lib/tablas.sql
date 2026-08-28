CREATE DATABASE universidad_db;
USE universidad_db;

CREATE TABLE materias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    codigo VARCHAR(10) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    creditos INT NOT NULL,
    profesor VARCHAR(100) NOT NULL,
    horario VARCHAR(100) NOT NULL,
    aula VARCHAR(50) NOT NULL
);

INSERT INTO materias (codigo, nombre, creditos, profesor, horario, aula) VALUES
('MAT101', 'Algoritmos y Programación', 4, 'Ing. Carlos Mendoza', 'Lunes y Miércoles 08:00 - 10:00', 'Laboratorio 302'),
('MAT102', 'Bases de Datos Relacionales', 3, 'Dra. Elena Gómez', 'Martes y Jueves 10:00 - 12:00', 'Aula 104'),
('MAT103', 'Desarrollo Web Frontend', 4, 'Mg. Andrés Ramírez', 'Viernes 14:00 - 18:00', 'Laboratorio 201');