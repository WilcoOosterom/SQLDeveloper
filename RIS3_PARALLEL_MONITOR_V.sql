---------------------------
--New VIEW
--RIS3_PARALLEL_MONITOR_V
---------------------------
CREATE OR REPLACE FORCE VIEW "RPT_VIEW_USER_RIS"."RIS3_PARALLEL_MONITOR_V" 
 ( "RAC", "SID", "TOP_LEVEL", "STATUS", "USERNAME", "START_DT", "STOP_DT", "AANTAL", "MINUTES_ELAPSED", "GEM_EL", "MIN_EL", "MAX_EL", "UUR_TE_GAAN", "MIN_TE_GAAN", "ERROR_INFO"
  )  AS 
  select 
/*----------------------------------------------------------------------------------------------------------------------*
 * RIS3_PARALLEL_MONITOR_V
 * Version: 1.00.50 
 * Schema: RIS_STG
 * Date 05-July-2019
 * Developer: Wilco Oosterom
 * 
 * Goal: Monitor processes loading in parallel
 * 
 *----------------------------------------------------------------------------------------------------------------------*/
       nvl(d.rac,0) rac
,      COALESCE (CASE WHEN c.sid_exists IS null THEN '***' ELSE to_char(sid) END, '***')  sid
,      COALESCE(c.top_level,a.top_level) top_Level
,      COALESCE(c.status, a.status)      status
,      COALESCE(c.username, a.username)  username
,      a.start_dt, a.stop_dt , aantal, minutes_elapsed
,      b.gem_el , b.min_el, b.max_el
,      round( (min_el - minutes_elapsed) / 60 ) uur_te_gaan
,      round( (min_el - minutes_elapsed) ) min_te_gaan
,      c.error_info
from
   ( select  ( select count(*) from   grip_sessions_v x  where  ACTION = 'GRIP_FLOW' and x.sid = a.par_degree AND x.username = a.username ) sid_exists
   ,          ( select MAX(sid) from   grip_sessions_v x  where  ACTION = 'GRIP_FLOW' and x.sid = a.par_degree AND x.username = a.username ) sid
     ,  a.*
     from grip_job_run  a
     where a.status not in ('B_selected_for_start','D_ready')
   )  c
FULL OUTER JOIN 
   ( select top_level,username, min(start_dt) start_dt, max(stop_dt) stop_dt, round (( max(stop_dt) - min(start_dt)) * 24*60) MINUTES_elapsed,status,  sum(1) aantal
     from grip_job_run
     where status   in ('B_selected_for_start', 'D_ready' )
     group by top_level,username, status
   ) a
ON   c.top_level = a.top_level
and  c.username  = a.username
LEFT OUTER JOIN  
   ( select top_level, min(elapsed) min_el, max(elapsed) max_el, round(avg(elapsed)) gem_el  from grip_job4_v
    where start_dt > sysdate -7
    group by  top_level
   ) b
ON   c.top_level = b.top_level
LEFT OUTER JOIN 
   ( select owner, decode(table_name,'GRIP_ETL',0,replace(TABLE_NAME,'GRIP_ETL_',null)) rac from all_synonyms
     where   synonym_name = 'GRIP_ETL'
   ) d
ON c.username  = d.owner;
