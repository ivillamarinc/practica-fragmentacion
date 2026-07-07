create extension if not exists postgres_fdw;

drop view if exists pedidos_global;
drop view if exists clientes_global;

drop foreign table if exists pedidos_babahoyo;
drop foreign table if exists pedidos_ventanas;
drop foreign table if exists clientes_contacto_remoto;

drop server if exists srv_babahoyo cascade;
drop server if exists srv_ventanas cascade;

create server srv_babahoyo
foreign data wrapper postgres_fdw
options (host 'pg-babahoyo', dbname 'cafeteria', port '5432');

create server srv_ventanas
foreign data wrapper postgres_fdw
options (host 'pg-ventanas', dbname 'cafeteria', port '5432');

create user mapping for admin
server srv_babahoyo
options (user 'admin', password 'admin123');

create user mapping for admin
server srv_ventanas
options (user 'admin', password 'admin123');

create foreign table pedidos_babahoyo (
  pedido_id integer,
  cliente_id integer,
  producto_id integer,
  fecha date,
  monto numeric(8,2),
  sede varchar(20)
)
server srv_babahoyo
options (table_name 'pedidos');

create foreign table pedidos_ventanas (
  pedido_id integer,
  cliente_id integer,
  producto_id integer,
  fecha date,
  monto numeric(8,2),
  sede varchar(20)
)
server srv_ventanas
options (table_name 'pedidos');

create foreign table clientes_contacto_remoto (
  cliente_id integer,
  email varchar(120),
  telefono varchar(20)
)
server srv_babahoyo
options (table_name 'clientes_contacto');

create view pedidos_global as
select * from pedidos
union all
select * from pedidos_babahoyo
union all
select * from pedidos_ventanas;

create view clientes_global as
select 
  p.cliente_id,
  p.nombre,
  p.ciudad,
  c.email,
  c.telefono
from clientes_publicos p
join clientes_contacto_remoto c
on p.cliente_id = c.cliente_id;
