Select 
Id,
[vn_name] as Code
from
{{ ref('stg_dv_fabric_link__vn_referrer') }} 
Where [IsDelete] is null