drop sequence esblog.seq_event_log;
create sequence esblog.seq_event_log minvalue 0 maxvalue 999999999999999999999999999 increment by 1 start with 1 cache 2000 noorder nocycle;

drop table esblog.event_log;
create table esblog.event_log
(
  event_id       number not null,
  event_date     timestamp not null,
  event_msg      blob,
  trans_date     date,
  rq_uid         varchar2(128 char),
  operation      varchar2(1024 char),
  operation_name varchar2(512 char),
  proc_status    varchar2(512 char),
  error_text     varchar2(4096 char),
  event_source   varchar2(512 char),
  event_receiver varchar2(512 char),
  source_qm      varchar2(512 char),
  source_queue   varchar2(512 char),
  target_qm      varchar2(512 char),
  target_queue   varchar2(512 char),
  reply_qm       varchar2(512 char),
  reply_queue    varchar2(512 char)
)
logging tablespace esblogdata storage(initial 1M pctincrease 0 minextents 1 maxextents unlimited) pctfree 0 initrans 1 maxtrans 255 nocompress
lob(event_msg) store as(enable storage in row chunk 4096 pctversion 0 nocache logging tablespace esblogdatalob storage(initial 1M pctincrease 0 minextents 1 maxextents unlimited))
partition by range(event_date)
interval(interval '1' hour)
(
  partition P2018121000 values less than(to_timestamp('2018121001', 'YYYYMMDDHH24'))
);

create index esblog.i1_event_log on esblog.event_log(rq_uid asc) local tablespace esbindex noparallel;
create index esblog.i2_event_log on esblog.event_log(trans_date asc) local tablespace esbindex noparallel;

create trigger esblog.bi_event_log before insert on esblog.event_log for each row
begin
  select systimestamp into :new.event_date from dual;
  select esblog.seq_event_log.nextval into :new.event_id from dual;
end;

drop procedure esblog.drop_partition_event_log;
create procedure esblog.drop_partition_event_log is
begin
  for rec in (select t.table_owner as table_owner, t.table_name as table_name, t.high_value as high_value, t.partition_name as partition_name from sys.all_tab_partitions t where(((t.table_owner, t.table_name) in (('ESBLOG', 'EVENT_LOG'))))) loop
    if((to_date(substr(rec.high_value, 1 + instr(rec.high_value, '''', 1), 20), 'SYYYY-MM-DD HH24:MI:SS') between (sysdate - 365) and (sysdate - 3))) then
      execute immediate('alter table' || ' ' || rec.table_owner || '.' || rec.table_name || ' ' || 'set interval()');
      execute immediate('alter table' || ' ' || rec.table_owner || '.' || rec.table_name || ' ' || 'drop partition' || ' ' || rec.partition_name);
      execute immediate('alter table' || ' ' || rec.table_owner || '.' || rec.table_name || ' ' || 'set interval(interval ''1'' hour)');
    end if;
  end loop;
end;

drop procedure esblog.write_partition_event_log;
create procedure esblog.write_partition_event_log
(
  pevent_msg      in blob,
  ptrans_date     in date,
  prq_uid         in varchar2,
  poperation      in varchar2,
  poperation_name in varchar2,
  pproc_status    in varchar2,
  perror_text     in varchar2,
  pevent_source   in varchar2,
  pevent_receiver in varchar2,
  psource_qm      in varchar2,
  psource_queue   in varchar2,
  ptarget_qm      in varchar2,
  ptarget_queue   in varchar2,
  preply_qm       in varchar2,
  preply_queue    in varchar2
)
is
begin
  insert into esblog.event_log(event_msg, trans_date, rq_uid, operation, operation_name, proc_status, error_text, event_source, event_receiver, source_qm, source_queue, target_qm, target_queue, reply_qm, reply_queue) values(pevent_msg, ptrans_date, prq_uid, poperation, poperation_name, pproc_status, perror_text, pevent_source, pevent_receiver, psource_qm, psource_queue, ptarget_qm, ptarget_queue, preply_qm, preply_queue);
  commit work;
end;
