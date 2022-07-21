{% snapshot dim_contact_snapshot%}
{{
    config(
        target_database='Demo',
        target_schema='DWh',
        unique_key='contact_id',
        
        strategy='check',
        check_cols= 'all'
      
    )
}}

select 
* 
FROM {{ ref('dim_contact') }}

{% endsnapshot %}