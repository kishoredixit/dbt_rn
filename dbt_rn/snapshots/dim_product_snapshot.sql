{% snapshot dim_product_snapshot%}
{{
    config(
        target_database='Demo',
        target_schema='DWh',
        unique_key='product_id',
        
        strategy='check',
        check_cols= 'all'
      
    )
}}

select 
* 
FROM {{ ref('dim_product') }}

{% endsnapshot %}