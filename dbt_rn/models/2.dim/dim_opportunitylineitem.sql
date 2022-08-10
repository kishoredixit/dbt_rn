{{ config(
    materialized="incremental",
    schema="DWh",
    Unique_id='opportunitylineitemid',
    post_hook=" delete from {{ this }} where opportunitylineitemid in (select opportunitylineitemid FROM {{ ref('recp_opportunitylineitem') }} where isdeleted = 'y')"
    ) 
}}

with final as (
SELECT 
{{ md5_surrogatekey('opportunitylineitemid') }} d_opportunitylineitem_key, opportunitylineitemid, op.opportunityid,op.d_opportunity_key, sortorder, 
pricebookentryid, product2id, productcode,
ol."name", ol.currencyisocode, ol.servicedate, ol.description, ol.createddate, ol.createdbyid, 
ol.lastmodifieddate, ol.lastmodifiedbyid, ol.isdeleted, ol.accountsource, 
ol.canusequantityschedule, canuserevenueschedule, 
ol.connectionreceivedid, ol.connectionsentid, ol.discount, ol.hasquantityschedule, 
ol.hasrevenueschedule, ol.hasschedule, ol.lastreferenceddate, 
ol.lastvieweddate, ol.productid,  ol.pk, ol.executiondate
FROM {{ ref('recp_opportunitylineitem') }} ol
inner join {{ref('dim_opportunity')}} op
on 
op.opportunityid=ol.opportunityid
   )
select * from final
