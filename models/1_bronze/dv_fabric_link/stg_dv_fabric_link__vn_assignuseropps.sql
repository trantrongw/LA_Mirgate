with 

source as (

    select * from {{ source('dv_fabric_link', 'vn_assignuseropps') }}

),

renamed as (

    select
        *
    from source

)

select * from renamed
