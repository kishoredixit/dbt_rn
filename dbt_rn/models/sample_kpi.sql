{{ config(materialized="table")}}
{%- set relation_query -%}
	select distinct opportunityid from "dwh"."f_opportunityhistory"
{%- endset -%}
 {% set results = run_query(relation_query) %}
select distinct 
opportunityid,
{% for i in results %}
{{ print("Running get_sec_query_join: " ~ i ) }}
{% endfor %}
from "dwh"."f_opportunityhistory"
