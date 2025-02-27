{% macro extract_month(pickup_datetime) %}
    extract(month from cast({{ pickup_datetime }} as date))
{% endmacro %}
