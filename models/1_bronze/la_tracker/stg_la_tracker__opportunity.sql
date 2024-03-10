with 

source as (

    select * from {{ source('la_tracker', 'opportunity') }}

),

renamed as (

    SELECT [FileName]
            ,[UserCode]
            ,[StageByFile]
            ,[Index]
            ,[Lender_Ref]
            ,[Lender]
            ,[Borrower]
            ,[Notes]
            ,[Residential]
            ,[Commercial]
            ,[RSL]
            ,[Purpose]
            ,[Transaction_Type]
            ,[Tier]
            ,[Stage_1]
            ,[Stage_Time_Stamp]
            ,[Stage_Last_Update]
            ,[Stage_Days]
            ,[Status]
            ,[Proposed_Date]
            ,[Discharge]
            ,[Pricing]
            ,[File_Owner]
            ,[Referrer]
            ,[Source]
            ,[State]
            ,[AF]
            ,[GI]
            ,[FP]
            ,[Last_Contact]
            ,[Opportunity_Date]
            ,[Opportunity_Withdrawn]
            ,[Lodged_Date]
            ,[Date_Entered]
            ,[Date_Lodged]
            ,[Lodged_Withdrawn]
            ,[Utilisation]
            ,[Unconditional_Date]
            ,[Document_Issued_Date]
            ,[Sign_Up_Date]
            ,[CT]
            ,[Uncon_Withdrawn]
            ,[Compliance_Complete]
            ,[Clients_names]
            ,[Leasing]
            ,[Loan_Acct]
            ,[Discharge_Status]
            ,[Uncon_Approval_Date]
            ,[Settlement_Date]
            ,[Compliance]
            ,[Comms_Confirmed_with_Banker]
            ,[Comm_Lodged]
            ,[Comm_Paid]
            ,[Loadtime]
    from source

)

select * from renamed
