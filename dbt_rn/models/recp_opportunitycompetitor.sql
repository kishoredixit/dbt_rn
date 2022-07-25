{{ config(materialized='table') }}
{{stg_recp_sample_model('stg_opportunitycompetitor','Staging')}}