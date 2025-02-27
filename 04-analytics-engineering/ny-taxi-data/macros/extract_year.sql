{% macro extract_year(pickup_datetime) %}
    extract(year from cast({{ pickup_datetime }} as date))
{% endmacro %}
