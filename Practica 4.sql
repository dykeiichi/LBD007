USE Ferreteria
GO

insert into Sucursal (ID_Sucursal, Nombre, Calle, Numero_Exterior, Telefono)  values (1, 'Pro One', 'Av. Fresnos', 500, 83120967)
insert into Sucursal (ID_Sucursal, Nombre, Calle, Numero_Exterior, Telefono)  values (2, 'El pueblo', 'Caartagena', 342, 83746398)
insert into Sucursal (ID_Sucursal, Nombre, Calle, Numero_Exterior, Numero_Interior, Telefono)  values (3, 'Horizonte', 'Barragan', 9023, 3, 98364758)
insert into Sucursal (ID_Sucursal, Nombre, Calle, Numero_Exterior, Numero_Interior, Telefono) values (4, 'Camara', 'Almazan', 304, 1, 93847639)
insert into Sucursal (ID_Sucursal, Nombre, Calle, Numero_Exterior, Numero_Interior, Telefono) values (5, 'Mariano', 'Sendero', 506, 2, 85764958)

insert into Caja (ID_Caja, Numero, ID_Sucursal_FK) values (1, 1, 1)
insert into Caja (ID_Caja, Numero, ID_Sucursal_FK) values (2, 1, 2)
insert into Caja (ID_Caja, Numero, ID_Sucursal_FK) values (3, 2, 2)

insert into Cliente (ID_Cliente, Nombre, ApellidoPaterno, ApellidoMaterno, Calle, Numero_Exterior, Numero_Interior) values (1, 'Mario', 'Martinez', 'Alvarado', 'Las Petunias', 506, 1)
insert into Cliente (ID_Cliente, Nombre, ApellidoPaterno, ApellidoMaterno, Calle, Numero_Exterior, Numero_Interior) values (2, 'Ana Luisa', 'Gonzales', 'Sierra', 'Uranio', 239, 3)
insert into Cliente (ID_Cliente, Nombre, ApellidoPaterno, ApellidoMaterno, Calle, Numero_Exterior, Numero_Interior) values (3, 'Roman', 'Garza', 'Mata', 'Revolucion', 234, 2)
insert into Cliente (ID_Cliente, Nombre, ApellidoPaterno, ApellidoMaterno, Calle, Numero_Exterior, Numero_Interior) values (4, 'Rocio', 'Martinez', 'Morales', 'Jacarandas', 256, 5)
insert into Cliente (ID_Cliente, Nombre, ApellidoPaterno, ApellidoMaterno, Calle, Numero_Exterior, Numero_Interior) values (5, 'Roman', 'Garza', 'Mata', 'Revolucion', 234, 2)


insert into Ticket values (1, 1, 5, 450, 522, Convert(binary(50), 0293849 , 1) , '2016-02-22')
insert into Ticket values (2, 3, 7, 150, 174, Convert(binary(50), 09876 , 1) , '2016-02-23')
insert into Ticket values (3, 1, 2, 400, 464, Convert(binary(50), 3776282 , 1) , '2016-02-24')

insert into Factura values (1, 3, 2)
insert into Factura values (3, 2, 1)
insert into Factura values (2, 1, 3)

insert into Proveedor values (1, 'Grupo Sigma', '2017-10-12', 'Descripcion')
insert into Proveedor values (2, 'AC', '2013-12-4', 'Descripcion 2')
insert into Proveedor values (3, 'Sitgma patito', '2002-1-12', 'Descripcion 3')
insert into Proveedor values (4, 'Mario y Asociados', '2000-1-13', 'Descripcion 4')

insert into Producto values (1, 1, 'Yoplait', 5)
insert into Producto values (2, 2, 'Coca-cola 2.5L', 25)
insert into Producto values (3, 2, 'Barrilito Durazno 600ml', 12)

insert into ID_Inventario values (1, 1, 1, 1)
insert into ID_Inventario values (2, 3, 3, 1)
insert into ID_Inventario values (3, 2, 2, 1)

delete from Sucursal where Nombre = 'Mariano'
delete from Sucursal where ID_Sucursal = 4
delete from Cliente where Nombre = 'Rocio' AND ApellidoPaterno = 'Martinez' AND ApellidoMaterno = 'Morales'
delete from Cliente where ID_Cliente = 5
delete from Proveedor where ID_Proveedor = 4

update Caja set ID_Caja = 3 from Caja where ID_Caja = 4
update Producto set Precio = 6 from Producto where Nombre = 'Yoplait'
update Proveedor set Nombre = 'Sigma 2' from Proveedor where Nombre = 'Sitgma patito'
update ID_Inventario set ID_Sucursal_FK = 3 from ID_Inventario where ID_Inventario = 3
update Proveedor set Nombre = 'Arca Continental' from Proveedor where Nombre = 'AC'

select * from Sucursal
select * from Caja
select * from Cliente
select * from Ticket
select * from Factura
select * from Proveedor
select * from Producto
select * from ID_Inventario