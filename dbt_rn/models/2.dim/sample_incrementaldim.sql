{{ config( materialized="incremental", schema="dwh", Unique_id='id' ) }} 
{{dim_model_macro('d_opportunity')}}