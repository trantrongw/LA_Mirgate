
select 
    [Stage Id]=vn_stage,
    [TransactionType Id]=vn_transactiontypeid,
    [Min Yellow]=[Yellow],
    [Max Red]=[Red]
from {{ ref('stg_common__Stage_Transactiontype_Link') }}
