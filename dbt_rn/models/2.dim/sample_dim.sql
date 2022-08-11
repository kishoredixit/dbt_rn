{{ config(materialized='table') }}
{{dim_model_macro('d_opportunity')}}