{{ config(materialized='table',
schema="DWh",)}}
{{dim_model_macro('fact_fcst_scorecard')}}