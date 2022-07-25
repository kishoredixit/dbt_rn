{{ config(materialized='table') }}
{{dim_model_macro('dim_opportunity')}}