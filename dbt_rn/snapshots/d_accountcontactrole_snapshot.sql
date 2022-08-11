{% snapshot dim_accountcontactrole_snapshot%}
{{
    config(
        target_database='Demo',
        target_schema='dwh',
        unique_key='accountcontactroleid',
        
        strategy='check',
        check_cols= 'all'
      
    )
}}

select 
* 
FROM {{ ref('d_accountcontactrole') }}

{% endsnapshot %}