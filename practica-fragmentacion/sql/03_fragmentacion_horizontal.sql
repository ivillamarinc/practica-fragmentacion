
-- fragmento campus


-- drop table if exists pedidos;

-- create table pedidos (
--   pedido_id integer primary key,
--   cliente_id integer not null,
--   producto_id integer not null,
--   fecha date not null,
--   monto numeric(8,2) not null,
--   sede varchar(20) not null
-- );

-- insert into pedidos values
-- (1, 1, 1, '2026-03-01', 0.75, 'campus'),
-- (3, 3, 2, '2026-03-02', 1.00, 'campus'),
-- (7, 1, 3, '2026-03-04', 2.50, 'campus');


-- fragmento babahoyo


-- drop table if exists pedidos;

-- create table pedidos (
--   pedido_id integer primary key,
--   cliente_id integer not null,
--   producto_id integer not null,
--   fecha date not null,
--   monto numeric(8,2) not null,
--   sede varchar(20) not null
-- );

-- insert into pedidos values
-- (2, 2, 3, '2026-03-01', 2.50, 'babahoyo'),
-- (6, 6, 1, '2026-03-03', 0.75, 'babahoyo'),
-- (8, 2, 2, '2026-03-04', 1.00, 'babahoyo');


-- fragmento ventanas

drop table if exists pedidos;

create table pedidos (
  pedido_id integer primary key,
  cliente_id integer not null,
  producto_id integer not null,
  fecha date not null,
  monto numeric(8,2) not null,
  sede varchar(20) not null
);

insert into pedidos values
(4, 4, 4, '2026-03-02', 1.25, 'ventanas'),
(5, 5, 5, '2026-03-03', 1.00, 'ventanas');
