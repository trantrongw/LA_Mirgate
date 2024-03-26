with 

source as (

    select * from {{ source('dv_fabric_link', 'systemuser') }}

),

renamed as (

    select
        *
    from source

)

select * from renamed
