{% macro stg_recp_sample_model(from_table,from_schema) %}
{%- set query -%}
select column_name from information_schema.columns where table_name = 'stg_opportunity' and table_schema = 'Staging'
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
"{{col}}",
{%- endif -%}
{%- if loop.last -%}
"{{col}}"
{%- endif -%}
{%- endfor -%}
from {{ source("Staging", "stg_opportunity") }}
),
final as (
    select * from sample
)
select * from final
{% endmacro %}