with 

source as (
    select
    *
    , ROW_NUMBER () OVER (PARTITION BY [vn_opportunitydate] ORDER BY [vn_opportunitydate]  DESC ) AS RN
from
    {{ ref('ref_tracker_tranform') }}
),
result as (
    select
    *
    from
    source
    where RN = 1
)
select * from result
