{% macro get_column(from_table,from_schema) %}
{%- set query -%}
SELECT sourcefield, "target fieldname" FROM dynamic_config.sourcedimensionconfig ;
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
from {{ source("dynamic_config", "sourcedimensionconfig") }}
),
final as (
    select * from sample1
)
select * from final
{% endmacro %}