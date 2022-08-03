{{ config(
    materialized="incremental",
    schema="DWh",
    Unique_id='opportunityid',
    post_hook=" delete from {{ this }} where opportunityid in (select opportunityid FROM {{ ref('recp_opportunity') }} where isdeleted = 'y')"
    ) 
}}

with final as (
SELECT 
{{ md5_surrogatekey('id') }} AS "dim_opportunity_key",
"id" as "opportunityid",
ac."isdeleted"	as "isdeleted",
ac.accountid,
ac.dim_account_key,
op."name"	as "name",
op."description"	as "description",
op."stagename"	as "stagename",
op."closedate"	as "closedate",
op."type"	as "type",
op."nextstep"	as "nextstep",
op."leadsource"	as "leadsource",
 op.isclosed,
op."iswon"	as "iswon",
op."forecastcategory"	as "forecastcategory",
op."forecastcategoryname"	as "forecastcategoryname",
op."campaignid"	as "campaignid",
op."hasopportunitylineitem"	as "hasopportunitylineitem",
op."pricebook2id"	as "pricebook2id",
op."ownerid"	as "ownerid",
op."createddate"	as "createddate",
op."createdbyid"	as "createdbyid",
op."lastmodifieddate"	as "lastmodifieddate",
op."lastmodifiedbyid"	as "lastmodifiedbyid",
op."lastactivitydate"	as "lastactivitydate",
op."fiscalquarter"	as "fiscalquarter",
op."fiscalyear"	as "fiscalyear",
op."fiscal"	as "fiscal",
op."lastvieweddate"	as "lastvieweddate",
op."lastreferenceddate"	as "lastreferenceddate",
op."hasopenactivity"	as "hasopenactivity",
op."hasoverduetask"	as "hasoverduetask",
op."ageindays"	as "ageindays",
op."connectionreceivedid"	as "connectionreceivedid",
op."connectionsentid"	as "connectionsentid",
op."contactid"	as "contactid",
op."contractid"	as "contractid",
op."iqscore"	as "iqscore",
op."isexcludedfromterritory2filter"	as "isexcludedfromterritory2filter",
op."issplit"	as "issplit",
op."lastactivityindays"	as "lastactivityindays",
op."lastamountchangedhistoryid"	as "lastamountchangedhistoryid",
op."lastclosedatechangedhistoryid"	as "lastclosedatechangedhistoryid",
op."laststagechangedate"	as "laststagechangedate",
op."laststagechangeindays"	as "laststagechangeindays",
op."partneraccountid"	as "partneraccountid",
op."pricebookid"	as "pricebookid",
op."recordtypeid"	as "recordtypeid",
op."syncedquoteid"	as "syncedquoteid",
op."territory2id"	as "territory2id",
op."executiondate"	as "executiondate"
FROM {{ ref('recp_opportunity') }} op
inner join {{ref('dim_account')}} ac
on 
op.accountid=ac.accountid
)
select * from final
