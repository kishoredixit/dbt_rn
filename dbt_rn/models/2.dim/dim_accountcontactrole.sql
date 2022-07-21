{{ config(
    materialized="incremental",
    schema="DWh",
    Unique_id='accountcontactrole_id'
    ) 
}}

with final as (
SELECT *
FROM {{ ref('recp_accountcontactrole') }}
   )
select * from final