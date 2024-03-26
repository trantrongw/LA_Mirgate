with 

source as (

    select * from {{ source('dv_fabric_link', 'vn_tier') }}

),

renamed as (

    select
        *
    from source

)

select * from renamed
