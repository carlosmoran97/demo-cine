-- Table: public.clasificacion

-- DROP TABLE public.clasificacion;

CREATE TABLE public.clasificacion
(
    id_clasificacion integer NOT NULL DEFAULT nextval('clasificacion_id_clasificacion_seq'::regclass),
    codigo "char" NOT NULL,
    descripcion character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT clasificacion_pkey PRIMARY KEY (id_clasificacion),
    CONSTRAINT unique_codigo UNIQUE (codigo)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.clasificacion
    OWNER to postgres;

-- Table: public.pelicula

-- DROP TABLE public.pelicula;

CREATE TABLE public.pelicula
(
    id_pelicula integer NOT NULL DEFAULT nextval('pelicula_id_pelicula_seq'::regclass),
    nombre character varying(100) COLLATE pg_catalog."default" NOT NULL,
    sinopsis character varying(1024) COLLATE pg_catalog."default" NOT NULL,
    id_clasificacion integer NOT NULL,
    CONSTRAINT pelicula_pkey PRIMARY KEY (id_pelicula),
    CONSTRAINT fk_clasificacion_pelicula FOREIGN KEY (id_clasificacion)
        REFERENCES public.clasificacion (id_clasificacion) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.pelicula
    OWNER to postgres;


-- Table: public.complejo

-- DROP TABLE public.complejo;

CREATE TABLE public.complejo
(
    id_complejo integer NOT NULL DEFAULT nextval('complejo_id_complejo_seq'::regclass),
    municipio character varying COLLATE pg_catalog."default" NOT NULL,
    centro_comercial character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT complejo_pkey PRIMARY KEY (id_complejo)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.complejo
    OWNER to postgres;


-- Table: public.funcion

-- DROP TABLE public.funcion;

CREATE TABLE public.funcion
(
    id_funcion integer NOT NULL DEFAULT nextval('funcion_id_funcion_seq'::regclass),
    id_pelicula integer NOT NULL,
    id_complejo integer NOT NULL,
    fecha date NOT NULL,
    hora time without time zone NOT NULL,
    formato character varying COLLATE pg_catalog."default" NOT NULL,
    idioma character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT funcion_pkey PRIMARY KEY (id_funcion),
    CONSTRAINT fk_complejo_funcion FOREIGN KEY (id_complejo)
        REFERENCES public.complejo (id_complejo) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_pelicula_funcion FOREIGN KEY (id_pelicula)
        REFERENCES public.pelicula (id_pelicula) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.funcion
    OWNER to postgres;