{{ config(materialized='table') }}
with recp_product as (
select 
"Id"	as	"product_key",
"Id"	as	"product_id",
"Name"	as	"name",
"ProductCode"	as	"productcode",
"Description"	as	"description",
"IsActive"	as	"isactive",
"CreatedDate"	as	"createddate",
"CreatedById"	as	"createdbyid",
"LastModifiedDate"	as	"lastmodifieddate",
"LastModifiedById"	as	"lastmodifiedbyid",
"Family"	as	"family",
"ExternalDataSourceId"	as	"externaldatasourceid",
"ExternalId"	as	"externalid",
"DisplayUrl"	as	"displayurl",
"QuantityUnitOfMeasure"	as	"quantityunitofmeasure",
"IsDeleted"	as	"isdeleted",
"LastViewedDate"	as	"lastvieweddate",
"LastReferencedDate"	as	"lastreferenceddate",
"StockKeepingUnit"	as	"stockkeepingunit",
"CanUseQuantitySchedule"	as	"canusequantityschedule",
"CanUseRevenueSchedule"	as	"canuserevenueschedule",
"ConnectionReceivedId"	as	"connectionreceivedid",
"ConnectionSentId"	as	"connectionsentid",
"CurrencyISOCode"	as	"currencyisocode",
"IsArchived"	as	"isarchived",
"NumberOfQuantityInstallments"	as	"numberofquantityinstallments",
"NumberOfRevenueInstallments"	as	"numberofrevenueinstallments",
"ProductClass"	as	"productclass",
"QuantityInstallmentPeriod"	as	"quantityinstallmentperiod",
"QuantityScheduleType"	as	"quantityscheduletype",
"RecalculateTotalPrice"	as	"recalculatetotalprice",
"RecordTypeId"	as	"recordtypeid",
"RevenueInstallmentPeriod"	as	"revenueinstallmentperiod",
"RevenueScheduleType"	as	"revenuescheduletype",
"Type"	as	"type",
"PK"	as	"pk",
"executiondate"	as	"executiondate"
from {{ source("Staging", "stg_product2") }}
)
select * from recp_product
