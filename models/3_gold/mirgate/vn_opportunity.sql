SELECT 
    A.*,
    --ref
    [vn_stage]=B.Id,
    [vn_purposeid]=C.Id,
    [vn_crcc8_TransactionType]=D.Id,
    [vn_referrer]=E.Id,
    [vn_state]=F.Id,
    --migrate
    [vn_migratedate] = GETDATE(),
    [vn_migratecode]= A.FileName

FROM {{ ref('ref_tracker_dedup') }} A
LEFT JOIN {{ ref('s_dv_fabric_link__crcc8_stage') }} B ON A.StageCode = B.Import_Code
LEFT JOIN {{ ref('s_dv_fabric_link__vn_purpose') }} C ON A.PurposeCode = C.Code
LEFT JOIN {{ ref('s_dv_fabric_link__crcc8_transactiontype') }} D ON A.TransactionCode = D.Code
LEFT JOIN {{ ref('s_dv_fabric_link__vn_referrer') }} E ON A.ReferrerCode = E.Code
LEFT JOIN {{ ref('s_dv_fabric_link__vn_state') }} F ON A.StateCode = F.Code

--Where FileName = 'RT Tracker Opps + Lodged 1RT.xlsm'
