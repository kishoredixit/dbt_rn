{{ config(
    materialized="incremental",
    schema="DWh",
    Unique_id='accountid',
    post_hook=" delete from {{ this }} where accountid in (select accountid FROM {{ ref('recp_account') }} where isdeleted = 'y')"
    ) 
}}
with final as (
SELECT 
*
FROM {{ ref('recp_account') }}
   )
select * from final
