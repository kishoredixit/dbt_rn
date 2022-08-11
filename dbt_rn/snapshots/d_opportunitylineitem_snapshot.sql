{% snapshot dim_opportunitylineitem_snapshot %}
{{
    config(
        target_database='Demo',
        target_schema='dwh',
        unique_key='opportunitylineitemid',
        
        strategy='check',
        check_cols= 'all'
      
    )
}}

select 
* 
FROM {{ ref('d_opportunitylineitem') }}

{% endsnapshot %}