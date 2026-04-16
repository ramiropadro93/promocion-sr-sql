# Ejercicio SQL Server - Promoción Sr

## Descripción
Este script crea una base de datos con una tabla para guardar imágenes en formato binario, inserta dos imágenes desde archivos locales y genera un backup de la base.

---

## Qué hace el script
1. Crea la base de datos `DB_Promocion_Sr`
2. Crea la tabla `Imagenes` con:
   - Descripción
   - Contenido binario (`VARBINARY`)
3. Inserta dos imágenes desde el disco
4. Muestra el tamaño en bytes de cada imagen para validar que se cargaron bien
5. Genera un backup de la base

---

## Requisitos
- SQL Server instalado
- Tener dos imágenes en tu máquina

---

## Importante
Antes de ejecutar, modificar las rutas de las imágenes en el script:

```sql
BULK 'C:\...\Imagenes\archivo.png'
