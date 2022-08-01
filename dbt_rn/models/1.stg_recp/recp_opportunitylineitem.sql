{{ config(materialized='table') }}
with recp_opportunitylineitem as 
(
select 
"Id" AS d_opportunitylineitem_key,
"Id" AS opportunitylineitemid,
"OpportunityId"	as	"opportunityid",
"SortOrder"	as	"sortorder",
"PricebookEntryId"	as	"pricebookentryid",
"Product2Id"	as	"product2id",
"ProductCode"	as	"productcode",
"Name"	as	"name",
"CurrencyIsoCode"	as	"currencyisocode",
"Quantity"	as	"quantity",
"TotalPrice"	as	"totalprice",
"UnitPrice"	as	"unitprice",
"ListPrice"	as	"listprice",
"ServiceDate"	as	"servicedate",
"Description"	as	"description",
"CreatedDate"	as	"createddate",
"CreatedById"	as	"createdbyid",
"LastModifiedDate"	as	"lastmodifieddate",
"LastModifiedById"	as	"lastmodifiedbyid",
"IsDeleted"	as	"isdeleted",
"AccountSource"	as	"accountsource",
"CanUseQuantitySchedule"	as	"canusequantityschedule",
"CanUseRevenueSchedule"	as	"canuserevenueschedule",
"ConnectionReceivedId"	as	"connectionreceivedid",
"ConnectionSentId"	as	"connectionsentid",
"Discount"	as	"discount",
"HasQuantitySchedule"	as	"hasquantityschedule",
"HasRevenueSchedule"	as	"hasrevenueschedule",
"HasSchedule"	as	"hasschedule",
"LastReferencedDate"	as	"lastreferenceddate",
"LastViewedDate"	as	"lastvieweddate",
"ProductId"	as	"productid",
"RecalculateTotalPrice"	as	"recalculatetotalprice",
"Subtotal"	as	"subtotal",
"PK"	as	"pk",
"executiondate" as	"executiondate" 
 from {{ source("Staging", "stg_opportunitylineitem") }} 
),

final as (
    select * from recp_opportunitylineitem
)
select * from final