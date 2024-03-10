Select 
T.Id,
T.[vn_name] as Code
from
{{ ref('stg_dv_fabric_link__vn_purpose') }} T
Where [IsDelete] is null