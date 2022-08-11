{{ config(materialized="incremental", schema="dwh", Unique_id='accountid', post_hook='{{ isdeleted("dwh","d_account","recp","recp_account","accountid") }}') }} with final as
    
  (
    SELECT *
    FROM {{ ref('recp_account') }}
    )
select *
from final