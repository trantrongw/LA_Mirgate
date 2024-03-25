Select 
[Opportunity Id]=[Id],
[Opportunity Code]=[vn_opportunitycode],
[Amount]=[vn_amount],
--Calc
[Opportunity Date]=cast([vn_opportunitydate] as Date) ,
[Lodged Date]=cast([vn_lodgeddate] as Date) ,
[Stage days] = datediff(day,[vn_opportunitydate],getdate()),
--reference
[Stage Id] = vn_stage,
[TransactionType Id] = vn_crcc8_transactiontype
from
{{ ref('stg_dv_fabric_link__vn_opportunity') }}
Where [IsDelete] is null