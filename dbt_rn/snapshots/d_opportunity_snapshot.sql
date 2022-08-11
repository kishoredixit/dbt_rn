{% snapshot dim_opportunity_snapshot %}
{{
    config(
        target_database='Demo',
        target_schema='dwh',
        unique_key='opportunityid',
        
        strategy='check',
        check_cols= 'all'
      
    )
}}

select 
* 
FROM {{ ref('d_opportunity') }}

{% endsnapshot %}