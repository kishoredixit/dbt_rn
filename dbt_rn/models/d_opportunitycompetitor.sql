{{ config(materialized='table', schema="dwh",)}} 
{{dim_model_macro('d_opportunitycompetitor')}}