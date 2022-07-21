{{ config(materialized='table') }}
with recp_accountcontactrole as (
select 
"Id"	as	"accountcontactrole_key",
"Id"	as	"accountcontactrole_id",
"IsDeleted"	as	"isdeleted",
"CreatedDate"	as	"createddate",
"CreatedById"	as	"createdbyid",
"LastModifiedDate"	as	"lastmodifieddate",
"LastModifiedById"	as	"lastmodifiedbyid",
"AccountId"	as	"accountid",
"ContactId"	as	"contactid",
"Role"	as	"role",
"IsPrimary"	as	"isprimary",
"PK"	as	"pk",
"executiondate"	as	"executiondate"
from {{ source("Staging", "stg_accountcontactrole") }}
)
select * from recp_accountcontactrole
