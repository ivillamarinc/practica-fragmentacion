create schema if not exists central;

create table central.clientes (
  cliente_id serial primary key,
  nombre varchar(80) not null,
  ciudad varchar(40) not null,
  email varchar(120) not null,
  telefono varchar(20)
);

create table central.productos (
  producto_id serial primary key,
  nombre varchar(80) not null,
  categoria varchar(30) not null,
  precio numeric(6,2) not null
);

create table central.pedidos (
  pedido_id serial primary key,
  cliente_id integer not null references central.clientes(cliente_id),
  producto_id integer not null references central.productos(producto_id),
  fecha date not null,
  monto numeric(8,2) not null,
  sede varchar(20) not null
);

