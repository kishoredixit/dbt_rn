{{ config(
    materialized="incremental",
    schema="DWh",
    Unique_id='opportunityhistoryid'
    ) 
}}

with final as (
SELECT 
d_opportunityhistory_key as f_fact_opportunityhistory_key,
op.opportunityid,op.d_opportunity_key,op.accountid,
opportunityhistoryid, opph.stagename, amount, expectedrevenue,
opph.closedate, probability, opph.forecastcategory, opph.isdeleted, 
opph.prevamount,opph.prevclosedate, opph.createdbyid, 
opph.createddate,opph.executiondate
FROM {{ ref('recp_opportunityhistory') }} opph
join {{ ref('dim_opportunity') }} op
on
op.opportunityid=opph.opportunityid

)
select * from final