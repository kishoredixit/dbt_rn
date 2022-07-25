{{ config(materialized='table') }}
with recp_account as (
select * 
from 
{{ source("Staging", "stg_account") }}
--where execution_date >(select max(execution_date) from stg_account)
),

final as (
    select * from recp_account
)
select * from final