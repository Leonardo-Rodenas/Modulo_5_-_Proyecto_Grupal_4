-- Parte 1: Crear entorno de trabajo

-- Crear una base de datos (y usarla)
CREATE DATABASE Ejercicio_grupal_4;
USE Ejercicio_grupal_4; 

-- Crear un usuario con todos los privilegios para trabajar con la base de datos recién creada.
CREATE USER "hero_app"@"localhost" IDENTIFIED BY "hero_1234";
GRANT ALL PRIVILEGES ON Ejercicio_grupal_4.* TO "hero_app"@"localhost";
FLUSH PRIVILEGES;

-- Parte 2: Crear dos tablas.

-- La primera almacena a los usuarios de la aplicación (id_usuario, nombre, apellido, contraseña, zona horaria (por defecto UTC-3), género y teléfono de contacto).
CREATE TABLE usuarios (
  id_usuario INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(20),
  apellido VARCHAR(20),
  contrasena VARCHAR(20),
  zona_horaria VARCHAR(50) DEFAULT "UTC-3",
  genero VARCHAR(10),
  telefono_contacto VARCHAR(20)
);

-- La segunda tabla almacena información relacionada a la fecha-hora de ingreso de los usuarios a la plataforma (id_ingreso, id_usuario y la fecha-hora de ingreso (por defecto la fecha-hora actual)).
CREATE TABLE ingresos (
  id_ingreso INT PRIMARY KEY AUTO_INCREMENT,
  id_usuario INT,
  fecha_hora_ingreso DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Parte 3: Modificación de la tabla

-- Modifique el UTC por defecto. Desde UTC-3 a UTC-2.
ALTER TABLE usuarios ALTER COLUMN zona_horaria SET DEFAULT "UTC-2";

-- Parte 4: Creación de registros.

-- Para cada tabla crea 8 registros.

-- Insertar registros en la tabla usuarios
INSERT INTO usuarios (nombre, apellido, contraseña, género, telefono_contacto) VALUES
	("Steve", "Rogers", "4america_cap", "Masculino", "9 46513278"),
    ("Antony", "Stark", "i_am_ironman23", "Masculino", "9 581425556"),
    ("Bruce", "Banner", "hulk_smash4568", "Masculino", "9 11557896"),
	("Peter", "Parker", "im_not_spiderman332", "Masculino", "9 11894758"),
    ("Sue", "Storm", "invicible_4F", "Femenino", "9 44224431"),
	("Nastacha", "Romanov", "widow_black23rt", "Femenino", "9 668915668"),
	("Jennifer", "Walters", "green_is_cool789", "Femenino", "9 48592644"),
	("Wanda", "Maximoff", "the_witch_1234", "Femenino", "9 78456666");

-- Insertar registros en la tabla ingresos
INSERT INTO ingresos (id_ingreso, id_usuario) VALUES 
	(1, 1),
        (2, 2),
	(3, 3),
	(4, 4),
	(5, 5),
	(6, 6),
    	(7, 7),
	(8, 8);

-- Parte 5: Justifique cada tipo de dato utilizado. ¿Es el óptimo en cada caso?

-- Parte 6: Creen una nueva tabla llamada Contactos (id_contacto, id_usuario, numero de telefono, correo electronico).
CREATE TABLE contactos (
  id_contacto INT PRIMARY KEY AUTO_INCREMENT,
  id_usuario INT,
  numero_telefono VARCHAR(20),
  correo_electronico VARCHAR(100)
);

-- Parte 7: Modifique la columna teléfono de contacto, para crear un vínculo entre la tabla Usuarios y la tabla Contactos.

-- Añadir columna id_contacto en la tabla Usuarios
ALTER TABLE usuarios ADD COLUMN id_contacto INT;

-- Crear relación de clave foránea entre Usuarios y Contactos
ALTER TABLE usuarios ADD CONSTRAINT fk_contacto FOREIGN KEY (id_contacto) REFERENCES contactos(id_contacto);

-- El ejercicio debe ser subido a github y al Nodo Virtual
