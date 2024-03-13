Select 
[Id],
[Amount]=[vn_amount],
[Opportunity Date]=cast([vn_createddate] as Date) ,
[Lodged Date]=[vn_lodgeddate],
[StageId] = vn_stage
from
{{ ref('stg_dv_fabric_link__vn_opportunity') }}
Where [IsDelete] is null