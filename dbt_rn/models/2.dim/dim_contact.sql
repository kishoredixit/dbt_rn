{{ config(
    materialized="incremental",
    schema="DWh",
    Unique_id='contactid'
    ) 
}}

with final as (
SELECT *
FROM {{ ref('recp_contact') }}
   )
select * from final