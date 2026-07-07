insert into central.clientes (nombre, ciudad, email, telefono) values
('maria alvarado', 'quevedo', 'maria@uteq.edu.ec', '0991111111'),
('luis cedeno', 'babahoyo', 'luis@uteq.edu.ec', '0992222222'),
('ana vera', 'quevedo', 'ana@uteq.edu.ec', '0993333333'),
('jose mendoza', 'ventanas', 'jose@uteq.edu.ec', '0994444444'),
('carla zambrano', 'ventanas', 'carla@uteq.edu.ec', '0995555555'),
('pedro suarez', 'babahoyo', 'pedro@uteq.edu.ec', '0996666666');

insert into central.productos (nombre, categoria, precio) values
('cafe negro', 'bebida', 0.75),
('cafe con leche', 'bebida', 1.00),
('sanduche pollo', 'comida', 2.50),
('jugo natural', 'bebida', 1.25),
('empanada', 'comida', 1.00);

insert into central.pedidos (cliente_id, producto_id, fecha, monto, sede) values
(1, 1, '2026-03-01', 0.75, 'campus'),
(2, 3, '2026-03-01', 2.50, 'babahoyo'),
(3, 2, '2026-03-02', 1.00, 'campus'),
(4, 4, '2026-03-02', 1.25, 'ventanas'),
(5, 5, '2026-03-03', 1.00, 'ventanas'),
(6, 1, '2026-03-03', 0.75, 'babahoyo'),
(1, 3, '2026-03-04', 2.50, 'campus'),
(2, 2, '2026-03-04', 1.00, 'babahoyo');
