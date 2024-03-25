Select 
    [User Id]=[vn_userid],
    [Opportunity Id]=[vn_opportunityid]
from
{{ ref('stg_dv_fabric_link__vn_assignuseropps') }}
Where [IsDelete] is null 
and [vn_userid] is not null
and [vn_opportunityid] is not null
group by [vn_userid],
    [vn_opportunityid]