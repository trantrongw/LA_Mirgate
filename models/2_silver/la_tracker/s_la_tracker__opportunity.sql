SELECT 
--meta
FileName,
--thuoctinh
[OpportunityCode] = 'OPP-1RT-'+Convert(CHAR(8),try_cast(Opportunity_Date as Date),112)+'-'+cast(ROW_NUMBER() OVER (PARTITION BY try_cast(Stage_Time_Stamp as Date) ORDER BY [Index]) as nvarchar(50)),
[OpportunityName] = LEFT(Borrower,50),
[Note] = LEFT(Notes,50),
[Amount] = try_cast(Residential+Commercial as DECIMAL),
[Created On] = try_cast(Stage_Time_Stamp as Datetime),
[Modified On] = try_cast(Stage_Last_Update as Datetime),
[Proposed Date] =  try_cast(Proposed_Date as Date),
[Opportunity Date] = try_cast(Opportunity_Date as Datetime),
[Opportunity Withdrawn Date] = try_cast(Opportunity_Withdrawn as Datetime),
[Lodged Date] = try_cast(Lodged_Date as Datetime),
[Lodged Withdrawn Date] = try_cast(Lodged_Date as Datetime),
--ref
[PurposeCode] = Purpose,
[TransactionCode] = Transaction_Type,
[StageCode] = [Stage_1],
[ReferrerCode] = Referrer,
[StateCode]=State

FROM {{ref('stg_la_tracker__opportunity')}} 
Where [StageByFile] <> 'Settled'
and try_cast(Opportunity_Date as Date) >= '2023-01-01'
and [Borrower] <> ''
and try_cast(Residential+Commercial as DECIMAL) > 1
--So tien vuot goi han
and try_cast(Residential+Commercial as DECIMAL) < 100000000000
--Trung code
and FileName <> 'RT Tracker Opps + Lodged 1RT.xlsm'