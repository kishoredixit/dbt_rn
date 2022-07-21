{% snapshot dim_account_snapshot%}
{{
    config(
        target_database='Demo',
        target_schema='DWh',
        unique_key='account_id',
        
        strategy='check',
        check_cols= 'all'
      
    )
}}

select 
* 
FROM {{ ref('dim_account') }}

{% endsnapshot %}