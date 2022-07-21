{% snapshot dim_opportunity_snapshot %}
{{
    config(
        target_database='Demo',
        target_schema='DWh',
        unique_key='opportunity_id',
        
        strategy='check',
        check_cols= 'all'
      
    )
}}

select 
* 
FROM {{ ref('dim_opportunity') }}

{% endsnapshot %}