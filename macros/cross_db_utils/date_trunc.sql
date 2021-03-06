{% macro date_trunc(datepart, date) %}
  {{ adapter_macro('dbt_utils_sqlserver.date_trunc', datepart, date) }}
{% endmacro %}

{% macro default__date_trunc(datepart, date) %}
    date_trunc('{{datepart}}', {{date}})
{% endmacro %}

{% macro bigquery__date_trunc(datepart, date) %}
    timestamp_trunc(
        cast({{date}} as timestamp), 
        {{datepart}}
    )
{% endmacro %}
  
{% macro sqlserver__date_trunc(datepart, date) %}
    datepart({{datepart}}, {{date}}) 
{% endmacro %}
