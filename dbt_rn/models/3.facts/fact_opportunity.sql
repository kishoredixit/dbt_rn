{{ config(
    materialized="incremental",
    schema="DWh",
    Unique_id='fact_opportunity_key',
    post_hook=" delete from {{ this }} where contactid in (select contactid FROM {{ ref('recp_contact') }} where isdeleted = 'y')"
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
FROM {{ source('Staging','stg_opportunity') }} rop
inner join {{ ref('dim_opportunity') }} op
on
op.opportunityid=rop."Id"
)
select * from final