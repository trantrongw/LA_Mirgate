with 

source as (

    select * from {{ source('common', 'Date') }}

),

renamed as (

    select
        *
    from source

)

select * from renamed
