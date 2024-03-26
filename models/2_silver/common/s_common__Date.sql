
select 
    *,
    [YYYYMM]=CAST(FORMAT([Date],'yyyyMM') AS int)
from {{ ref('stg_common__Date') }}
