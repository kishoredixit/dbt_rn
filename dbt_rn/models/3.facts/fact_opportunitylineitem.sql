{{ config(
    materialized="incremental",
    schema="DWh",
    Unique_id='Id'
    ) 
}}

with final as (
SELECT 
opportunitylineitem_id,
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
