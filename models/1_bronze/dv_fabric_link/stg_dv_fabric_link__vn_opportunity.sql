with 

source as (

    select * from {{ source('dv_fabric_link', 'vn_opportunity') }}

),

renamed as (

    select
        *
    from source

)

select * from renamed
