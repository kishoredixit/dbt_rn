{{ config(materialized='incremental' ,schema='DWh',Unique_id='opportunitycompetitorid') }}
{{dim_model_macro('dim_opportunitycompetitor')}}