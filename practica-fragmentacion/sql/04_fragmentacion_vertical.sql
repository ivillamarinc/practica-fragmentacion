
-- fragmentacion vertical - clientes publicos


-- drop table if exists clientes_publicos;

-- create table clientes_publicos (
--   cliente_id integer primary key,
--   nombre varchar(80) not null,
--   ciudad varchar(40) not null
-- );

-- insert into clientes_publicos values
-- (1, 'maria alvarado', 'quevedo'),
-- (2, 'luis cedeno', 'babahoyo'),
-- (3, 'ana vera', 'quevedo'),
-- (4, 'jose mendoza', 'ventanas'),
-- (5, 'carla zambrano', 'ventanas'),
-- (6, 'pedro suarez', 'babahoyo');



-- fragmentacion vertical - clientes contacto


drop table if exists clientes_contacto;

create table clientes_contacto (
  cliente_id integer primary key,
  email varchar(120) not null,
  telefono varchar(20)
);

insert into clientes_contacto values
(1, 'maria@uteq.edu.ec', '0991111111'),
(2, 'luis@uteq.edu.ec', '0992222222'),
(3, 'ana@uteq.edu.ec', '0993333333'),
(4, 'jose@uteq.edu.ec', '0994444444'),
(5, 'carla@uteq.edu.ec', '0995555555'),
(6, 'pedro@uteq.edu.ec', '0996666666');
