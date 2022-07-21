{{ config(
    materialized="incremental",
    schema="DWh",
    Unique_id='product_id'
    ) 
}}

with final as (
SELECT *
FROM {{ ref('recp_product') }}
   )
select * from final