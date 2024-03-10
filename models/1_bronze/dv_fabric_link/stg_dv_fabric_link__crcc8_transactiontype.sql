with 

source as (

    select * from {{ source('dv_fabric_link', 'crcc8_transactiontype') }}

),

renamed as (

    select
        *
    from source

)

select * from renamed
