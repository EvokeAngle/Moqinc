create table T_MC_TYPE
(
  nid   NUMBER,
  sname VARCHAR2(30),
  npid  NUMBER
);

comment on table T_MC_TYPE
  is '��Ʒ����';
comment on column T_MC_TYPE.nid
  is '���';
comment on column T_MC_TYPE.sname
  is '����';
comment on column T_MC_TYPE.npid
  is '������';
  
alter table T_MC_TYPE
  add primary key (NID);

create sequence seq_t_mc_type start with 30 increment by 1;

create table T_MC
(
  nid          NUMBER,
  sname        VARCHAR2(30),
  sdescription VARCHAR2(300),
  nprice       VARCHAR2(30),
  simg         VARCHAR2(300),
  smctag       VARCHAR2(2),
  dcdate       VARCHAR2(30),
  nmaxid       NUMBER,
  nminid       NUMBER
);
comment on table T_MC
  is '��Ʒ��Ϣ��';
comment on column T_MC.nid
  is '��Ʒ���';
comment on column T_MC.sname
  is '��Ʒ����';
comment on column T_MC.sdescription
  is '��Ʒ����';
comment on column T_MC.nprice
  is '��Ʒ�۸�';
comment on column T_MC.simg
  is '��ƷͼƬ';
comment on column T_MC.smctag
  is '�Ƿ�ȱ��';
comment on column T_MC.dcdate
  is '���ʱ��';
comment on column T_MC.nmaxid
  is '��������';
comment on column T_MC.nminid
  is '����С��';
--alter table T_MC add constraint T_MC_FK_1 foreign key (NMAXID) references T_MC_TYPE (NID);
--alter table T_MC add constraint T_MC_FK_2 foreign key (NMINID) references T_MC_TYPE (NID);
create sequence seq_t_mc start with 30 increment by 1;

create table T_ORDER
(
  nid         NUMBER,
  scuser      VARCHAR2(30),
  dgdate      date,
  spaytype    VARCHAR2(30),
  ssendtype   VARCHAR2(30),
  nmctypesize NUMBER,
  nmcsize     NUMBER,
  ntotalprice VARCHAR2(300),
  sstatus     VARCHAR2(1),
  smsg        VARCHAR2(2000),
  sauser      VARCHAR2(30),
  dadate      date,
  ssname      VARCHAR2(30),
  ssaddress   VARCHAR2(300),
  sscode      VARCHAR2(6),
  ssphone     VARCHAR2(30),
  ssemail     VARCHAR2(300)
);
comment on table T_ORDER
  is '������';
comment on column T_ORDER.nid
  is '�������';
comment on column T_ORDER.scuser
  is '�µ����û���';
comment on column T_ORDER.dgdate
  is '�µ�ʱ��';
comment on column T_ORDER.spaytype
  is '���ʽ';
comment on column T_ORDER.ssendtype
  is '�ջ���ʽ';
comment on column T_ORDER.nmctypesize
  is '��Ʒ������';
comment on column T_ORDER.nmcsize
  is '��Ʒ�ܸ���';
comment on column T_ORDER.ntotalprice
  is '�����ܽ��';
comment on column T_ORDER.sstatus
  is '���״̬';
comment on column T_ORDER.smsg
  is '��˷�����Ϣ';
comment on column T_ORDER.sauser
  is '�����';
comment on column T_ORDER.dadate
  is '���ʱ��';
comment on column T_ORDER.ssname
  is '�մ�������';
comment on column T_ORDER.ssaddress
  is '�մ��˵�ַ';
comment on column T_ORDER.sscode
  is '�մ����ʱ�';
comment on column T_ORDER.ssphone
  is '�մ�����ϵ�绰';
comment on column T_ORDER.ssemail
  is '�մ���email';
alter table T_ORDER
  add primary key (NID);
create sequence seq_t_order start with 30 increment by 1;

create table T_ORDER_ITEM
(
  nid          NUMBER,
  norderid     NUMBER,
  nmcid        NUMBER,
  smcname      VARCHAR2(30),
  sdescription VARCHAR2(300),
  simg         VARCHAR2(300),
  ncount       VARCHAR2(30),
  nprice       VARCHAR2(30),
  ntotalprice  VARCHAR2(30)
);
comment on table T_ORDER_ITEM
  is '������Ŀ��';
comment on column T_ORDER_ITEM.nid
  is '��Ŀ���';
comment on column T_ORDER_ITEM.norderid
  is '�����Ķ������';
comment on column T_ORDER_ITEM.nmcid
  is '��������Ʒ���';
comment on column T_ORDER_ITEM.smcname
  is '��Ʒ��';
comment on column T_ORDER_ITEM.sdescription
  is '��Ʒ����';
comment on column T_ORDER_ITEM.simg
  is '��ƷͼƬ';
comment on column T_ORDER_ITEM.ncount
  is '��Ʒ��';
comment on column T_ORDER_ITEM.nprice
  is '��Ʒ����';
comment on column T_ORDER_ITEM.ntotalprice
  is 'С��';
alter table T_ORDER_ITEM
  add primary key (NID);
--alter table T_ORDER_ITEM add constraint T_ORDER_ITEM_1 foreign key (NORDERID) references T_ORDER (NID);
create sequence seq_t_order_item start with 30 increment by 1;


create table T_USER
(
  suser     VARCHAR2(30),
  spwd      VARCHAR2(30),
  sname     VARCHAR2(30),
  ssex      VARCHAR2(30),
  sbirthday VARCHAR2(30),
  semail    VARCHAR2(300),
  sphone    VARCHAR2(30),
  saddress  VARCHAR2(300),
  scode     VARCHAR2(6),
  nlevel    VARCHAR2(1),
  dregdate  VARCHAR2(30),
  slock     VARCHAR2(4),
  dlastdate VARCHAR2(30),
  nlogin    NUMBER
);
comment on table T_USER
  is '�û���';
comment on column T_USER.suser
  is '�û���';
comment on column T_USER.spwd
  is '����';
comment on column T_USER.sname
  is '��ʵ����';
comment on column T_USER.ssex
  is '�Ա�';
comment on column T_USER.sbirthday
  is '����';
comment on column T_USER.semail
  is '��������';
comment on column T_USER.sphone
  is '�绰����';
comment on column T_USER.saddress
  is '��ַ';
comment on column T_USER.scode
  is '�ʱ�';
comment on column T_USER.nlevel
  is 'Ȩ�޼���';
comment on column T_USER.dregdate
  is 'ע��ʱ��';
comment on column T_USER.slock
  is '�Ƿ񶳽�';
comment on column T_USER.dlastdate
  is '����¼ʱ��';
comment on column T_USER.nlogin
  is '��¼����';
alter table T_USER add primary key (SUSER);
  
insert into T_USER (suser, spwd, sname, ssex, sbirthday, semail, sphone, saddress, scode, nlevel, dregdate, slock, dlastdate, nlogin)
values ('test1', '888888', '����', '��', '2002-11-11 14:52:22', 'min@softfz.com', '0591-87888928', '������̨��', '350001', 2, '2000-11-11 14:52:22', '����', '2002-11-11 14:52:22', 1);
insert into T_USER (suser, spwd, sname, ssex, sbirthday, semail, sphone, saddress, scode, nlevel, dregdate, slock, dlastdate, nlogin)
values ('test2', '888888', '����', 'Ů', '2002-11-11 14:52:22', 'lili@softfz.com', '0593-23232372', '�����в�ɽ', '350010', 2, '2001-12-11 11:52:22', '����', '2002-11-11 14:52:22', 0);
insert into T_USER (suser, spwd, sname, ssex, sbirthday, semail, sphone, saddress, scode, nlevel, dregdate, slock, dlastdate, nlogin)
values ('test3', '888888', '������', '��', '2002-11-11 14:52:22', 'jaky@softfz.com', '0592-82123372', '�����м���', '350030', 2, '2001-11-11 14:52:22', '����', '1991-11-12 14:52:22', 1);
insert into T_USER (suser, spwd, sname, ssex, sbirthday, semail, sphone, saddress, scode, nlevel, dregdate, slock, dlastdate, nlogin)
values ('test4', '888888', 'С��', '��', '2002-11-11 14:52:22', 'xuxun@softfz.com', '0595-8323372', '�����м���', '350120', 2, '2001-01-11 14:52:22', '����', '2001-11-11 14:52:22', 0);
insert into T_USER (suser, spwd, sname, ssex, sbirthday, semail, sphone, saddress, scode, nlevel, dregdate, slock, dlastdate, nlogin)
values ('test5', '888888', '������', 'Ů', '2002-11-11 14:52:22', 'qiaolin@softfz.com', '0591-62365898', '�����й�¥', '351010', 2, '2001-11-11 14:52:22', '����', '2001-11-11 14:52:22', 1);
insert into T_USER (suser, spwd, sname, ssex, sbirthday, semail, sphone, saddress, scode, nlevel, dregdate, slock, dlastdate, nlogin)
values ('test6', '888888', '����', 'Ů', '2002-11-11 14:52:22', 'linzhen@softfz.com', '0591-23365898', null, '350510', 2, '2001-11-11 14:52:22', '����', '2001-02-11 14:52:22', 1);
insert into T_USER (suser, spwd, sname, ssex, sbirthday, semail, sphone, saddress, scode, nlevel, dregdate, slock, dlastdate, nlogin)
values ('test7', '888888', '���', '��', '2002-11-11 14:52:22', 'yunfei@softfz.com', '0591-32365898', '�����и���', '350070', 2, '1999-11-11 14:52:22', '����', '2001-11-11 14:52:22', 1);
insert into T_USER (suser, spwd, sname, ssex, sbirthday, semail, sphone, saddress, scode, nlevel, dregdate, slock, dlastdate, nlogin)
values ('test8', '888888', 'С��', '��', '2002-11-11 14:52:22', 'lin@softfz.com', '0591-32565898', '�����н���', '350070', 2, '2001-11-11 14:52:22', '����', '2001-05-11 14:52:22', 1);
insert into T_USER (suser, spwd, sname, ssex, sbirthday, semail, sphone, saddress, scode, nlevel, dregdate, slock, dlastdate, nlogin)
values ('test9', '888888', '�·�', '��', '2002-11-11 14:52:22', 'chen@softfz.com', '0591-32323898', '�����г���', '350020', 2, '2001-11-11 14:52:22', '����', '2001-11-11 14:52:22', 1);
insert into T_USER (suser, spwd, sname, ssex, sbirthday, semail, sphone, saddress, scode, nlevel, dregdate, slock, dlastdate, nlogin)
values ('test10', '888888', '����', 'Ů', '2002-11-11 14:52:22', 'nin@softfz.com', '0591-82365898', '����������', '350090', 2, '2008-11-11 14:52:22', '����', '2001-03-11 14:52:22', 1);
insert into T_USER (suser, spwd, sname, ssex, sbirthday, semail, sphone, saddress, scode, nlevel, dregdate, slock, dlastdate, nlogin)
values ('test11', '888888', '�', '��', '2002-11-11 14:52:22', 'fan@softfz.com', '0591-32323838', '�����и���', '350020', 2, '2001-11-11 14:52:22', '����', '2001-11-11 14:52:22', 1);
insert into T_USER (suser, spwd, sname, ssex, sbirthday, semail, sphone, saddress, scode, nlevel, dregdate, slock, dlastdate, nlogin)
values ('test12', '888888', '����', 'Ů', '2002-11-11 14:52:22', 'qin@softfz.com', '0591-32323898', null, '350020', 2, '2001-11-11 14:52:22', '����', '2001-11-11 14:52:22', 1);
commit;


insert into T_MC_TYPE (nid, sname, npid)
values (1, '����', 0);
insert into T_MC_TYPE (nid, sname, npid)
values (2, '�����Ʒ', 0);
insert into T_MC_TYPE (nid, sname, npid)
values (3, '̨ʽ��', 1);
insert into T_MC_TYPE (nid, sname, npid)
values (4, '�ʼǱ�', 1);
insert into T_MC_TYPE (nid, sname, npid)
values (5, '���ϵ���', 1);
insert into T_MC_TYPE (nid, sname, npid)
values (6, '���������', 2);
insert into T_MC_TYPE (nid, sname, npid)
values (7, '���������', 2);
commit;



insert into T_MC (nid, sname, sdescription, nprice, simg, smctag, dcdate, nmaxid, nminid)
values (1, '���� IdeaPad Y430A-TFI', '�������� Y430ϵ��  ������:Intel Core2 Duo(Merom) T5800(2.0G)/Ӳ������:250GB/��Ļ�ߴ�:14.1Ӣ��/��ʾоƬ:����,nVidia Geforce 9300M GS/����:Լ2.35Kg', 5500, 'upload/1.jpg', '0', '2001-11-11 14:52:22', 1, 4);
insert into T_MC (nid, sname, sdescription, nprice, simg, smctag, dcdate, nmaxid, nminid)
values (2, '���� IdeaPad Y430A-PEI', '�������� Y430ϵ��  ������:Intel Core2 Duo(Penryn) P8400(2.26G)/Ӳ������:320GB/��Ļ�ߴ�:14.1Ӣ��/��ʾоƬ:����,nVidia Geforce 9300M GS/����:Լ2.36Kg', 9999, 'upload/2.jpg', '0', '2001-11-11 14:52:22', 1, 4);
insert into T_MC (nid, sname, sdescription, nprice, simg, smctag, dcdate, nmaxid, nminid)
values (3, '���� 3000 G430L-TON', '�������� G430ϵ��  ������:Intel Celeron Dual-Core(Merom) T1600(1.66G)/Ӳ������:160GB/��Ļ�ߴ�:14.1Ӣ��/��ʾоƬ:����,����Intel GMA X4500 HD�������Կ�(GL40)/����:Լ2.4Kg ', 2999, 'upload/3.jpg', '0', '2001-11-11 14:52:22', 1, 4);
insert into T_MC (nid, sname, sdescription, nprice, simg, smctag, dcdate, nmaxid, nminid)
values (4, '���� EliteBook 6930p', '��������Intel Core2 Duo(Penryn) T9400(2.53G) ����оƬ�飺Intel PM45+ICH9M �ڴ�������4096MB Ӳ��������2��250GB ��Ļ�ߴ磺14.1Ӣ�� ��ʾоƬ������,ATI Mobility Radeon HD3450 ������Լ2.1Kg', 9000, 'upload/4.jpg', '0', '2001-11-11 14:52:22', 1, 4);
insert into T_MC (nid, sname, sdescription, nprice, simg, smctag, dcdate, nmaxid, nminid)
values (5, '��˶ F8Sg F8H239Sg-SL', '��������Intel Pentium Dual-Core(Merom) T2390(1.86G) ����оƬ�飺Intel PM965+ICH8M �ڴ�������1024MB Ӳ��������200GB ��Ļ�ߴ磺14Ӣ�� ��ʾоƬ������,nVidia Geforce 9300M G ������Լ2.59Kg', 6000, 'upload/5.jpg', '0', '2001-11-11 14:52:22', 1, 4);
insert into T_MC (nid, sname, sdescription, nprice, simg, smctag, dcdate, nmaxid, nminid)
values (6, '���� Latitude E6400', '��������Intel Core2 Duo(Penryn) SP9400(2.4G) ����оƬ�飺Intel GM45+ICH9M �ڴ�������2048MB Ӳ��������160GB ��Ļ�ߴ磺13.3Ӣ�� ��ʾоƬ������,Intel Mobile GMA X4500 HD ������Լ1.5Kg ', 14589, 'upload/6.jpg', '0', '2001-11-11 14:52:22', 1, 4);
insert into T_MC (nid, sname, sdescription, nprice, simg, smctag, dcdate, nmaxid, nminid)
values (7, '���� Kx6600', '���ͣ�����̨ʽ�� ��������Intel Core2 Duo E7200 2.53GHz �ڴ�������2048MB Ӳ��������320GB ������DVD��RW ��ʾ��������Һ�� 22��', 6599, 'upload/7.jpg', '0', '2001-11-11 14:52:22', 1, 3);
insert into T_MC (nid, sname, sdescription, nprice, simg, smctag, dcdate, nmaxid, nminid)
values (8, '���� a6405cn', '���ͣ�����̨ʽ�� ��������Intel Pentium E2200 2.2G �ڴ�������2048MB Ӳ��������250GB ������16X DVD���� ��ʾ��������Һ�� 22��', 5999, 'upload/8.jpg', '1', '2001-11-11 14:52:22', 1, 3);
insert into T_MC (nid, sname, sdescription, nprice, simg, smctag, dcdate, nmaxid, nminid)
values (9, 'ŵ����N97', '������ʽ��WCDMA(3G),GSM 850/900/1800/1900,HSDPA �ֻ����Σ����� �����ߴ磺3.5Ӣ�� ����������640��360����16:9�Ĵ���ʽ���� ϵͳ��Symbian 9.4,Series 60��5�� GPS��λϵͳ��֧��GPS,����A-GPS�������͵���ָ����,ŵ����2.0��ͼ���,֧��Ovi��ͼ(Maps on Ovi) ����ͷ���أ�500������ ', 48100, 'upload/9.jpg', '1',  '2001-11-11 14:52:22', 1, 3);
insert into T_MC (nid, sname, sdescription, nprice, simg, smctag, dcdate, nmaxid, nminid)
values (10, '����IXUS870', '��Ч���أ�1000������ ��ѧ�佹������4����ѧ�佹 ���������ͣ�CCD������ �������ߴ磺1/2.3Ӣ�� ���ֱ��ʣ�3648��2736 Һ�����ߴ磺3.0Ӣ�� ', 2420, 'upload/10.jpg', '0', '2001-11-11 14:52:22', 2, 6);
insert into T_MC (nid, sname, sdescription, nprice, simg, smctag, dcdate, nmaxid, nminid)
values (11, '����W170', '��Ч���أ�1010������ ��ѧ�佹������5����ѧ�佹 ���������ͣ�CCD������ �������ߴ磺1/2.3Ӣ�� ���ֱ��ʣ�3648��2736 Һ�����ߴ磺2.7Ӣ�� ', 1630, 'upload/11.jpg', '0', '2001-11-11 14:52:22', 2, 6);
insert into T_MC (nid, sname, sdescription, nprice, simg, smctag, dcdate, nmaxid, nminid)
values (12, 'JVC GZ-MG330', '���������أ�80������ ��ѧ�佹������35����ѧ�佹 ���������ͣ�CCD������ �ߴ磺54��113��68mm ������315g ', 2950, 'upload/12.jpg', '0', '2001-11-11 14:52:22', 2, 7);
commit;

quit;