SELECT 
--meta
FileName,
--thuoctinh
[vn_opportunitycode] = [OPP_ID],
[vn_opportunityname] = LEFT(Borrower,50),
[vn_note] = LEFT(Notes,50),
[vn_amount] = try_cast(Residential+Commercial as DECIMAL),
[createdon] = try_cast(Stage_Time_Stamp as Datetime),
[modifiedon] = try_cast(Stage_Last_Update as Datetime),
[vn_proposeddate] =  try_cast(Proposed_Date as Date),
[vn_opportunitydate] = try_cast(Stage_Time_Stamp as Datetime),
[vn_oppswithdrawn] = try_cast(Opportunity_Withdrawn as Datetime),
[vn_lodgeddate] = COALESCE(try_cast(Lodged_Date as Datetime),try_cast(Date_Lodged as Datetime)),
[vn_lodgedwithdrawn] = try_cast(Lodged_Date as Datetime),
[vn_lastcontact] = try_cast([Last_Contact] as Date),

--ref
[UserCode]=[File_Owner],
[PurposeCode] = Purpose,
[TransactionCode] = Transaction_Type,
[StageCode] = [Stage_1],
[ReferrerCode] = Referrer,
[StateCode]=State

FROM {{ ref('ref_tracker_has_opp_id') }}
-- Where [StageByFile] <> 'Settled'
-- and try_cast(Opportunity_Date as Date) >= '2023-01-01'
-- and [Borrower] <> ''
-- and try_cast(Residential+Commercial as DECIMAL) > 1
-- --So tien vuot goi han
-- and try_cast(Residential+Commercial as DECIMAL) < 100000000000