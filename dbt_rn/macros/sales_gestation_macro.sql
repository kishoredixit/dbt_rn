{%- macro sales_gestation_macro(opportunityid) -%}
{%- set query -%}
select cast(hist_closed_date as date) - cast(hist_created_date as date) as sales_gestation
from (
select "opportunityid", min("createddate") as hist_created_date,
max(case when map."stagenumber" in(0,100) then ("createddate")  else current_timestamp end) as hist_closed_date 
from "dwh"."f_opportunityhistory" opp
inner join 
"dwh"."d_opportunity_stage_mapping" map 
on opp."stagename" = map."stagename" 
group by "opportunityid") b where opportunityid ='0061U00000N4LF6QAN'
{%- endset -%}
{% set sales_gestation = run_query(query) %}
{% set result = sales_gestation.columns[0].values() %}
{{ print("Running get_sec_query_join: " ~ result) }}
{{return (result)}}
{% endmacro %}
