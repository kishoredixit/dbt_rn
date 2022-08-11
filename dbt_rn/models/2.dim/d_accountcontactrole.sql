{{ config( materialized="incremental", schema="dwh", Unique_id='accountcontactroleid' ) }} with final as
    (SELECT *
     FROM {{ ref('recp_accountcontactrole') }} )
select *
from final