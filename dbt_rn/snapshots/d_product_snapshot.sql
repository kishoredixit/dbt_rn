{% snapshot dim_product_snapshot%}
{{
    config(
        target_database='Demo',
        target_schema='dwh',
        unique_key='productid',
        
        strategy='check',
        check_cols= 'all'
      
    )
}}

select 
* 
FROM {{ ref('d_product') }}

{% endsnapshot %}