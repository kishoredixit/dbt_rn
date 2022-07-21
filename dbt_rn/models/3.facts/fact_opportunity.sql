{{ config(
    materialized="incremental",
    schema="DWh",
    Unique_id='Id'
    ) 
}}

with final as (
SELECT
"Id" as "fact_opportunity_key",
op.opportunity_id,
op.opportunity_key,
op.accountid,
"StageName"	as "stagename",
"Amount" as "amount",
"Probability" as "probability" ,
"ExpectedRevenue" as "expectedrevenue" ,
"TotalOpportunityQuantity" as "totalopportunityquantity" ,
"CloseDate" as "closedate" ,
"CurrencyIsoCode" as 	"currencyisocode"  ,
Null AS "fiscalQuarter_id",
NUll AS "fiscalYear_id"
FROM {{ ref('recp_opportunity') }} rop
inner join {{ ref('dim_opportunity') }} op
on
op.opportunity_id=rop."Id"
)
select * from final