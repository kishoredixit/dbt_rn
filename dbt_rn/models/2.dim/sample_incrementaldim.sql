{{ config(
    materialized="incremental",
    schema="DWh",
    Unique_id='id'
    ) 
}}

{{dim_model_macro('dim_opportunity')}}