/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2024/10/16 9:51:34                           */
/*==============================================================*/


/*==============================================================*/
/* Table: administrator                                         */
/*==============================================================*/
create table administrator
(
   administrator_id     int not null  comment '',
   user_id              int  comment '',
   phone_num            char(11) not null  comment '',
   primary key (administrator_id)
);

/*==============================================================*/
/* Table: canteen                                               */
/*==============================================================*/
create table canteen
(
   canteen_id           int not null  comment '',
   canteen_name         char(10) not null  comment '',
   canteen_address      char(20) not null  comment '',
   shop_num             int not null  comment '',
   primary key (canteen_id)
);

/*==============================================================*/
/* Table: dishes                                                */
/*==============================================================*/
create table dishes
(
   dish_id              int not null  comment '',
   shop_id              int  comment '',
   dish_type            char(10) not null  comment '',
   dish_price           float(5) not null  comment '',
   dish_cost            float(5) not null  comment '',
   primary key (dish_id)
);

/*==============================================================*/
/* Table: "order"                                               */
/*==============================================================*/
create table `order`
(
   order_id             int not null  comment '',
   order_status         char(10) not null  comment '',
   order_time           datetime not null  comment '',
   order_shop           char(10) not null  comment '',
   order_dishes         char(10) not null  comment '',
   order_address        char(20) not null  comment '',
   primary key (order_id)
);

/*==============================================================*/
/* Table: order_create                                          */
/*==============================================================*/
create table order_create
(
   regular_id           int not null  comment '',
   order_id             int not null  comment '',
   order_time           datetime not null  comment '',
   primary key (regular_id, order_id)
);

/*==============================================================*/
/* Table: order_handle                                          */
/*==============================================================*/
create table order_handle
(
   order_id             int not null  comment '',
   shopper_id           int not null  comment '',
   handle_time          datetime not null  comment '',
   primary key (order_id, shopper_id)
);

/*==============================================================*/
/* Table: regular_user                                          */
/*==============================================================*/
create table regular_user
(
   regular_id           int not null  comment '',
   user_id              int  comment '',
   phone_num            char(11) not null  comment '',
   user_address         char(20) not null  comment '',
   primary key (regular_id)
);

/*==============================================================*/
/* Table: shop                                                  */
/*==============================================================*/
create table shop
(
   shop_id              int not null  comment '',
   canteen_id           int  comment '',
   shopper_id           int  comment '',
   shop_name            char(10) not null  comment '',
   shop_address         char(20) not null  comment '',
   shop_time            datetime not null  comment '',
   primary key (shop_id)
);

/*==============================================================*/
/* Table: shopper                                               */
/*==============================================================*/
create table shopper
(
   shopper_id           int not null  comment '',
   user_id              int  comment '',
   phone_num            char(11) not null  comment '',
   primary key (shopper_id)
);

/*==============================================================*/
/* Table: user                                                  */
/*==============================================================*/
create table user
(
   user_id              int not null  comment '',
   account              char(10) not null  comment '',
   password             char(6)  comment '',
   account_type         char(10) not null  comment '',
   primary key (user_id)
);

alter table administrator 
   drop foreign key FK_ADMINIST_USER_ADMI_USER;

alter table dishes 
   drop foreign key FK_DISHES_SHOP_DISH_SHOP;

alter table order_create 
   drop foreign key FK_ORDER_CR_ORDER_CRE_ORDER;

alter table order_create 
   drop foreign key FK_ORDER_CR_ORDER_CRE_REGULAR_;

alter table order_handle 
   drop foreign key FK_ORDER_HA_ORDER_HAN_SHOPPER;

alter table order_handle 
   drop foreign key FK_ORDER_HA_ORDER_HAN_ORDER;

alter table regular_user 
   drop foreign key FK_REGULAR__USER_REGU_USER;

alter table shop 
   drop foreign key FK_SHOP_CANTEEN_S_CANTEEN;

alter table shop 
   drop foreign key FK_SHOP_SHPPER_SH_SHOPPER;

alter table shopper 
   drop foreign key FK_SHOPPER_USER_SHOP_USER;

alter table administrator add constraint FK_ADMINIST_USER_ADMI_USER foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

alter table dishes add constraint FK_DISHES_SHOP_DISH_SHOP foreign key (shop_id)
      references shop (shop_id) on delete restrict on update restrict;

alter table order_create add constraint FK_ORDER_CR_ORDER_CRE_ORDER foreign key (order_id)
      references `order` (order_id) on delete restrict on update restrict;

alter table order_create add constraint FK_ORDER_CR_ORDER_CRE_REGULAR_ foreign key (regular_id)
      references regular_user (regular_id) on delete restrict on update restrict;

alter table order_handle add constraint FK_ORDER_HA_ORDER_HAN_SHOPPER foreign key (shopper_id)
      references shopper (shopper_id) on delete restrict on update restrict;

alter table order_handle add constraint FK_ORDER_HA_ORDER_HAN_ORDER foreign key (order_id)
      references `order` (order_id) on delete restrict on update restrict;

alter table regular_user add constraint FK_REGULAR__USER_REGU_USER foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

alter table shop add constraint FK_SHOP_CANTEEN_S_CANTEEN foreign key (canteen_id)
      references canteen (canteen_id) on delete restrict on update restrict;

alter table shop add constraint FK_SHOP_SHPPER_SH_SHOPPER foreign key (shopper_id)
      references shopper (shopper_id) on delete restrict on update restrict;

alter table shopper add constraint FK_SHOPPER_USER_SHOP_USER foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

