select f.[ProductKey], ps.[SpanishProductSubcategoryName], pc.[SpanishProductCategoryName], SUM(f.[SalesAmount]) AS 'totalVentas'
from [dbo].[FactInternetSales] f
INNER JOIN [dbo].[DimProduct] p
ON f.[ProductKey] = p.[ProductKey]
INNER JOIN [dbo].[DimProductSubcategory] ps
ON p.[ProductSubcategoryKey] = ps.[ProductSubcategoryKey] 
INNER JOIN [DimProductCategory] pc
ON ps.[ProductCategoryKey]  = pc.[ProductCategoryKey] 
Group by f.ProductKey, ps.[SpanishProductSubcategoryName], pc.[SpanishProductCategoryName]

select AVG(f.[SalesAmount]) AS 'Prom x Cat',  pc.[SpanishProductCategoryName]
from [dbo].[FactInternetSales] f
INNER JOIN [dbo].[DimProduct] p
ON f.[ProductKey] = p.[ProductKey]
INNER JOIN [dbo].[DimProductSubcategory] ps
ON p.[ProductSubcategoryKey] = ps.[ProductSubcategoryKey] 
INNER JOIN [DimProductCategory] pc
ON ps.[ProductCategoryKey]  = pc.[ProductCategoryKey] 

Group by  pc.[SpanishProductCategoryName]

SELECT 
    TP.ProductKey,
    TP.SpanishProductCategoryName,
    TP.TotalPorProducto,
    Prom.PromedioCategoria
FROM (
    SELECT f.[ProductKey], pc.[SpanishProductCategoryName], SUM(f.[SalesAmount]) AS TotalPorProducto
    FROM [dbo].[FactInternetSales] f
    INNER JOIN [dbo].[DimProduct] p ON f.[ProductKey] = p.[ProductKey]
    INNER JOIN [dbo].[DimProductSubcategory] ps ON p.[ProductSubcategoryKey] = ps.[ProductSubcategoryKey]
    INNER JOIN [DimProductCategory] pc ON ps.[ProductCategoryKey] = pc.[ProductCategoryKey]
    GROUP BY f.[ProductKey], pc.[SpanishProductCategoryName]
) AS TP
INNER JOIN (
    SELECT Sub.[SpanishProductCategoryName], AVG(Sub.TotalPorProducto) AS PromedioCategoria
    FROM (
        SELECT f.[ProductKey], pc.[SpanishProductCategoryName], SUM(f.[SalesAmount]) AS TotalPorProducto
        FROM [dbo].[FactInternetSales] f
        INNER JOIN [dbo].[DimProduct] p ON f.[ProductKey] = p.[ProductKey]
        INNER JOIN [dbo].[DimProductSubcategory] ps ON p.[ProductSubcategoryKey] = ps.[ProductSubcategoryKey]
        INNER JOIN [DimProductCategory] pc ON ps.[ProductCategoryKey] = pc.[ProductCategoryKey]
        GROUP BY f.[ProductKey], pc.[SpanishProductCategoryName]
    ) AS Sub
    GROUP BY Sub.[SpanishProductCategoryName]
) AS Prom
ON TP.SpanishProductCategoryName = Prom.SpanishProductCategoryName
WHERE TP.TotalPorProducto > Prom.PromedioCategoria
ORDER BY TP.SpanishProductCategoryName, TP.TotalPorProducto DESC





--relaciones --> dimproductsubcategory productcatgeroykey

--dimproductCategory productcategorykey
--factinternetsales -> porudct key con dim product product key
--dimproduct productKey
