
with data as (

    select * from {{ ref('data_last_day') }}

)

select
    case
        when date_part = 'month' then {{ dbt_utils_sqlserver.last_day('date_day', 'month') }}
        when date_part = 'year' then {{ dbt_utils_sqlserver.last_day('date_day', 'year') }}
        else null
    end as actual,
    result as expected

from data
