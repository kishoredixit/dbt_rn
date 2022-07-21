{{ config(
    materialized="incremental",
    schema="DWh",
    Unique_id='Id'
    ) 
}}

with final as (
SELECT 
"Id" AS "opportunity_key",
"Id" AS "opportunity_id",
"IsDeleted"	AS "isdeleted",
"AccountId"	AS "accountid",
"Name"	AS "name",
"Description"	AS "description",
"StageName"	AS "stagename",
"CloseDate"	AS "closedate",
"Type"	AS "type",
"NextStep"	AS "nextstep",
"LeadSource"	AS "leadsource",
"IsClosed"	AS "isclosed",
"IsWon"	AS "iswon",
"ForecastCategory"	AS "forecastcategory",
"ForecastCategoryName"	AS "forecastcategoryname",
"CampaignId"	AS "campaignid",
"HasOpportunityLineItem"	AS "hasopportunitylineitem",
"Pricebook2Id"	AS "pricebook2id",
"OwnerId"	AS "ownerid",
"CreatedDate"	AS "createddate",
"CreatedById"	AS "createdbyid",
"LastModifiedDate"	AS "lastmodifieddate",
"LastModifiedById"	AS "lastmodifiedbyid",
"LastActivityDate"	AS "lastactivitydate",
"FiscalQuarter"	AS "fiscalquarter",
"FiscalYear"	AS "fiscalyear",
"Fiscal"	AS "fiscal",
"LastViewedDate"	AS "lastvieweddate",
"LastReferencedDate"	AS "lastreferenceddate",
"HasOpenActivity"	AS "hasopenactivity",
"HasOverdueTask"	AS "hasoverduetask",
"AgeInDays"	AS "ageindays",
"ConnectionReceivedId"	AS "connectionreceivedid",
"ConnectionSentId"	AS "connectionsentid",
"ContactId"	AS "contactid",
"ContractID"	AS "contractid",
"IqScore"	AS "iqscore",
"IsExcludedFromTerritory2Filter"	AS "isexcludedfromterritory2filter",
"IsSplit"	AS "issplit",
"LastActivityInDays"	AS "lastactivityindays",
"LastAmountChangedHistoryId"	AS "lastamountchangedhistoryid",
"LastCloseDateChangedHistoryId"	AS "lastclosedatechangedhistoryid",
"LastStageChangeDate"	AS "laststagechangedate",
"LastStageChangeInDays"	AS "laststagechangeindays",
"PartnerAccountId"	AS "partneraccountid",
"PricebookId"	AS "pricebookid",
"RecordTypeId"	AS "recordtypeid",
"SyncedQuoteID"	AS "syncedquoteid",
"Territory2Id"	AS "territory2id",
"ExecutionDate"	AS "executiondate"
FROM {{ ref('recp_opportunity') }}
   
)
select * from final
