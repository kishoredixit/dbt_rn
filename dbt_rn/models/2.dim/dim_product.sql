{{ config(
    materialized="incremental",
    schema="DWh",
    Unique_id='productid',
    post_hook=" delete from {{ this }} where productid in (select productid FROM {{ ref('recp_product') }} where isdeleted = 'y')"
    ) 
}}

with final as (
SELECT *
FROM {{ ref('recp_product') }}
   )
select * from final