{%- macro sales_gestation_macro(opportunity_id) -%}
{%- set query -%}
select cast(hist_closed_date as date) - cast(hist_created_date as date) as sales_gestation
from (
select "opportunityid", min("createddate") as hist_created_date,
max(case when map."StageNumber" in(0,100) then ("createddate")  else current_timestamp end) as hist_closed_date 
from "DWh"."fact_opportunityhistory" opp
inner join 
"DWh"."dim_opportunity_stage_mapping" map 
on opp."stagename" = map."StageName" 
group by "opportunityid") b where opportunityid ='0061U00000N4LF6QAN'
{%- endset -%}
{% set sales_gestation = run_query(query) %}
{% set result = sales_gestation.columns[0].values() %}
{{ print("Running get_sec_query_join: " ~ result) }}
{{return (result)}}
{% endmacro %}
