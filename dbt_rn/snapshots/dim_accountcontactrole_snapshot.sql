{% snapshot dim_accountcontactrole_snapshot%}
{{
    config(
        target_database='Demo',
        target_schema='DWh',
        unique_key='accountcontactrole_id',
        
        strategy='check',
        check_cols= 'all'
      
    )
}}

select 
* 
FROM {{ ref('dim_accountcontactrole') }}

{% endsnapshot %}