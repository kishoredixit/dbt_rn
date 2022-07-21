{{ config(
materialized="incremental",
schema="DWh",
Unique_id='opportunity_id'
) 
}}
{% set var_stage_seq_num = ["1","2","3","4","5","6","7","8","9","10"] %}
with sample2 as 
(select opp."opportunity_id",-- opp.createddate  created_date, opp.closedate   closed_date,-- opp.currencyisocode opp_currencyisocode,--opp.amount opp_amount,
opp."stagename" opp_stagename, map."StageNumber" stage_seq_num,
oh."hist_created_date",
( case when map."StageNumber" in(0,100) then oh."hist_closed_date" else current_timestamp end ) sales_gestation 
from {{ ref('dim_opportunity') }} opp 
left outer join {{ ref('dim_opportunity_stage_mapping') }} map 
on opp."stagename" = map."StageName" 
left outer join ( select "opportunityid", min("createddate") as hist_created_date,
max("createddate") as hist_closed_date 
from {{ ref('fact_opportunityhistory') }} 
group by "opportunityid") oh 
on opp."opportunity_id" = oh."opportunityid" ),
sample1 as 
(
select 
{% for seq_num in var_stage_seq_num %}
sum ( case when (stage_seq_num) = {{seq_num}} then days_spent end ) as stage{{seq_num}}days_spent,
{% endfor %} 
opportunity_bkey from 
( select opportunity_bkey, stage_seq_num,sum (days_spent) days_spent 
from ( select opportunity_bkey, stage_seq_num,
--coalesce(end_date, current_date) - start_date days_spent 
{{ date_diff_days ( 'start_date', 'end_date') }} as days_spent 
from ( select "opportunity_bkey", "start_date", "end_date", "stage_seq_num",
rank() over ( partition by "stage_seq_num","start_date" order by "start_date" asc) rk 
from ( select "opportunityid" opportunity_bkey, "createddate" start_date , lead("createddate", 1)
over ( partition by "opportunityid" order by "createddate" asc ) end_date,
"StageNumber" as stage_seq_num from {{ ref('fact_opportunityhistory') }} his,
{{ ref('dim_opportunity_stage_mapping') }} map
where his."stagename" = map."StageName" )a )b 
where rk = 1) x where stage_seq_num not in (0,100) 
group by opportunity_bkey, stage_seq_num) y group by 11 )
select * from sample2 a, sample1 b where a."opportunity_id" = b."opportunity_bkey"