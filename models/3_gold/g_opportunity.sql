SELECT 
    A.*,
    --ref
    [StageId]=B.Id,
    [PurposeId]=C.Id,
    [TransactionTypeId]=D.Id,
    [ReferrerId]=E.Id,
    [StateId]=F.Id,
    --migrate
    [Migrate Date] = cast('2024-03-10' as Date),
    [Migrate Code]= '2024_03_10_1'

FROM {{ ref('s_la_tracker__opportunity') }} A
JOIN {{ ref('s_dv_fabric_link__crcc8_stage') }} B ON A.StageCode = B.Code
JOIN {{ ref('s_dv_fabric_link__vn_purpose') }} C ON A.PurposeCode = C.Code
JOIN {{ ref('s_dv_fabric_link__crcc8_transactiontype') }} D ON A.TransactionCode = D.Code
JOIN {{ ref('s_dv_fabric_link__vn_referrer') }} E ON A.ReferrerCode = E.Code
JOIN {{ ref('s_dv_fabric_link__vn_state') }} F ON A.StateCode = F.Code

--Where FileName = 'RT Tracker Opps + Lodged 1RT.xlsm'
