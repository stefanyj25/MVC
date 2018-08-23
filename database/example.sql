CREATE DATABASE IF NOT EXISTS `scriptwebDB`;
USE `scriptwebDB`;

/*Tabla categorias definiciones*/
DROP TABLE IF EXISTS `categoriasdefiniciones`;
CREATE TABLE `categoriasdefiniciones` (
  `cod_categorias_definiciones` int(5) unsigned AUTO_INCREMENT NOT NULL,
  `nombre_categorias_definiciones` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `created_dc` TIMESTAMP NOT NULL,
  `updated_dc` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`cod_categorias_definiciones`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*Tabla Definiciones*/
DROP TABLE IF EXISTS `definiciones`;
CREATE TABLE `definiciones`(
  `cod_definiciones` int(5) unsigned AUTO_INCREMENT NOT NULL,
  `cod_categorias_definiciones` int(5) unsigned NOT NULL,
  `detalles_definiciones` TEXT COLLATE utf8_spanish_ci NOT NULL,
  `created_definiciones` TIMESTAMP NOT NULL,
  `updated_definiciones` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`cod_definiciones`),
  KEY `fkcodcategoriasdefiniciones_categoriasdefiniciones_idx` (`cod_categorias_definiciones`),
  CONSTRAINT `fkcodcategoriasdefiniciones_categoriasdefiniciones` FOREIGN KEY (`cod_categorias_definiciones`) REFERENCES `categoriasdefiniciones` (`cod_categorias_definiciones`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*Tabla Terminos*/
DROP TABLE IF EXISTS `terminos`;
CREATE TABLE `terminos`(
  `cod_terminos` int(5) unsigned AUTO_INCREMENT NOT NULL,
  `nombre_terminos` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `cod_definiciones` int(5) unsigned NOt NULL,
  `created_terminos` TIMESTAMP NOT NULL,
  `updated_terminos` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`cod_terminos`),
  KEY `fkcoddefiniciones_definiciones_idx` (`cod_definiciones`),
  CONSTRAINT `fkcoddefiniciones_definiciones` FOREIGN KEY (`cod_definiciones`) REFERENCES `definiciones` (`cod_definiciones`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`(
  `id_users` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `cod_tipo_users` int(5) unsigned NOT NULL,
  `cod_area_formacion` int(5) unsigned NOT NULL,
  `cod_area_conocimiento` int(5) unsigned NOT NULL,
  `nombre_users` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `gener_users` varchar(1) COLLATE utf8_spanish_ci NOT NULL,
  `anio_nac_users` int(4) unsigned NOT NULL,
  `mes_nac_users` int(2) unsigned NOT NULL,
  `dia_nac_users` int(2) unsigned NOT NULL,
  `cod_tipo_documento` int(5) unsigned NOT NULL,
  `documento_users` varchar(12) COLLATE utf8_spanish_ci NOT NULL,
  `correo_users` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `pass_users` varchar(128) COLLATE utf8_spanish_ci NOT NULL,
  `salt_users` varchar(128) COLLATE utf8_spanish_ci NOT NULL,
  `confirmar_users` varchar(128) COLLATE utf8_spanish_ci NOT NULL,
  `celular_users` varchar(16) COLLATE utf8_spanish_ci NOT NULL,
  `telefono_users` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `level_users` varchar(1) COLLATE utf8_spanish_ci NOT NULL DEFAULT'0',
  `cod_pais` int(5) unsigned NOT NULL,
  `cod_depart` int(5) unsigned NOT NULL,
  `cod_ciudad` int(5) unsigned NOT NULL,
  `cod_comuna` int(5) unsigned NOT NULL,
  `cod_corregimiento` int(5) unsigned NOT NULL,
  `cod_vereda` int(5) unsigned NOT NULL,
  `cod_barrio` int(5) unsigned NOT NULL,
  `direccion_users` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `created_users` TIMESTAMP NOT NULL,
  `update_users` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`id_users`),
KEY `fkcodtipousers_tipousuario_idx` (`cod_tipo_users`),
KEY `fkcodtipodocumento_tipodocumento_idx` (`cod_tipo_documento`),
KEY `fkcodareaformacion_areaformacion_idx` (`cod_area_formacion`),
KEY `fkcodareaconocimiento_areaconocimiento_idx` (`cod_area_conocimiento`),
KEY `fkcodpais_pais_idx` (`cod_pais`),
KEY `fkcoddepart_departamento_idx` (`cod_depart`),
KEY `fkcodciudad_ciudad_idx` (`cod_ciudad`),
KEY `fkcodcomuna_comuna_idx` (`cod_comuna`),
KEY `fkcodbarrio_barrio_idx` (`cod_barrio`),
KEY `fkcodcorregimiento_corregimiento_idx` (`cod_corregimiento`),
KEY `fkcodvereda_vereda_idx` (`cod_vereda`),
CONSTRAINT `fkcodtipousers_tipousuario` FOREIGN KEY (`cod_tipo_users`) REFERENCES `tipousuario` (`cod_tipo_users`) ON DELETE CASCADE ON UPDATE NO ACTION,
CONSTRAINT `fkcodtipodocumento_tipodocumento` FOREIGN KEY (`cod_tipo_documento`) REFERENCES `tipodocumento` (`cod_tipo_documento`) ON DELETE CASCADE ON UPDATE NO ACTION,
CONSTRAINT `fkcodareaformacion_areaformacion` FOREIGN KEY (`cod_area_formacion`) REFERENCES `areaformacion` (`cod_area_formacion`) ON DELETE CASCADE ON UPDATE NO ACTION,
CONSTRAINT `fkcodareaconocimiento_areaconocimiento` FOREIGN KEY (`cod_area_conocimiento`) REFERENCES `areaconocimiento` (`cod_area_conocimiento`) ON DELETE CASCADE ON UPDATE NO ACTION,
CONSTRAINT `fkcodpais_pais` FOREIGN KEY (`cod_pais`) REFERENCES `pais` (`cod_pais`) ON DELETE CASCADE ON UPDATE NO ACTION,
CONSTRAINT `fkcoddepart_departamento` FOREIGN KEY (`cod_depart`) REFERENCES `departamento` (`cod_depart`) ON DELETE CASCADE ON UPDATE NO ACTION,
CONSTRAINT `fkcodciudad_ciudad` FOREIGN KEY (`cod_ciudad`) REFERENCES `ciudad` (`cod_ciudad`) ON DELETE CASCADE ON UPDATE NO ACTION,
CONSTRAINT `fkcodcomuna_comuna` FOREIGN KEY (`cod_comuna`) REFERENCES `comuna` (`cod_comuna`) ON DELETE CASCADE ON UPDATE NO ACTION,
CONSTRAINT `fkcodbarrio_barrio` FOREIGN KEY (`cod_barrio`) REFERENCES `barrio` (`cod_barrio`) ON DELETE CASCADE ON UPDATE NO ACTION,
CONSTRAINT `fkcodcorregimiento_corregimiento` FOREIGN KEY (`cod_corregimiento`) REFERENCES `corregimiento` (`cod_corregimiento`) ON DELETE CASCADE ON UPDATE NO ACTION,
CONSTRAINT `fkcodvereda_vereda` FOREIGN KEY (`cod_vereda`) REFERENCES `vereda` (`cod_vereda`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*crear tabla tipo de usuarios*/
DROP TABLE IF EXISTS `tipousuario`;
CREATE TABLE `tipousuario` (
  `cod_tipo_users` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `nombre_tipo_users` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `created_tipo_users` TIMESTAMP NOT NULL,
  `update_tipo_users` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`cod_tipo_users`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*Tabla area de formacion*/
DROP TABLE IF EXISTS `areaformacion`;
CREATE TABLE `areaformacion` (
  `cod_area_formacion` int(5) unsigned AUTO_INCREMENT NOT NULL,
  `nombre_area_formacion` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `created_area_formacion` TIMESTAMP NOT NULL,
  `update_area_formacion` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`cod_area_formacion`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*Tabla de conocimiento*/
DROP TABLE IF EXISTS `areaconocimiento`;
CREATE TABLE `areaconocimiento` (
  `cod_area_conocimiento` int(5) unsigned AUTO_INCREMENT NOT NULL,
  `nombre_area_conocimiento` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `created_area_conocimiento` TIMESTAMP NOT NULL,
  `update_area_conocimiento` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`cod_area_conocimiento`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*crear tabla pais*/
DROP TABLE IF EXISTS `pais`;
CREATE TABLE `pais` (
  `cod_pais` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `nombre_pais` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `postal_pais` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `created_pais` TIMESTAMP NOT NULL,
  `update_pais` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`cod_pais`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*crear tabla departamento*/
DROP TABLE IF EXISTS `departamento`;
CREATE TABLE `departamento` (
  `cod_depart` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `cod_pais` int(5) unsigned NOT NULL,
  `nombre_depart` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `created_depart` TIMESTAMP NOT NULL,
  `update_depart` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`cod_depart`),
  KEY `fkcodpais_pais_idx` (`cod_pais`),
  CONSTRAINT `fkcodpais_pais` FOREIGN KEY (`cod_pais`) REFERENCES `pais` (`cod_pais`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*crear tabla comuna*/
DROP TABLE IF EXISTS `comuna`;
CREATE TABLE `comuna` (
  `cod_comuna` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `nombre_comuna` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `created_comuna` TIMESTAMP NOT NULL,
  `update_comuna` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`cod_comuna`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*crear tabla ciudad*/
DROP TABLE IF EXISTS `ciudad`;
CREATE TABLE `ciudad` (
  `cod_ciudad` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `cod_depart` int(5) unsigned NOT NULL,
  `nombre_cuidad` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `created_ciudad` TIMESTAMP NOT NULL,
  `update_ciudad` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`cod_ciudad`),
  KEY `fkcoddepart_departamento_idx` (`cod_depart`),
  CONSTRAINT `fkcoddepart_departamento` FOREIGN KEY (`cod_depart`) REFERENCES `departamento` (`cod_depart`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*tabla pivot comuna_ciudad*/
DROP TABLE IF EXISTS `comunaciudad`;
CREATE TABLE `comunaciudad` (
  `cod_comunaciudad` int(5) unsigned NULL AUTO_INCREMENT,
  `cod_comuna` int(5) unsigned NOT NULL,
  `cod_ciudad` int(5) unsigned NOT NULL,
  `created_cc` TIMESTAMP NOT NULL,
  `update_cc` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`cod_comunaciudad`),
  KEY `fkcodciudad_ciudad_idx` (`cod_ciudad`),
  KEY `fkcodcomuna_comuna_idx` (`cod_comuna`),
  CONSTRAINT `fkcodciudad_ciudad` FOREIGN KEY (`cod_ciudad`) REFERENCES `ciudad` (`cod_ciudad`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fkcodcomuna_comuna` FOREIGN KEY (`cod_comuna`) REFERENCES `comuna` (`cod_comuna`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*crear tabla corregimiento*/
DROP TABLE IF EXISTS `corregimiento`;
CREATE TABLE `corregimiento` (
  `cod_corregimiento` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `cod_ciudad` int(5) unsigned NOT NULL,
  `nombre_corregimiento` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `created_corregimiento` TIMESTAMP NOT NULL,
  `update_corregimiento` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`cod_corregimiento`),
  KEY `fkcodciudad_ciudad_idx` (`cod_ciudad`),
  CONSTRAINT `fkcodciudad_ciudad` FOREIGN KEY (`cod_ciudad`) REFERENCES `ciudad` (`cod_ciudad`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*crear tabla vereda*/
DROP TABLE IF EXISTS `vereda`;
CREATE TABLE `vereda` (
  `cod_vereda` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `cod_corregimiento` int(5) unsigned NOT NULL,
  `nombre_vereda` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `created_vereda` TIMESTAMP NOT NULL,
  `update_vereda` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`cod_vereda`),
  KEY `fkcodcorregimiento_corregimiento_idx` (`cod_corregimiento`),
  CONSTRAINT `fkcodcorregimiento_corregimiento` FOREIGN KEY (`cod_corregimiento`) REFERENCES `corregimiento` (`cod_corregimiento`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*crear tabla barrio*/
DROP TABLE IF EXISTS `barrio`;
CREATE TABLE `barrio` (
  `cod_barrio` int(5) unsigned  NOT NULL AUTO_INCREMENT,
  `cod_corregimiento` int(5) unsigned NOT NULL,
  `cod_comuna` int(5) unsigned NOT NULL,
  `nombre_barrio` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `created_barrio` TIMESTAMP NOT NULL,
  `update_barrio` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`cod_barrio`),
  KEY `fkcodcorregimiento_corregimiento_idx` (`cod_corregimiento`),
  CONSTRAINT `fkcodcorregimiento_corregimiento` FOREIGN KEY (`cod_corregimiento`) REFERENCES `corregimiento` (`cod_corregimiento`) ON DELETE CASCADE ON UPDATE NO ACTION,
  KEY `fkcodcomuna_comuna_idx` (`cod_comuna`),
  CONSTRAINT `fkcodcomuna_comuna` FOREIGN KEY (`cod_comuna`) REFERENCES `comuna` (`cod_comuna`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*crear tabla tipo de documento*/
DROP TABLE IF EXISTS `tipodocumento`;
CREATE TABLE `tipodocumento` (
  `cod_tipo_documento` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `nombre_tipo_documento` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `created_tipo_documento` TIMESTAMP NOT NULL,
  `update_tipo_documento` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`cod_tipo_documento`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*Tabla preguntas foro*/
DROP TABLE IF EXISTS `preguntasforo`;
CREATE TABLE `preguntasforo`(
  `cod_preg_foro` int(5) unsigned AUTO_INCREMENT NOT NULL,
  `cod_foro` int(5) unsigned NOT NULL,
  `pregunta_preg_foro` text(500) COLLATE utf8_spanish_ci NOT NULL,
  `id_users` int(12) unsigned NOT NULL,
  `created_preg_foro` TIMESTAMP NOT NULL,
  `update_preg_foro` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`cod_preg_foro`),
  KEY `fkcodforo_foro_idx` (`cod_foro`)
  CONSTRAINT `fkcodforo_foro` FOREIGN KEY (`cod_foro`) REFERENCES `foro` (`cod_foro`) ON DELETE CASCADE ON UPDATE NO ACTION,
  KEY `fkidusers_users_idx` (`id_users`)
  CONSTRAINT `fkidusers_users` FOREIGN KEY (`id_users`) REFERENCES `users` (`id_users`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*Tabla foro*/
DROP TABLE IF EXISTS `foro`;
CREATE TABLE `foro` (
  `cod_foro` int(5) unsigned AUTO_INCREMENT NOT NULL,
  `id_users` int(12) unsigned NOT NULL,
  `nombre_foro` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `cod_categorias_proyecto` int(5) unsigned NOT NULL,
  `cod_proyecto` int(5) unsigned NOT NULL,
  `created_foro` TIMESTAMP NOT NULL,
  `update_foro` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY(`cod_foro`),
  KEY `fkcodcategoriasproyectofo_categoriasproyecto_idx` (`cod_categorias_proyecto`),
  CONSTRAINT `fkcodcategoriasproyectofo_categoriaproyecto` FOREIGN KEY (`cod_categorias_proyecto`) REFERENCES `categoriasproyecto` (`cod_categorias_proyecto`) ON DELETE CASCADE ON UPDATE NO ACTION,
  KEY `fkcodproyectofo_proyecto_idx` (`cod_proyecto`),
  CONSTRAINT `fkcodproyectofo_proyecto` FOREIGN KEY (`cod_proyecto`) REFERENCES `proyecto` (`cod_proyecto`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*Tabla Proyecto users*/
DROP TABLE IF EXISTS `proyectousers`;
CREATE TABLE `proyectousers` (
  `cod_proyecto_users` int(5) unsigned AUTO_INCREMENT NOT NULL,
  `cod_proyecto` int(5) unsigned NOT NULL,
  `id_users` int(12) unsigned NOT NULL,
  `created_proyecto_users` TIMESTAMP NOT NULL,
  `update_proyecto_users` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`cod_proyecto_users`),
  KEY `fkcodproyecto_proyecto_idx` (`cod_proyecto`),
  CONSTRAINT `fkcodproyecto_proyecto` FOREIGN KEY (`cod_proyecto`) REFERENCES `proyecto` (`cod_proyecto`) ON DELETE CASCADE ON UPDATE NO ACTION,
  KEY `fkidusers_users_idx` (`id_users`),
  CONSTRAINT `fkidusers_users` FOREIGN KEY (`id_users`) REFERENCES `users` (`id_users`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*Tabla generar ideas*/
DROP TABLE IF EXISTS `ideas`;
CREATE TABLE `ideas` (
  `cod_idea` int(5) unsigned AUTO_INCREMENT NOT NULL,
  `id_users` int(12) unsigned NOT NULL,
  `titulo_idea` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `detalle_idea` TEXT COLLATE utf8_spanish_ci NOT NULL,
  `cod_categorias_proyecto` int(5) unsigned NOT NULL,
  `created_idea` TIMESTAMP NOT NULL,
  `update_idea` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`cod_idea`),
  KEY `fkcodcategoriasproyectoid_categoriasproyecto_idx` (`cod_categorias_proyecto`),
  CONSTRAINT `fkcodcategoriasproyectoid_categoriaproyecto` FOREIGN KEY (`cod_categorias_proyecto`) REFERENCES `categoriasproyecto` (`cod_categorias_proyecto`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*Tabla imagenes*/
DROP TABLE IF EXISTS `imagenes`;
CREATE TABLE `imagenes` (
  `cod_imagen` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `nombre_imagen` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `id_users` int(12) unsigned NOT NULL,
  `cod_proyecto` int(5) unsigned NOT NULL,
  `cod_idea` int(5) unsigned NOT NULL,
  `cod_imagen_categoria` int(5) unsigned NOT NULL,
  `created_imagen` TIMESTAMP NOT NULL,
  `update_imagen` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`cod_imagen`),
  KEY `fkidusers_users_idx` (`id_users`),
  CONSTRAINT `fkidusers_users` FOREIGN KEY (`id_users`) REFERENCES `users` (`id_users`) ON DELETE CASCADE ON UPDATE NO ACTION,
  KEY `fkcodproyecto_proyecto_idx` (`cod_proyecto`),
  CONSTRAINT `fkcodproyecto_proyecto` FOREIGN KEY (`cod_proyecto`) REFERENCES `proyecto` (`cod_proyecto`) ON DELETE CASCADE ON UPDATE NO ACTION,
  KEY `fkcodidea_ideas_idx` (`cod_idea`),
  CONSTRAINT `fkcodidea_ideas` FOREIGN KEY (`cod_idea`) REFERENCES `ideas` (`cod_idea`) ON DELETE CASCADE ON UPDATE NO ACTION,
  KEY `fkcodimagencategoria_imagencategoria_idx` (`cod_imagen_categoria`),
  CONSTRAINT `fkcodimagencategoria_imagencategoria` FOREIGN KEY (`cod_imagen_categoria`) REFERENCES `imagen_categoria` (`cod_imagen_categoria`) ON DELETE CASCADE ON UPDATE NO ACTION
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*Tabla imagen_categoria*/
DROP TABLE IF EXISTS `imagencategoria`;
CREATE TABLE `imagencategoria` (
  `cod_imagen_categoria` int (5) unsigned NOT NULL AUTO_INCREMENT,
  `nombre_imagen_categoria` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `created_imagen_categoria` TIMESTAMP NOT NULL,
  `update_imagen_categoria` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`cod_imagen_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*tabla proyecto*/
DROP TABLE IF EXISTS `proyecto`;
CREATE TABLE `proyecto` (
  `cod_proyecto` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `nombre_proyecto` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `cod_categorias_proyecto` int(5) unsigned NOT NULL,
  `cod_idea` int(5) unsigned NOT NULL,
  `cod_estado_proyecto` int(5) unsigned NOT NULL,
  `progreso_proyecto` varchar(5) COLLATE utf8_spanish_ci NOT NULL,
  `cod_fases_proyecto` int(5) unsigned NOT NULL,
  `created_proyecto` TIMESTAMP NOT NULL,
  `update_proyecto` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`cod_proyecto`),
  KEY `fkcodcategoriasproyectopro_categoriasproyecto_idx` (`cod_categorias_proyecto`),
  CONSTRAINT `fkcodcategoriasproyectopro_categoriasproyecto` FOREIGN KEY (`cod_categorias_proyecto`) REFERENCES `categoriasproyecto` (`cod_categorias_proyecto`) ON DELETE CASCADE ON UPDATE NO ACTION,
  KEY `fkcodideapro_ideas_idx` (`cod_idea`),
  CONSTRAINT `fkcodideapro_ideas` FOREIGN KEY (`cod_idea`) REFERENCES `ideas` (`cod_idea`) ON DELETE CASCADE ON UPDATE NO ACTION,
  KEY `fkcodestadoproyectopro_estado_idx` (`cod_estado_proyecto`),
  CONSTRAINT `fkcodestadoproyectopro_estado` FOREIGN KEY (`cod_estado_proyecto`) REFERENCES `estadoproyecto` (`cod_estado_proyecto`) ON DELETE CASCADE ON UPDATE NO ACTION,
  KEY `fkcodfasesproyectopro_fases_idx` (`cod_fases_proyecto`),
  CONSTRAINT `fkcodfasesproyectopro_fases` FOREIGN KEY (`cod_fases_proyecto`) REFERENCES `fasesproyecto` (`cod_fases_proyecto`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*Tabla Categorias Proyecto*/
DROP TABLE IF EXISTS `categoriasproyecto`;
CREATE TABLE `categoriasproyecto` (
  `cod_categorias_proyecto` int(5) unsigned AUTO_INCREMENT NOT NULL,
  `nombre_categorias_proyecto` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `created_categorias_proyecto` TIMESTAMP NOT NULL,
  `update_categorias_proyecto` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY(`cod_categorias_proyecto`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*Tabla Descripcion proyecto*/
DROP TABLE IF EXISTS `descripcionproyecto`;
CREATE TABLE `descripcionproyecto`(
  `cod_descripcion_proyecto` int(5) unsigned AUTO_INCREMENT NOT NULL,
  `cod_proyecto` int(5) unsigned NOT NULL,
  `text_descripcion_proyecto` TEXT COLLATE utf8_spanish_ci NOT NULL,
  `created_descripcion_proyecto` TIMESTAMP NOT NULL,
  `update_descripcion_proyecto` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`cod_descripcion_proyecto`),
  KEY `fkcodproyecto_proyecto_idx` (`cod_proyecto`),
  CONSTRAINT `fkcodproyecto_proyecto` FOREIGN KEY (`cod_proyecto`) REFERENCES `proyecto` (`cod_proyecto`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


/*Tabla Estado*/
DROP TABLE IF EXISTS `estadoproyecto`;
CREATE TABLE `estadoproyecto` (
  `cod_estado_proyecto` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `nombre_estado_proyecto` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `created_estado_proyecto` TIMESTAMP NOT NULL,
  `update_estado_proyecto` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`cod_estado_proyecto`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*Tablas fases*/
DROP TABLE IF EXISTS `fasesproyecto`;
CREATE TABLE `fasesproyecto` (
  `cod_fases_proyecto` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `nombre_fase_proyecto` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `duracion_fase_proyecto` varchar(5) COLLATE utf8_spanish_ci NOT NULL,
  `created_fase_proyecto` TIMESTAMP NOT NULL,
  `update_fase_proyecto` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`cod_fases_proyecto`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*Tabla clases*/
DROP TABLE IF EXISTS `clases`;
CREATE TABLE `clases`(
  `cod_clase` int(5) unsigned AUTO_INCREMENT NOT NULL,
  `cod_categorias_clases` int(5) unsigned NOT NULL,
  `nombre_clase` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `created_clases` TIMESTAMP NOT NULL,
  `update_clases` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`cod_clase`),
  KEY `fkcodcategoriasclases_categoriasclases_idx` (`cod_categorias_clases`),
  CONSTRAINT `fkcodcategoriasclases_categoriasclases` FOREIGN KEY (`cod_categorias_clases`) REFERENCES `categoriasclases` (`cod_categorias_clases`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*Tabla Categorias Clases*/
DROP TABLE IF EXISTS `categoriasclases`;
CREATE TABLE `categoriasclases`(
  `cod_categorias_clases` int(5) unsigned AUTO_INCREMENT NOT NULL,
  `nombre_categorias_clases` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `created_categorias_clases` TIMESTAMP NOT NULL,
  `update_categorias_clases` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`cod_categorias_clases`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*Proyecto clases*/
DROP TABLE IF EXISTS `proyectoclases`;
CREATE TABLE `proyectoclases`(
  `cod_proyecto_clase` int(5) unsigned AUTO_INCREMENT NOT NULL,
  `cod_proyecto` int(5) unsigned NOT NULL,
  `cod_clase` int(5) unsigned NOT NULL,
  `created_proyecto_clases` TIMESTAMP NOT NULL,
  `update_proyecto_clases` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`cod_proyecto_clase`),
  KEY `fkcodproyectocl_proyecto_idx` (`cod_proyecto`),
  CONSTRAINT `fkcodproyectocl_proyecto` FOREIGN KEY (`cod_proyecto`) REFERENCES `proyecto` (`cod_proyecto`) ON DELETE CASCADE ON UPDATE NO ACTION,
  KEY `fkcodclasecl_clases_idx` (`cod_clase`),
  CONSTRAINT `fkcodclasecl_clases` FOREIGN KEY (`cod_clase`) REFERENCES `clases` (`cod_clase`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*Tabla subdominios*/
DROP TABLE IF EXISTS `subdominios`;
CREATE TABLE `subdominios` (
  `cod_subdominio` int(5) unsigned AUTO_INCREMENT NOT NULL,
  `url_subdominios` text(300) COLLATE utf8_spanish_ci NOT NULL,
  `cod_proyecto` int(5) unsigned NOT NULL,
  `created_subdominios` TIMESTAMP NOT NULL,
  `update_subdominios` TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`cod_subdominio`),
  KEY `fcodproyectosu_proyecto_idx` (`cod_proyecto`),
  CONSTRAINT `fkcodproyectosu_proyecto` FOREIGN KEY (`cod_proyecto`) REFERENCES `proyecto` (`cod_proyecto`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
