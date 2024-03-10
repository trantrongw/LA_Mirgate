
SELECT
Id,
[crcc8_name] AS Code
from
{{ ref('stg_dv_fabric_link__crcc8_stage') }}
Where [IsDelete] is null