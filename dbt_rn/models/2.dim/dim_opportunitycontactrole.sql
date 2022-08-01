{{ config(
    materialized="incremental",
    schema="DWh",
    Unique_id='opportunitycontactroleid'
    ) 
}}

with final as (
SELECT *
FROM {{ ref('recp_opportunitycontactrole') }}
   )
select * from final