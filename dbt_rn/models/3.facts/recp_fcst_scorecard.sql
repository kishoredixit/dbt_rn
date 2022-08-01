{{ config(materialized='table') }}
{{stg_recp_sample_model('fcst_scorecard')}}