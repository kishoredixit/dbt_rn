{{ config(
    materialized="incremental",
    schema="DWh",
    Unique_id='contactid',
    post_hook=" delete from {{ this }} where contactid in (select contactid FROM {{ ref('recp_contact') }} where isdeleted = 'y')"
)
}}

with final as (
SELECT *
FROM {{ ref('recp_contact') }}
   )

select * from final

