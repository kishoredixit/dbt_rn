{% macro stg_recp_sample_model(from_table) %}
{%- set query -%}
select column_name from dynamic_config.custom_config where table_name = '{{from_table}}' 
{%- endset -%}
{%- set results = run_query(query) -%}
{%- if execute -%}
{%- set results_list = results.columns[0].values() -%}
{% else %}
{%- set results_list = [] -%}
{%- endif -%}
with sample as (
select
{% for col in results_list %}
{%- if not loop.last -%}
"{{col}}" as "{{col}}".lower(),
{%- endif -%}
{%- if loop.last -%}
"{{col}}" as "{{col}}".lower()
{%- endif -%}
{%- endfor -%}
from 
"Staging"."{{from_table}}"
),
final as (
    select * from sample
)
select * from final
{% endmacro %}