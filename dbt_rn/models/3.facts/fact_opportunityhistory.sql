{{ config(
    materialized="incremental",
    schema="DWh",
    Unique_id='Id'
    ) 
}}

with final as (
SELECT 
op.opportunity_id,op.opportunity_key,op.accountid,opportunityhistory_key,
opportunityhistory_id, opportunityid, opph.stagename, amount, expectedrevenue,
opph.closedate, probability, opph.forecastcategory, opph.isdeleted, 
opph.prevamount,opph.prevclosedate, opph.createdbyid, 
opph.createddate,opph.executiondate
FROM {{ ref('recp_opportunityhistory') }} opph
join {{ ref('dim_opportunity') }} op
on
op.opportunity_id=opph.opportunityid

)
select * from final