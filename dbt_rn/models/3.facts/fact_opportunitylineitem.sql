{{ config(
    materialized="incremental",
    schema="DWh",
    Unique_id='opportunitylineitemid'
    ) 
}}

with final as (
SELECT 
opportunitylineitemid as f_fact_opportunitylineitem_key,
opportunitylineitemid,
opportunityid,
quantity,
totalprice,
unitprice,
listprice,
recalculatetotalprice,
subtotal
FROM {{ ref('recp_opportunitylineitem') }} 
)
select * from final
