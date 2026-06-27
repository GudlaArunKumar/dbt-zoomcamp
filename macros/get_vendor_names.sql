{% macro get_vendor_names(vendor_id) %}
case 
    when vendor_id = 1 then 'Creative Mobile Technologies'
    when vendor_id = 2 then 'Curb Mobility LLC'
    when vendor_id = 4 then 'unknown/Other'
    when vendor_id = 5 then 'Myle Technologies'
    else NULL 
end

{% endmacro %}