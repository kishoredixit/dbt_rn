{{ config(materialized='table',
schema="DWh",)}}
{{dim_model_macro('dim_opportunitycompetitor')}}