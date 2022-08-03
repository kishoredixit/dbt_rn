{{ config(materialized='table') }}
with recp_opportunitycontactrole as (
select 
{{ md5_surrogatekey('Id') }} AS "dim_opportunitycontactrole_key",
"Id"	as	"opportunitycontactroleid",
"OpportunityId"	as	"opportunityid",
"ContactId"	as	"contactid",
"Role"	as	"role",
"IsPrimary"	as	"isprimary",
"CreatedDate"	as	"createddate",
"CreatedById"	as	"createdbyid",
"LastModifiedDate"	as	"lastmodifieddate",
"LastModifiedById"	as	"lastmodifiedbyid",
"IsDeleted"	as	"isdeleted",
"CurrencyIsoCode"	as	"currencyisocode",
"Division"	as	"division",
"PK"	as	"pk",
"executiondate"	as	"executiondate"
from {{ source("Staging", "stg_opportunitycontactrole") }}
)
select * from recp_opportunitycontactrole

