{{ config(materialized='table') }}
with recp_accountcontactrole as (
select 
{{ md5_surrogatekey('Id') }} AS "dim_accountcontactrole_key",
"Id"	as	"accountcontactroleid",
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
