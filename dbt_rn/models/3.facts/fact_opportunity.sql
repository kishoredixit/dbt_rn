{{ config(
    materialized="incremental",
    schema="DWh",
    Unique_id='opportunityid',
    post_hook=" delete from {{ this }} where opportunityid in (select opportunityid FROM {{ ref('recp_opportunity') }} where isdeleted = 'y')"
    ) 
}}

with final as (
SELECT
{{ md5_surrogatekey('Id') }} AS "fact_opportunity_key",
op.opportunityid,
op.dim_opportunity_key,
op.accountid,
"StageName"	as "stagename",
"Amount" as "amount",
"Probability" as "probability" ,
"ExpectedRevenue" as "expectedrevenue" ,
"TotalOpportunityQuantity" as "totalopportunityquantity" ,
"CloseDate" as "closedate" ,
"CurrencyIsoCode" as "currencyisocode"  ,
Null AS "fiscalQuarter_id",
NUll AS "fiscalYear_id"
FROM {{ source('Recp','recp_opportunity') }} rop
inner join {{ ref('dim_opportunity') }} op
on
op.opportunityid=rop."Id"
inner join {{ ref('dim_account') }} op
on
op.accountid=rop."accountid"
)
select * from final