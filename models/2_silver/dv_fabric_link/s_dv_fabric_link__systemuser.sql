select
    [User Id]=[systemuserid],
    [Email]=[internalemailaddress],
    [Broker Code]=vn_code,
    [Is Broker]=ws_loanwriter,
    [State]=vn_statename
from 
{{ ref('stg_dv_fabric_link__systemuser') }}
