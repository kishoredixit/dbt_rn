{{ config(
    materialized="incremental",
    schema="DWh",
    Unique_id='productid'
    ) 
}}

with final as (
SELECT *
FROM {{ ref('recp_product') }}
   )
select * from final