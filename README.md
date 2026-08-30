# T-SQL Practice — AdventureWorksDW

Ejercicios de T-SQL practicados sobre la base de datos de ejemplo AdventureWorksDW2025 
de Microsoft, como parte de mi preparación para mi rol de Junior BI Operations Administrator.

## Base de datos utilizada

Los ejercicios usan **AdventureWorksDW**, la base de datos de ejemplo oficial de Microsoft 
(esquema de Data Warehouse con tablas de hechos y dimensiones en Star Schema).

📥 Descarga oficial: [AdventureWorks Sample Databases](https://learn.microsoft.com/en-us/sql/samples/adventureworks-install-configure)

Para restaurarla en SQL Server Management Studio (SSMS):
1. Descargá el archivo `.bak` correspondiente a tu versión de SQL Server
2. En SSMS: clic derecho en "Databases" → Restore Database → Device → 
   seleccioná el archivo `.bak` descargado

## Ejercicios

### 01 - Productos por encima del promedio de su categoría

**Desafío:** encontrar los productos cuyo total de ventas supera el promedio de ventas 
de su propia categoría de producto (no el promedio general de todos los productos, 
sino el de su categoría específica).

**Tablas involucradas:** `FactInternetSales`, `DimProduct`, `DimProductSubcategory`, `DimProductCategory`

**Conceptos aplicados:** INNER JOIN con 4 tablas encadenadas, subqueries en el FROM, 
funciones de agregación (SUM, AVG), GROUP BY en múltiples niveles.

[Ver query](./01-productos-sobre-promedio-categoria.sql)
