PRACTICA: FRAGMENTACION DE BASE DE DATOS DISTRIBUIDA

1. LEVANTAR LOS CONTENEDORES

Desde la carpeta principal del proyecto ejecutar:

docker compose up -d

Verificar que los contenedores esten activos:

docker compose ps

Deben aparecer los siguientes nodos:

pg-campus     puerto 5433
pg-babahoyo   puerto 5434
pg-ventanas   puerto 5435


2. EJECUTAR ESQUEMA CENTRALIZADO

Get-Content .\sql\01_esquema_central.sql | docker exec -i pg-campus psql -U admin -d cafeteria


3. INSERTAR DATOS DE PRUEBA

Get-Content .\sql\02_datos.sql | docker exec -i pg-campus psql -U admin -d cafeteria


4. EJECUTAR FRAGMENTACION HORIZONTAL

Get-Content .\sql\03_fragmentacion_horizontal.sql | docker exec -i pg-campus psql -U admin -d cafeteria

Get-Content .\sql\03_fragmentacion_horizontal.sql | docker exec -i pg-babahoyo psql -U admin -d cafeteria

Get-Content .\sql\03_fragmentacion_horizontal.sql | docker exec -i pg-ventanas psql -U admin -d cafeteria

Verificar en cada nodo:

docker exec -it pg-campus psql -U admin -d cafeteria
SELECT * FROM pedidos;
\q

docker exec -it pg-babahoyo psql -U admin -d cafeteria
SELECT * FROM pedidos;
\q

docker exec -it pg-ventanas psql -U admin -d cafeteria
SELECT * FROM pedidos;
\q


5. EJECUTAR FRAGMENTACION VERTICAL

Get-Content .\sql\04_fragmentacion_vertical.sql | docker exec -i pg-campus psql -U admin -d cafeteria

Get-Content .\sql\04_fragmentacion_vertical.sql | docker exec -i pg-babahoyo psql -U admin -d cafeteria

Verificar:

docker exec -it pg-campus psql -U admin -d cafeteria
SELECT * FROM clientes_publicos;
\q

docker exec -it pg-babahoyo psql -U admin -d cafeteria
SELECT * FROM clientes_contacto;
\q


6. EJECUTAR FRAGMENTACION MIXTA

Get-Content .\sql\05_fragmentacion_mixta.sql | docker exec -i pg-campus psql -U admin -d cafeteria

Get-Content .\sql\05_fragmentacion_mixta.sql | docker exec -i pg-babahoyo psql -U admin -d cafeteria

Get-Content .\sql\05_fragmentacion_mixta.sql | docker exec -i pg-ventanas psql -U admin -d cafeteria

Verificar:

docker exec -it pg-campus psql -U admin -d cafeteria
SELECT * FROM clientes_quevedo_publicos;
\q

docker exec -it pg-babahoyo psql -U admin -d cafeteria
SELECT * FROM clientes_contacto_mixto;
\q

docker exec -it pg-ventanas psql -U admin -d cafeteria
SELECT * FROM clientes_otros_publicos;
\q


7. CREAR VISTAS GLOBALES

Get-Content .\sql\06_vistas_globales.sql | docker exec -i pg-campus psql -U admin -d cafeteria

Verificar:

docker exec -it pg-campus psql -U admin -d cafeteria

SELECT * FROM pedidos_global;

SELECT * FROM clientes_global;

SELECT sede, SUM(monto) AS total
FROM pedidos_global
GROUP BY sede;

\q


8. VERIFICACION FINAL

Get-Content .\sql\07_verificacion.sql | docker exec -i pg-campus psql -U admin -d cafeteria

Resultados esperados:

filas_globales = 8

Totales por sede:
campus = 4.25
babahoyo = 4.25
ventanas = 2.25

Disjuncion:
Debe salir 0 rows, porque ningun pedido esta repetido.

clientes_reconstruidos = 6


9. COMANDOS UTILES

Entrar a un nodo:

docker exec -it pg-campus psql -U admin -d cafeteria

Salir de PostgreSQL:

\q

Apagar los contenedores:

docker compose down

Volver a levantar:

docker compose up -d