{{ config(materialized='table') }} with recp_fcst_score_card__c as
    (select "id" as "fcst_score_card_id", {{ md5_surrogatekey('id') }} AS "fcst_score_card_key",
                                                                     "isdeleted" as "isdeleted",
                                                                     "name" as "name",
                                                                     "createddate" as "createddate",
                                                                     "isactive__c" as "isactive__c",
                                                                     "isai__c" as "isai__c",
                                                                     "expire_date__c" as "expire_date__c",
                                                                     "score_value__c" as "score_value__c",
                                                                     "activity_date__c" as "activity_date__c",
                                                                     "category__c" as "category__c",
                                                                     "engagement_type__c" as "engagement_type__c",
                                                                     "contact__c" as "contact__c",
                                                                     "next_meeting__c" as "next_meeting__c",
                                                                     "fcst_scorecard_account__c" as "fcst_scorecard_account__c"
     from {{ source("staging", "stg_fcst_score_card__c") }}),
                                        final as
    (select *
     from recp_fcst_score_card__c)
select *
from final