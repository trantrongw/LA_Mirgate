WITH RN
AS
(
    Select 
    [Id],
    [vn_name] ,
    cast([vn_amount] as int) as [vn_amount],
    ROW_NUMBER ( ) OVER (  ORDER BY [vn_amount] ASC)  as RN1,
    ROW_NUMBER ( ) OVER (  ORDER BY [vn_amount] ASC)-1  as RN2
    from
    {{ ref('stg_dv_fabric_link__vn_tier') }}
Where [IsDelete] is null
)
SELECT 
    [Tier Id]=A.[Id],
    [Tier]=A.[vn_name], 
    [Min Value] = A.[vn_amount], 
    [Max Value] =ISNULL(B.[vn_amount], 2147483647)
FROM RN A 
LEFT JOIN RN B ON A.RN1 = B.RN2
