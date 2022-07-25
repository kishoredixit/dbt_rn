{% macro dim_model_macro(dimtable) %}
{%- call statement('get_query_results', fetch_result=True,auto_begin=True) -%}
    select sourcefield,targetfield from dynamic_config.sourcedimensionconfig where from_source = 'y'
{%- endcall -%}
{%- call statement('get_query_sourcetable', fetch_result=True,auto_begin=True) -%}
    select distinct sourcetable from dynamic_config.sourcedimensionconfig where from_source = 'y'
{%- endcall -%}
{%- set sourcetable = load_result('get_query_sourcetable')['data'] -%}
{%- call statement('get_query_results_dim', fetch_result=True,auto_begin=True) -%}
      select transformation,targetfield,related_dimension,from_related_dimension_schema from dynamic_config.sourcedimensionconfig where from_related_dimension = 'y' 
{%- endcall -%}
{%- call statement('get_query_join', fetch_result=True,auto_begin=True) -%}
         select related_dimension,dimension_join,from_related_dimension_schema from dynamic_config.sourcedimensionconfig where from_related_dimension = 'y' 
{%- endcall -%}
    {%- if execute -%}
        {%- set sql_results_table = load_result('get_query_results')['data'] -%}
       {%- endif -%}
with sample1 as (
select
  {%- set sql_results_dim = load_result('get_query_results_dim')['data'] -%}
{% for k,v,x,y in sql_results_dim %}
"{{y}}"."{{x}}"."{{k}}" as "{{v}}",
{%- endfor -%}
{% for k,v in sql_results_table %}
{%- if not loop.last -%}
a."{{k}}" as "{{v}}",
{%- endif -%}
{%- if loop.last -%}
"{{k}}" as "{{v}}"
{%- endif -%}
{%- endfor -%}
FROM "Recp"."recp_opportunitycompetitor" a
 {%- if execute -%}
 {%- set sql_results_join = load_result('get_query_join')['data'] -%}
 {% for k,v,y in sql_results_join %}
  inner join  "{{y}}"."{{k}}"  on  "{{y}}"."{{k}}"."{{v}}" = a."{{v}}"
 {%- endfor -%}
 {%- endif -%}
)
select * from sample1
{% endmacro %}