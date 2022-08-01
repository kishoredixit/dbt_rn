{{ config(
    materialized="incremental",
    schema="DWh",
    Unique_id='accountid'
    ) 
}}

with final as (
SELECT 
"Id" AS "d_account_key",
"Id" AS "accountid",
"AccountNumber"	as	"accountnumber",
"AccountSource"	as	"accountsource",
"AnnualRevenue"	as	"annualrevenue",
"BillingAddress"	as	"billingaddress",
"BillingCity"	as	"billingcity",
"BillingCountry"	as	"billingcountry",
"BillingCountryCode"	as	"billingcountrycode",
"BillingGeocodeAccuracy"	as	"billinggeocodeaccuracy",
"BillingLatitude"	as	"billinglatitude",
"BillingLongitude"	as	"billinglongitude",
"BillingPostalCode"	as	"billingpostalcode",
"BillingState"	as	"billingstate",
"BillingStateCode"	as	"billingstatecode",
"BillingStreet"	as	"billingstreet",
"ChannelProgramLevelName"	as	"channelprogramlevelname",
"ChannelProgramName"	as	"channelprogramname",
"CleanStatus"	as	"cleanstatus",
"ConnectionReceivedId"	as	"connectionreceivedid",
"ConnectionSentId"	as	"connectionsentid",
"CreatedByID"	as	"createdbyid",
"CreatedDate"	as	"createddate",
"CurrencyIsoCode"	as	"currencyisocode",
"Description"	as	"description",
"DunsNumber"	as	"dunsnumber",
"Fax"	as	"fax",
"HasOptedOutOfEmail"	as	"hasoptedoutofemail",
"Industry"	as	"industry",
"Industry_Vertical__c"	as	"industry_vertical__c",
"IsCustomerPortal"	as	"iscustomerportal",
"IsDeleted"	as	"isdeleted",
"IsPartner"	as	"ispartner",
"IsPersonAccount"	as	"ispersonaccount",
"Jigsaw"	as	"jigsaw",
"LastActivityDate"	as	"lastactivitydate",
"LastModifiedByID"	as	"lastmodifiedbyid",
"LastModifiedDate"	as	"lastmodifieddate",
"LastReferencedDate"	as	"lastreferenceddate",
"LastViewedDate"	as	"lastvieweddate",
"MasterRecordID"	as	"masterrecordid",
"NaicsCode"	as	"naicscode",
"NaicsDesc"	as	"naicsdesc",
"Name"	as	"name",
"NumberOfEmployees"	as	"numberofemployees",
"OperatingHoursId"	as	"operatinghoursid",
"OwnerId"	as	"ownerid",
"Ownership"	as	"ownership",
"ParentId"	as	"parentid",
"PersonIndividualId"	as	"personindividualid",
"Phone"	as	"phone",
"PhotoUrl"	as	"photourl",
"Rating"	as	"rating",
"RecordTypeId"	as	"recordtypeid",
"Region__c"	as	"region__c",
"Salutation"	as	"salutation",
"ShippingAddress"	as	"shippingaddress",
"ShippingCity"	as	"shippingcity",
"ShippingCountry"	as	"shippingcountry",
"ShippingCountryCode"	as	"shippingcountrycode",
"ShippingGeocodeAccuracy"	as	"shippinggeocodeaccuracy",
"ShippingLatitude"	as	"shippinglatitude",
"ShippingLongitude"	as	"shippinglongitude",
"ShippingPostalCode"	as	"shippingpostalcode",
"ShippingState"	as	"shippingstate",
"ShippingStateCode"	as	"shippingstatecode",
"ShippingStreet"	as	"shippingstreet",
"Sic"	as	"sic",
"SicDesc"	as	"sicdesc",
"Site"	as	"site",
"TickerSymbol"	as	"tickersymbol",
"Tradestyle"	as	"tradestyle",
"Type"	as	"type",
"Website"	as	"website",
"YearStarted"	as	"yearstarted",
"PK"	as	"pk",
"revenue__c"	as	"revenue__c",
"zone__c"	as	"zone__c",
"executiondate"
FROM {{ ref('recp_account') }}
   )
select * from final
