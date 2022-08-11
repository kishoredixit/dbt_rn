{% macro loadexecution_start(ledid) %} {%
set sql %}
UPDATE staging.loadexecution_detail
SET loadstartdatetime=now()
where loadexecution_detail_key=('{{ledid}}');

{% endset %} {% do run_query(sql) %} {{ print("printing sql: " ~ sql) }} {% do log("startdatetime updated", info=True) %} {% endmacro %}