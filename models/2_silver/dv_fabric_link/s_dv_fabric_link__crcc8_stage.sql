
SELECT
Id,
[crcc8_name] AS Code,
concat([crcc8_level],'. ',[crcc8_name]) AS Import_Code,
cast(crcc8_level as int) AS [Stage Level]
from
{{ ref('stg_dv_fabric_link__crcc8_stage') }}
Where [IsDelete] is null