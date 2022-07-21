{% snapshot dim_opportunitylineitem_snapshot %}
{{
    config(
        target_database='Demo',
        target_schema='DWh',
        unique_key='opportunitylineitem_id',
        
        strategy='check',
        check_cols= 'all'
      
    )
}}

select 
* 
FROM {{ ref('dim_opportunitylineitem') }}

{% endsnapshot %}