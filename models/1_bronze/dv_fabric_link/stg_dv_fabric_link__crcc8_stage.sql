with 

source as (

    select * from {{ source('dv_fabric_link', 'crcc8_stage') }}

),

renamed as (

    select
        [crcc8_name]
        ,[crcc8_stageid]
        ,[Id]
        ,[SinkCreatedOn]
        ,[SinkModifiedOn]
        ,[statecode]
        ,[statuscode]
        ,[createdby]
        ,[createdby_entitytype]4
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
        ,[ownerid]
        ,[ownerid_entitytype]
        ,[crcc8_level]
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
        ,[vn_begin]
        ,[vn_stagetracker]
        ,[IsDelete]
        ,[PartitionId]
    from source

)

select * from renamed
