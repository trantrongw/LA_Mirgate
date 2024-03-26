SELECT
Id,
[crcc8_name] AS Code
from
{{ ref('stg_dv_fabric_link__crcc8_transactiontype') }}
Where [IsDelete] is null