Select 
[Id] AS Id,
[vn_statename] as Code
from
{{ ref('stg_dv_fabric_link__vn_state') }}
Where [IsDelete] is null