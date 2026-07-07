-- 1. completitud
select count(*) as filas_globales
from pedidos_global;

-- 2. reconstruccion horizontal
select sede, sum(monto) as total
from pedidos_global
group by sede;

-- 3. disjuncion
select pedido_id, count(*) as veces
from pedidos_global
group by pedido_id
having count(*) > 1;

-- 4. reconstruccion vertical
select count(*) as clientes_reconstruidos
from clientes_global;

-- 5. clientes reconstruidos
select *
from clientes_global;
