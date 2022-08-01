{{ config(
    materialized="incremental",
    schema="DWh",
    Unique_id='d_fact_opportunity_key'
    ) 
}}

with final as (
SELECT
"Id" as "f_fact_opportunity_key",
op.opportunityid,
op.d_opportunity_key,
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
FROM {{ source('Staging','stg_opportunity') }} rop
inner join {{ ref('dim_opportunity') }} op
on
op.opportunityid=rop."Id"
)
select * from final