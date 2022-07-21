{{ config(materialized='table') }}
with recp_opportunity as (
select * from {{ source("Staging", "stg_opportunity") }}
)

select * from recp_opportunity