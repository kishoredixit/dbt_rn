{% macro dim_model_macro(dimtable) %}
 {%- set keycolumn = dimtable -%}
{% set relation_query %}
	select sourcefield,targetfield from dynamic_config.sourcedimensionconfig where from_source = 'y' and table_name = '{{dimtable}}'
{% endset %}
{{ print("Running relation_query: " ~ relation_query) }}
{%- set get_query_sourcetable -%}
	select distinct sourcetable from dynamic_config.sourcedimensionconfig where from_source = 'y' and table_name = '{{dimtable}}'
{%- endset -%}
--{{ print("Running get_query_sourcetable: " ~ get_query_sourcetable) }}
{%- set get_query_results_dim -%}
	select targetfield,related_dimension,from_related_dimension_schema from dynamic_config.sourcedimensionconfig where from_related_dimension = 'y' and table_name = '{{dimtable}}' 
{%- endset -%}
--{{ print("Running get_query_results_dim: " ~ get_query_results_dim) }}
{%- set get_query_join -%}
	select related_dimension,dimension_join,from_related_dimension_schema from dynamic_config.sourcedimensionconfig 
	where from_related_dimension = 'y' and transformation_column is null and transformation_table is null and table_name = '{{dimtable}}'  
{%- endset -%}
{%- set get_sec_query_join -%}
	select related_dimension,dimension_join,from_related_dimension_schema,transformation_table,transformation_column from dynamic_config.sourcedimensionconfig where from_related_dimension = 'y' and transformation_table is not null and table_name = '{{dimtable}}' 
{%- endset -%}
{{ print("Running get_sec_query_join: " ~ get_sec_query_join) }}
   {% set results = run_query(relation_query) %}
  -- {{ print("Running results: " ~ results) }}
{% set sourcetable = run_query(get_query_sourcetable) %}
{% if execute %}
{# Return the first column #}
{% set sourcetable1 = sourcetable.columns[0].values() %}
{% else %}
{% set sourcetable1 = [] %}
{% endif %}
---{{ print("Running sourcetable1: " ~ sourcetable1) }}
{% for i in sourcetable1 %}
{% set sourcetable2 = i %}
--{{ print("Running sourcetable3: " ~ i) }}
{%- endfor -%}
--{{ print("Running sourcetable4: " ~ sourcetable2) }}
{% set sql_results_dim = run_query(get_query_results_dim) %}
{%- set deletequery -%}
select targetschema,table_name,source_schema,sourcetable from dynamic_config.sourcedimensionconfig 
{%- endset -%}
{% set deleteresults = run_query(deletequery) %}
{% for targetschema,table_name,source_schema,sourcetable in deleteresults %}
{{ print("Running deleteresults: " ~ deleteresults) }}
{% endfor %}
{{ isdeleted('targetschema','table_name','source_schema','sourcetable') }}

with sample1 as (
select
{{ md5_surrogatekey('id') }} as {{keycolumn}}_key,
{%- for v,x,y in sql_results_dim -%}
"{{y}}"."{{x}}"."{{v}}" as "{{v}}",
{%- endfor -%}
{% for k,v in results %}
{%- if not loop.last -%}
a."{{k}}" as "{{v}}",
{%- endif -%}
{%- if loop.last -%}
a."{{k}}" as "{{v}}"  
{%- endif -%}
{% endfor %}
 FROM "Recp".{% for i in sourcetable1 %}"{{i}}"{% endfor %} a  
 {%- if execute -%}
 {%- set sql_results_join = run_query(get_query_join) -%}
 {{ print("Running sql_results_join: " ~ sql_results_join) }}
 {%- endif -%}
 {% for k,v,y in sql_results_join %}
 inner join  "{{y}}"."{{k}}" on "{{y}}"."{{k}}"."{{v}}" = a."{{v}}"
 {%- endfor -%}
 {%- if execute -%}
 {%- set sql_sec_results_join = run_query(get_sec_query_join) -%}
 {{ print("Running sql_sec_results_join: " ~ sql_sec_results_join) }}
 {%- endif -%}
 {% for k,v,y,z,c in sql_sec_results_join %}
 inner join "{{y}}"."{{k}}" on "{{y}}"."{{k}}"."{{v}}" ="{{y}}"."{{z}}"."{{c}}"
 {%- endfor -%}
 )
select * from sample1
{% endmacro %}