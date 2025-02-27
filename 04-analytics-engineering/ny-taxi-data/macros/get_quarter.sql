{% macro get_quarter(pickup_datetime) %}
    case cast(extract(month from cast({{ pickup_datetime }} as date)) as integer)
        when 1 then 1
        when 2 then 1
        when 3 then 1
        when 4 then 1
        when 5 then 2
        when 6 then 2
        when 7 then 2
        when 8 then 2
        when 9 then 3
        when 10 then 3
        when 11 then 3
        when 12 then 3
        else NULL
    end
{% endmacro %}
