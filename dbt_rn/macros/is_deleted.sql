{% macro isdeleted(targettable,targetschema,sourcetable,sourceschema) %}
{% set sql %}
    delete  from "{{targetschema}}"."{{targettable}}" where opportunityid in (select opportunityid from "{{sourceschema}}"."{{sourcetable}}" where isdeleted = 'y')
{% endset %}
{% do run_query(sql) %}
{% do log("delete done", info=True) %}
{% endmacro %}
