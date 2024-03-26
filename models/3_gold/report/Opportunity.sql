 SELECT
    A.[Opportunity Id],
    A.[Opportunity Code],
    A.Amount,
    A.[Opportunity Date],
    A.[Lodged Date],
    A.[Proposed Date],
    A.[Stage days],
    A.[Purpose],
    A.[Stage],
    [Stage Sort]=D.[Stage Level],
    A.[Transaction Type],
    A.[State],
    --cal
    C.[Status],
    B.[Tier],
    [Tier Sort] = B.[Min Value]
from {{ ref('s_dv_fabric_link__vn_opportunity') }} A
INNER JOIN {{ ref('s_dv_fabric_link__crcc8_stage') }} D ON A.[Stage Id] = D.Id
OUTER APPLY 
(
    SELECT TOP 1 T.[Tier],T.[Min Value]
    FROM {{ ref('s_dv_fabric_link__vn_tier') }} T
    WHERE T.[Min Value] <= A.Amount AND T.[Max Value] > A.Amount
) B
OUTER APPLY 
(
    SELECT TOP 1
        [Status] =
        CASE
            WHEN A.[Stage] = 'Pending Opportunity' THEN 'Pending'
            WHEN A.[Stage days] >= [Max Red] THEN 'Overdue'
            WHEN A.[Stage days] >= [Min Yellow] THEN 'Off-Target'
            ELSE 'On-Target' END
    FROM {{ ref('s_common__Stage_Transactiontype_Link') }} T
    WHERE A.[Stage Id] = T.[Stage Id] AND A.[TransactionType Id] = T.[TransactionType Id]
) C
