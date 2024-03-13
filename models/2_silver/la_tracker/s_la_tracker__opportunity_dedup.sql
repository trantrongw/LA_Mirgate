with 

source as (
    select
    *
    , ROW_NUMBER () OVER (PARTITION BY [vn_opportunitycode] ORDER BY [crcc8_opportunitydate]  DESC ) AS RN
from
    {{ ref('s_la_tracker__opportunity_tranform') }}
),
result as (
    select
    *
    from
    source
    where RN = 1
)
select * from result
