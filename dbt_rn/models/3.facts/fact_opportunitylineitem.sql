{{ config(
    materialized="incremental",
    schema="DWh",
    Unique_id='opportunitylineitemid',
    post_hook=" delete from {{ this }} where opportunitylineitemid in (select opportunitylineitemid FROM {{ ref('recp_opportunitylineitem') }} where isdeleted = 'y')"
    ) 
}}

with final as (
SELECT 
dim_opportunitylineitem_key AS fact_opportunitylineitem_key,
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
