{{ config(materialized='table')}} with sample2 as
    (select null as "d_opportunitycompetitor_key",
            "dwh"."dim_opportunity"."d_opportunity_key" as "d_opportunity_key",
            "dwh"."dim_account"."d_account_key" as "d_account_key",
            a."competitorname" as "competitorname",
            a."opportunityid" as "opportunityid",
            a."strengths" as "strengths",
            a."weaknesses" as "weaknesses",
            a."isdeleted" as "isdeleted",
            "id" as "opportunitycompetitorid"
     FROM "recp"."recp_opportunitycompetitor" as a
     inner join "dwh"."dim_opportunity" on "dwh"."dim_opportunity".opportunityid=a.opportunityid
     inner join "dwh"."dim_account" on "dwh"."dim_account"."accountid" ="dwh"."dim_opportunity".accountid)
select *
from sample2