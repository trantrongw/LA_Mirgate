with 

source as (

    select * from {{ source('common', 'Stage_Transactiontype_Link') }}

),

renamed as (

    select
        *
    from source

)

select * from renamed
