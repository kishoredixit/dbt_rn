{% snapshot dim_contact_snapshot%}
{{
    config(
        target_database='Demo',
        target_schema='dwh',
        unique_key='contactid',
        
        strategy='check',
        check_cols= 'all'
      
    )
}}

select 
* 
FROM {{ ref('d_contact') }}

{% endsnapshot %}