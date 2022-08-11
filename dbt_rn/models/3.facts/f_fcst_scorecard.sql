{{ config(materialized='table', schema="dwh",)}} 
{{dim_model_macro('fact_fcst_scorecard')}}