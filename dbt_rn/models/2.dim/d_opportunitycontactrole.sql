{{ config( materialized="incremental", schema="dwh", Unique_id='opportunitycontactroleid', post_hook=" delete from {{ this }} where opportunitycontactroleid in (select opportunitycontactroleid FROM {{ ref('recp_opportunitycontactrole') }} where isdeleted = 'y')" ) }} with final as
    (SELECT *
     FROM {{ ref('recp_opportunitycontactrole') }} )
select *
from final