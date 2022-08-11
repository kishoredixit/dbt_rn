{% snapshot dim_opportunitycontactrole_snapshot %}
{{
    config(
        target_database='Demo',
        target_schema='dwh',
        unique_key='opportunitycontactroleid',
        
        strategy='check',
        check_cols= 'all'
      
    )
}}

select 
* 
FROM {{ ref('d_opportunitycontactrole') }}

{% endsnapshot %}
