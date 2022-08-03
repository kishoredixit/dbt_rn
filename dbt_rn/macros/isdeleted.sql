{% macro isdeleted(targetschema,table_name,source_schema,sourcetable,field) %}
{% set sql %}
    delete  from "{{targetschema}}"."{{table_name}}" where "{{field}}" in (select id from "{{source_schema}}"."{{sourcetable}}" where isdeleted = 'y')
{% endset %}
{% do run_query(sql) %}
{% do log("delete done", info=True) %}
{% endmacro %}
