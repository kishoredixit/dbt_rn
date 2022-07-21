{{ config(
    materialized="incremental",
    schema="DWh",
    Unique_id='contact_id'
    ) 
}}

with final as (
SELECT *
FROM {{ ref('recp_contact') }}
   )
select * from final