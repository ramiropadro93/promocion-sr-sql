create database DB_Promocion_Sr;
go

use DB_Promocion_Sr;
go

create table Imagenes (
    Id int IDENTITY(1,1) primary key,
    Descripcion nvarchar(255) not null,
    Binario varbinary(MAX) not null
);
go

-- Fede: Modificá la ruta de los archivos según corresponda en tu sistema
insert into Imagenes (Descripcion, Binario)
select 'Imagen 1', BulkColumn
from OPENROWSET(
    BULK 'C:\Ramiro\Plan de carrera\Promocion Sr\SQL\Imagenes\gatito.png',
    SINGLE_BLOB
) as img;
go

insert into Imagenes (Descripcion, Binario)
select 'Imagen 2', BulkColumn
from OPENROWSET(
    BULK 'C:\Ramiro\Plan de carrera\Promocion Sr\SQL\Imagenes\perrito.png',
    SINGLE_BLOB
) as img;
go


select
    Id,
    Descripcion,
    DATALENGTH(Binario) AS TamañoBytes
from Imagenes;
go


backup database DB_Promocion_Sr
to disk = 'C:\Ramiro\Plan de carrera\Promocion Sr\SQL\DB_Promocion_Sr.bak';
go

-- Usar esto para restaurar la base de datos desde el backup

-- RESTORE DATABASE DB_Promocion_Sr_Restore
-- FROM DISK = 'C:\Ramiro\Plan de carrera\Promocion Sr\SQL\DB_Promocion_Sr.bak';

-- Usar esto para convertir representación de imagen en base 64: 

--SELECT CAST('' as xml).value(
--    'xs:base64Binary(sql:column("Binario"))',
--    'varchar(max)'
--)
--FROM Imagenes
--WHERE Id = 1;

-- Abrir https://base64.guru/converter/decode/image y pegar resultado de consulta anterior para visualizar imagen