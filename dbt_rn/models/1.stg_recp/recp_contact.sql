{{ config(materialized='table') }}
with recp_contact as (
select 
"Id"	as	"contact_key",
"Id"	as	"contact_id",
"IsDeleted"	as	"isdeleted",
"MasterRecordId"	as	"masterrecordid",
"AccountId"	as	"accountid",
"LastName"	as	"lastname",
"FirstName"	as	"firstname",
"Salutation"	as	"salutation",
"Name"	as	"name",
"OtherStreet"	as	"otherstreet",
"OtherCity"	as	"othercity",
"OtherState"	as	"otherstate",
"OtherPostalCode"	as	"otherpostalcode",
"OtherCountry"	as	"othercountry",
"OtherLatitude"	as	"otherlatitude",
"OtherLongitude"	as	"otherlongitude",
"OtherGeocodeAccuracy"	as	"othergeocodeaccuracy",
"OtherAddress"	as	"otheraddress",
"MailingStreet"	as	"mailingstreet",
"MailingCity"	as	"mailingcity",
"MailingState"	as	"mailingstate",
"MailingPostalCode"	as	"mailingpostalcode",
"MailingCountry"	as	"mailingcountry",
"MailingLatitude"	as	"mailinglatitude",
"MailingLongitude"	as	"mailinglongitude",
"MailingGeocodeAccuracy"	as	"mailinggeocodeaccuracy",
"MailingAddress"	as	"mailingaddress",
"Phone"	as	"phone",
"Fax"	as	"fax",
"MobilePhone"	as	"mobilephone",
"HomePhone"	as	"homephone",
"OtherPhone"	as	"otherphone",
"AssistantPhone"	as	"assistantphone",
"ReportsToId"	as	"reportstoid",
"Email"	as	"email",
"Title"	as	"title",
"Department"	as	"department",
"AssistantName"	as	"assistantname",
"LeadSource"	as	"leadsource",
"Birthdate"	as	"birthdate",
"Description"	as	"description",
"CurrencyIsoCode"	as	"currencyisocode",
"OwnerId"	as	"ownerid",
"CreatedDate"	as	"createddate",
"CreatedById"	as	"createdbyid",
"LastModifiedDate"	as	"lastmodifieddate",
"LastModifiedById"	as	"lastmodifiedbyid",
"LastActivityDate"	as	"lastactivitydate",
"LastViewedDate"	as	"lastvieweddate",
"LastReferencedDate"	as	"lastreferenceddate",
"EmailBouncedReason"	as	"emailbouncedreason",
"EmailBouncedDate"	as	"emailbounceddate",
"IsEmailBounced"	as	"isemailbounced",
"Jigsaw"	as	"jigsaw",
"IndividualId"	as	"individualid",
"CanAllowPortalSelfReg"	as	"canallowportalselfreg",
"CleanStatus"	as	"cleanstatus",
"ConnectionReceivedId"	as	"connectionreceivedid",
"ConnectionSentId"	as	"connectionsentid",
"DoNotCall"	as	"donotcall",
"HasOptedOutOfEmail"	as	"hasoptedoutofemail",
"HasOptedOutOfFax"	as	"hasoptedoutoffax",
"IsPersonAccount"	as	"ispersonaccount",
"MailingCountryCode"	as	"mailingcountrycode",
"MailingStateCode"	as	"mailingstatecode",
"MiddleName"	as	"middlename",
"OtherCountryCode"	as	"othercountrycode",
"OtherStateCode"	as	"otherstatecode",
"PhoneUrl"	as	"phoneurl",
"RecordTypeId"	as	"recordtypeid",
"Suffix"	as	"suffix",
"Type__c"	as	"type__c",
"PK"	as	"pk",
"executiondate"	as	"executiondate"
from {{ source("Staging", "stg_contact") }}
)
select * from recp_contact
