{{ config(materialized='table') }}
with recp_opportunityhistory as (
select 
{{ md5_surrogatekey('Id') }} AS fact_opportunityhistory_key,
"Id" AS opportunityhistoryid,
"OpportunityId" as	"opportunityid",
"StageName" as	"stagename",
"Amount" as	"amount",
"ExpectedRevenue" as	"expectedrevenue",
"CloseDate" as	"closedate",
"Probability" as	"probability",
"ForecastCategory" as	"forecastcategory",
"IsDeleted" as	"isdeleted",
"PrevAmount" as	"prevamount",
"PrevCloseDate" as	"prevclosedate",
"CreatedById" as	"createdbyid",
"CreatedDate" as	"createddate",
"ExecutionDate" as	"executiondate" 
 from {{ source("Staging", "stg_opportunityhistory") }} 
),

final as (
    select * from recp_opportunityhistory
)
select * from final