{{ config(
    materialized="incremental",
    schema="DWh",
    Unique_id='Id'
    ) 
}}

with final as (
SELECT 
opportunitylineitem_key, opportunitylineitem_id, opportunityid, sortorder, 
pricebookentryid, product2id, productcode,
"name", currencyisocode, servicedate, description, createddate, createdbyid, 
lastmodifieddate, lastmodifiedbyid, isdeleted, accountsource, 
canusequantityschedule, canuserevenueschedule, 
connectionreceivedid, connectionsentid, discount, hasquantityschedule, 
hasrevenueschedule, hasschedule, lastreferenceddate, 
lastvieweddate, productid,  pk, executiondate
FROM {{ ref('recp_opportunitylineitem') }}
   )
select * from final
