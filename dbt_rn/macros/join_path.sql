{% macro join_path(dimtable) %}
{%- call statement('get_query_results', fetch_result=True,auto_begin=True) -%}
         select related_dimension,dimension_join from dynamic_config.sourcedimensionconfig where from_related_dimension = 'y' 
{%- endcall -%}
    {%- if execute -%}
        {%- set sql_results_table = load_result('get_query_results')['data'] -%}
       {% do log("The installed version of dbt is: " ~ sql_results_table, info=true) %}
        {{ print("Running some_macro: " ~ sql_results_table.related_dimension) }}
        {{ print("Running some_macro: " ~ sql_results_table.dimension_join) }}
        {% for k,v in sql_results_table %}
         "This is the key {{ k }}, this is the value {{ v }}"
         {{ print("Inside loop:" ~ k) }}
         {{ print("Inside loop:" ~ v) }}
         {%- set this_is_a_variable = 'inner join '~ k ~' on '~ k~'.' ~ v ~ '='~dimtable~'.'~v -%}
         {{ print("Inside loop:" ~ this_is_a_variable) }}
        {%- endfor -%}

    {%- endif -%}
    {% endmacro %}
