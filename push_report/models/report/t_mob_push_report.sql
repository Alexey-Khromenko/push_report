{{ config(materialized='table') }}
select * from {{ ref('v_mob_push_report')}}