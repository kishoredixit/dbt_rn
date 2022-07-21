{% macro date_diff_days(startdate,enddate) %}
cast(coalesce({{enddate}},current_date ) as date) - cast ({{startdate}} as date)
{% endmacro %}