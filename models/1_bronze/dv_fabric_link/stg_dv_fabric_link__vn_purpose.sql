with 

source as (

    select * from {{ source('dv_fabric_link', 'vn_purpose') }}

),

renamed as (

    select
        [Id]
        ,[SinkCreatedOn]
        ,[SinkModifiedOn]
        ,[statecode]
        ,[statuscode]
        ,[createdby]
        ,[createdby_entitytype]
        ,[createdonbehalfby]
        ,[createdonbehalfby_entitytype]
        ,[modifiedby]
        ,[modifiedby_entitytype]
        ,[modifiedonbehalfby]
        ,[modifiedonbehalfby_entitytype]
        ,[owningbusinessunit]
        ,[owningbusinessunit_entitytype]
        ,[owningteam]
        ,[owningteam_entitytype]
        ,[owninguser]
        ,[owninguser_entitytype]
        ,[vn_transactiontype_id]
        ,[vn_transactiontype_id_entitytype]
        ,[ownerid]
        ,[ownerid_entitytype]
        ,[createdbyname]
        ,[createdbyyominame]
        ,[createdon]
        ,[createdonbehalfbyname]
        ,[createdonbehalfbyyominame]
        ,[importsequencenumber]
        ,[modifiedbyname]
        ,[modifiedbyyominame]
        ,[modifiedon]
        ,[modifiedonbehalfbyname]
        ,[modifiedonbehalfbyyominame]
        ,[overriddencreatedon]
        ,[owneridname]
        ,[owneridtype]
        ,[owneridyominame]
        ,[owningbusinessunitname]
        ,[timezoneruleversionnumber]
        ,[utcconversiontimezonecode]
        ,[versionnumber]
        ,[vn_name]
        ,[vn_purposeid]
        ,[vn_transactiontype_idname]
        ,[IsDelete]
        ,[PartitionId]
    from source

)

select * from renamed
