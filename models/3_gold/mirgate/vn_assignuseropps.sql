SELECT 
    --ref
    [vn_opportunityid]=B.[Id],
    [vn_userid]=C.[Id],
    [vn_departmentid]='e821389b-68ea-ee11-a1fd-000d3acba793',
    --migrate
    [vn_migratedate] = GETDATE(),
    [vn_migratecode]= A.FileName

FROM {{ ref('ref_tracker_dedup') }} A 
INNER JOIN {{ ref('stg_dv_fabric_link__vn_opportunity') }} B ON A.[vn_opportunitycode] = B.[vn_opportunitycode]
INNER JOIN {{ ref('stg_dv_fabric_link__systemuser') }} C ON A.[UserCode] = C.[vn_code]