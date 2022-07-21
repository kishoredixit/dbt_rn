{{ config(
    materialized="incremental",
    schema="DWh",
    Unique_id='opportunitycontactrole_id'
    ) 
}}

with final as (
SELECT *
FROM {{ ref('recp_opportunitycontactrole') }}
   )
select * from final