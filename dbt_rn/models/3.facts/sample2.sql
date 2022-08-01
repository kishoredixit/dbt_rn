{{ config(materialized='table')}}

with sample2 as (
select
null as "d_opportunitycompetitor_key","DWh"."dim_opportunity"."d_opportunity_key" as "d_opportunity_key","DWh"."dim_account"."d_account_key" as "d_account_key",a."competitorname" as "competitorname",a."opportunityid" as "opportunityid",a."strengths" as "strengths",a."weaknesses" as "weaknesses",a."isdeleted" as "isdeleted","id" as "opportunitycompetitorid"
FROM 
"Recp"."recp_opportunitycompetitor" as a
inner join "DWh"."dim_opportunity" 
on
"DWh"."dim_opportunity".opportunityid=a.opportunityid
inner join "DWh"."dim_account"
on 
"DWh"."dim_account"."accountid" ="DWh"."dim_opportunity".accountid
)
select * from sample2
