with 

source as (

    select * from {{ source('dv_fabric_link', 'crcc8_stage') }}

),

renamed as (

    select
        *
    from source

)

select * from renamed
