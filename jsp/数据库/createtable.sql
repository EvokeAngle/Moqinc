create table T_MC_TYPE
(
  nid   NUMBER,
  sname VARCHAR2(30),
  npid  NUMBER
);

comment on table T_MC_TYPE
  is '商品类别表';
comment on column T_MC_TYPE.nid
  is '编号';
comment on column T_MC_TYPE.sname
  is '名称';
comment on column T_MC_TYPE.npid
  is '父类编号';
  
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
  is '商品信息表';
comment on column T_MC.nid
  is '商品编号';
comment on column T_MC.sname
  is '商品名称';
comment on column T_MC.sdescription
  is '商品描述';
comment on column T_MC.nprice
  is '商品价格';
comment on column T_MC.simg
  is '商品图片';
comment on column T_MC.smctag
  is '是否缺贷';
comment on column T_MC.dcdate
  is '添加时间';
comment on column T_MC.nmaxid
  is '所属大类';
comment on column T_MC.nminid
  is '所属小类';
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
  is '订单表';
comment on column T_ORDER.nid
  is '订单编号';
comment on column T_ORDER.scuser
  is '下单人用户名';
comment on column T_ORDER.dgdate
  is '下单时间';
comment on column T_ORDER.spaytype
  is '付款方式';
comment on column T_ORDER.ssendtype
  is '收货方式';
comment on column T_ORDER.nmctypesize
  is '商品种类数';
comment on column T_ORDER.nmcsize
  is '商品总个数';
comment on column T_ORDER.ntotalprice
  is '订单总金额';
comment on column T_ORDER.sstatus
  is '审核状态';
comment on column T_ORDER.smsg
  is '审核反馈信息';
comment on column T_ORDER.sauser
  is '审核人';
comment on column T_ORDER.dadate
  is '审核时间';
comment on column T_ORDER.ssname
  is '收贷人姓名';
comment on column T_ORDER.ssaddress
  is '收贷人地址';
comment on column T_ORDER.sscode
  is '收贷人邮编';
comment on column T_ORDER.ssphone
  is '收贷人联系电话';
comment on column T_ORDER.ssemail
  is '收贷人email';
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
  is '订单条目表';
comment on column T_ORDER_ITEM.nid
  is '条目编号';
comment on column T_ORDER_ITEM.norderid
  is '所属的订单编号';
comment on column T_ORDER_ITEM.nmcid
  is '订购的商品编号';
comment on column T_ORDER_ITEM.smcname
  is '商品名';
comment on column T_ORDER_ITEM.sdescription
  is '商品简述';
comment on column T_ORDER_ITEM.simg
  is '商品图片';
comment on column T_ORDER_ITEM.ncount
  is '商品数';
comment on column T_ORDER_ITEM.nprice
  is '商品单价';
comment on column T_ORDER_ITEM.ntotalprice
  is '小计';
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
  is '用户表';
comment on column T_USER.suser
  is '用户名';
comment on column T_USER.spwd
  is '密码';
comment on column T_USER.sname
  is '真实姓名';
comment on column T_USER.ssex
  is '性别';
comment on column T_USER.sbirthday
  is '年龄';
comment on column T_USER.semail
  is '电子邮箱';
comment on column T_USER.sphone
  is '电话号码';
comment on column T_USER.saddress
  is '地址';
comment on column T_USER.scode
  is '邮编';
comment on column T_USER.nlevel
  is '权限级别';
comment on column T_USER.dregdate
  is '注册时间';
comment on column T_USER.slock
  is '是否冻结';
comment on column T_USER.dlastdate
  is '最后登录时间';
comment on column T_USER.nlogin
  is '登录次数';
alter table T_USER add primary key (SUSER);
  
insert into T_USER (suser, spwd, sname, ssex, sbirthday, semail, sphone, saddress, scode, nlevel, dregdate, slock, dlastdate, nlogin)
values ('test1', '888888', '溥洋', '男', '2002-11-11 14:52:22', 'min@softfz.com', '0591-87888928', '福州市台江', '350001', 2, '2000-11-11 14:52:22', '正常', '2002-11-11 14:52:22', 1);
insert into T_USER (suser, spwd, sname, ssex, sbirthday, semail, sphone, saddress, scode, nlevel, dregdate, slock, dlastdate, nlogin)
values ('test2', '888888', '张丽', '女', '2002-11-11 14:52:22', 'lili@softfz.com', '0593-23232372', '福州市仓山', '350010', 2, '2001-12-11 11:52:22', '正常', '2002-11-11 14:52:22', 0);
insert into T_USER (suser, spwd, sname, ssex, sbirthday, semail, sphone, saddress, scode, nlevel, dregdate, slock, dlastdate, nlogin)
values ('test3', '888888', '张玉龙', '男', '2002-11-11 14:52:22', 'jaky@softfz.com', '0592-82123372', '厦门市集美', '350030', 2, '2001-11-11 14:52:22', '正常', '1991-11-12 14:52:22', 1);
insert into T_USER (suser, spwd, sname, ssex, sbirthday, semail, sphone, saddress, scode, nlevel, dregdate, slock, dlastdate, nlogin)
values ('test4', '888888', '小张', '男', '2002-11-11 14:52:22', 'xuxun@softfz.com', '0595-8323372', '厦门市集美', '350120', 2, '2001-01-11 14:52:22', '正常', '2001-11-11 14:52:22', 0);
insert into T_USER (suser, spwd, sname, ssex, sbirthday, semail, sphone, saddress, scode, nlevel, dregdate, slock, dlastdate, nlogin)
values ('test5', '888888', '张巧玲', '女', '2002-11-11 14:52:22', 'qiaolin@softfz.com', '0591-62365898', '福州市鼓楼', '351010', 2, '2001-11-11 14:52:22', '正常', '2001-11-11 14:52:22', 1);
insert into T_USER (suser, spwd, sname, ssex, sbirthday, semail, sphone, saddress, scode, nlevel, dregdate, slock, dlastdate, nlogin)
values ('test6', '888888', '张林', '女', '2002-11-11 14:52:22', 'linzhen@softfz.com', '0591-23365898', null, '350510', 2, '2001-11-11 14:52:22', '正常', '2001-02-11 14:52:22', 1);
insert into T_USER (suser, spwd, sname, ssex, sbirthday, semail, sphone, saddress, scode, nlevel, dregdate, slock, dlastdate, nlogin)
values ('test7', '888888', '徐飞', '男', '2002-11-11 14:52:22', 'yunfei@softfz.com', '0591-32365898', '福州市福安', '350070', 2, '1999-11-11 14:52:22', '正常', '2001-11-11 14:52:22', 1);
insert into T_USER (suser, spwd, sname, ssex, sbirthday, semail, sphone, saddress, scode, nlevel, dregdate, slock, dlastdate, nlogin)
values ('test8', '888888', '小林', '男', '2002-11-11 14:52:22', 'lin@softfz.com', '0591-32565898', '福州市晋安', '350070', 2, '2001-11-11 14:52:22', '冻结', '2001-05-11 14:52:22', 1);
insert into T_USER (suser, spwd, sname, ssex, sbirthday, semail, sphone, saddress, scode, nlevel, dregdate, slock, dlastdate, nlogin)
values ('test9', '888888', '陈飞', '男', '2002-11-11 14:52:22', 'chen@softfz.com', '0591-32323898', '福州市长乐', '350020', 2, '2001-11-11 14:52:22', '正常', '2001-11-11 14:52:22', 1);
insert into T_USER (suser, spwd, sname, ssex, sbirthday, semail, sphone, saddress, scode, nlevel, dregdate, slock, dlastdate, nlogin)
values ('test10', '888888', '李宁', '女', '2002-11-11 14:52:22', 'nin@softfz.com', '0591-82365898', '福州市闽候', '350090', 2, '2008-11-11 14:52:22', '正常', '2001-03-11 14:52:22', 1);
insert into T_USER (suser, spwd, sname, ssex, sbirthday, semail, sphone, saddress, scode, nlevel, dregdate, slock, dlastdate, nlogin)
values ('test11', '888888', '宇凡', '男', '2002-11-11 14:52:22', 'fan@softfz.com', '0591-32323838', '福州市福安', '350020', 2, '2001-11-11 14:52:22', '正常', '2001-11-11 14:52:22', 1);
insert into T_USER (suser, spwd, sname, ssex, sbirthday, semail, sphone, saddress, scode, nlevel, dregdate, slock, dlastdate, nlogin)
values ('test12', '888888', '李琴', '女', '2002-11-11 14:52:22', 'qin@softfz.com', '0591-32323898', null, '350020', 2, '2001-11-11 14:52:22', '正常', '2001-11-11 14:52:22', 1);
commit;


insert into T_MC_TYPE (nid, sname, npid)
values (1, '电脑', 0);
insert into T_MC_TYPE (nid, sname, npid)
values (2, '数码产品', 0);
insert into T_MC_TYPE (nid, sname, npid)
values (3, '台式机', 1);
insert into T_MC_TYPE (nid, sname, npid)
values (4, '笔记本', 1);
insert into T_MC_TYPE (nid, sname, npid)
values (5, '撑上电脑', 1);
insert into T_MC_TYPE (nid, sname, npid)
values (6, '数码照像机', 2);
insert into T_MC_TYPE (nid, sname, npid)
values (7, '数码摄像机', 2);
commit;



insert into T_MC (nid, sname, sdescription, nprice, simg, smctag, dcdate, nmaxid, nminid)
values (1, '联想 IdeaPad Y430A-TFI', '属于联想 Y430系列  处理器:Intel Core2 Duo(Merom) T5800(2.0G)/硬盘容量:250GB/屏幕尺寸:14.1英寸/显示芯片:独立,nVidia Geforce 9300M GS/重量:约2.35Kg', 5500, 'upload/1.jpg', '0', '2001-11-11 14:52:22', 1, 4);
insert into T_MC (nid, sname, sdescription, nprice, simg, smctag, dcdate, nmaxid, nminid)
values (2, '联想 IdeaPad Y430A-PEI', '属于联想 Y430系列  处理器:Intel Core2 Duo(Penryn) P8400(2.26G)/硬盘容量:320GB/屏幕尺寸:14.1英寸/显示芯片:独立,nVidia Geforce 9300M GS/重量:约2.36Kg', 9999, 'upload/2.jpg', '0', '2001-11-11 14:52:22', 1, 4);
insert into T_MC (nid, sname, sdescription, nprice, simg, smctag, dcdate, nmaxid, nminid)
values (3, '联想 3000 G430L-TON', '属于联想 G430系列  处理器:Intel Celeron Dual-Core(Merom) T1600(1.66G)/硬盘容量:160GB/屏幕尺寸:14.1英寸/显示芯片:集成,集成Intel GMA X4500 HD高性能显卡(GL40)/重量:约2.4Kg ', 2999, 'upload/3.jpg', '0', '2001-11-11 14:52:22', 1, 4);
insert into T_MC (nid, sname, sdescription, nprice, simg, smctag, dcdate, nmaxid, nminid)
values (4, '惠普 EliteBook 6930p', '处理器：Intel Core2 Duo(Penryn) T9400(2.53G) 主板芯片组：Intel PM45+ICH9M 内存容量：4096MB 硬盘容量：2×250GB 屏幕尺寸：14.1英寸 显示芯片：独立,ATI Mobility Radeon HD3450 重量：约2.1Kg', 9000, 'upload/4.jpg', '0', '2001-11-11 14:52:22', 1, 4);
insert into T_MC (nid, sname, sdescription, nprice, simg, smctag, dcdate, nmaxid, nminid)
values (5, '华硕 F8Sg F8H239Sg-SL', '处理器：Intel Pentium Dual-Core(Merom) T2390(1.86G) 主板芯片组：Intel PM965+ICH8M 内存容量：1024MB 硬盘容量：200GB 屏幕尺寸：14英寸 显示芯片：独立,nVidia Geforce 9300M G 重量：约2.59Kg', 6000, 'upload/5.jpg', '0', '2001-11-11 14:52:22', 1, 4);
insert into T_MC (nid, sname, sdescription, nprice, simg, smctag, dcdate, nmaxid, nminid)
values (6, '戴尔 Latitude E6400', '处理器：Intel Core2 Duo(Penryn) SP9400(2.4G) 主板芯片组：Intel GM45+ICH9M 内存容量：2048MB 硬盘容量：160GB 屏幕尺寸：13.3英寸 显示芯片：集成,Intel Mobile GMA X4500 HD 重量：约1.5Kg ', 14589, 'upload/6.jpg', '0', '2001-11-11 14:52:22', 1, 4);
insert into T_MC (nid, sname, sdescription, nprice, simg, smctag, dcdate, nmaxid, nminid)
values (7, '联想 Kx6600', '类型：家用台式机 处理器：Intel Core2 Duo E7200 2.53GHz 内存容量：2048MB 硬盘容量：320GB 光驱：DVD±RW 显示器：宽屏液晶 22寸', 6599, 'upload/7.jpg', '0', '2001-11-11 14:52:22', 1, 3);
insert into T_MC (nid, sname, sdescription, nprice, simg, smctag, dcdate, nmaxid, nminid)
values (8, '惠普 a6405cn', '类型：家用台式机 处理器：Intel Pentium E2200 2.2G 内存容量：2048MB 硬盘容量：250GB 光驱：16X DVD光驱 显示器：宽屏液晶 22寸', 5999, 'upload/8.jpg', '1', '2001-11-11 14:52:22', 1, 3);
insert into T_MC (nid, sname, sdescription, nprice, simg, smctag, dcdate, nmaxid, nminid)
values (9, '诺基亚N97', '网络制式：WCDMA(3G),GSM 850/900/1800/1900,HSDPA 手机外形：滑盖 主屏尺寸：3.5英寸 主屏参数：640×360像素16:9的触摸式宽屏 系统：Symbian 9.4,Series 60第5版 GPS定位系统：支持GPS,内置A-GPS传感器和电子指南针,诺基亚2.0地图软件,支持Ovi地图(Maps on Ovi) 摄像头像素：500万像素 ', 48100, 'upload/9.jpg', '1',  '2001-11-11 14:52:22', 1, 3);
insert into T_MC (nid, sname, sdescription, nprice, simg, smctag, dcdate, nmaxid, nminid)
values (10, '佳能IXUS870', '有效像素：1000万像素 光学变焦倍数：4倍光学变焦 传感器类型：CCD传感器 传感器尺寸：1/2.3英寸 最大分辨率：3648×2736 液晶屏尺寸：3.0英寸 ', 2420, 'upload/10.jpg', '0', '2001-11-11 14:52:22', 2, 6);
insert into T_MC (nid, sname, sdescription, nprice, simg, smctag, dcdate, nmaxid, nminid)
values (11, '索尼W170', '有效像素：1010万像素 光学变焦倍数：5倍光学变焦 传感器类型：CCD传感器 传感器尺寸：1/2.3英寸 最大分辨率：3648×2736 液晶屏尺寸：2.7英寸 ', 1630, 'upload/11.jpg', '0', '2001-11-11 14:52:22', 2, 6);
insert into T_MC (nid, sname, sdescription, nprice, simg, smctag, dcdate, nmaxid, nminid)
values (12, 'JVC GZ-MG330', '传感器像素：80万像素 光学变焦倍数：35倍光学变焦 传感器类型：CCD传感器 尺寸：54×113×68mm 重量：315g ', 2950, 'upload/12.jpg', '0', '2001-11-11 14:52:22', 2, 7);
commit;

quit;