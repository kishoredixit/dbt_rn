{% snapshot dim_account_snapshot%}
{{
    config(
        target_database='Demo',
        target_schema='dwh',
        unique_key='accountid',
        
        strategy='check',
        check_cols= 'all'
      
    )
}}

select 
* 
FROM {{ ref('d_account') }}

{% endsnapshot %}