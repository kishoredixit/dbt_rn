{% macro selectpath(dimtable) %}
{%- call statement('get_query_results', fetch_result=True,auto_begin=True) -%}
         select sourcefield,targetfield from dynamic_config.sourcedimensionconfig where from_source = 'y' 
{%- endcall -%}
{%- call statement('get_query_join', fetch_result=True,auto_begin=True) -%}
         select related_dimension,dimension_join from dynamic_config.sourcedimensionconfig where from_related_dimension = 'y' 
{%- endcall -%}
    {%- if execute -%}
        {%- set sql_results_table = load_result('get_query_results')['data'] -%}
       {%- endif -%}
with sample1 as (
select
{% for k,v in sql_results_table %}
{%- if not loop.last -%}
a."{{k}}" as "{{v}}",
{%- endif -%}
{%- if loop.last -%}
"{{k}}" as "{{v}}"
{%- endif -%}
{%- endfor -%}
FROM {{ ref('recp_opportunity') }} a
 {%- if execute -%}
 {%- set sql_results_join = load_result('get_query_join')['data'] -%}
 {% for k,v in sql_results_join %}
  inner join  "DWh"."{{k}}"  on  "DWh"."{{k}}"."{{v}}" = a."{{v}}"
 {%- endfor -%}
 {%- endif -%}
)
select * from sample1
{% endmacro %}