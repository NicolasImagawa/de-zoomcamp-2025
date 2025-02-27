{% macro make_year_quarter(pickup_datetime) %}
    concat(extract(year from cast({{ pickup_datetime }} as date)), concat('/Q', trip_quarter))
{% endmacro %}