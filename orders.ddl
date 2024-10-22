-- Generated by Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   at:        2024-06-25 20:25:31 EEST
--   site:      Oracle Database 21c
--   type:      Oracle Database 21c



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE customers (
    customerno   VARCHAR2(10 BYTE) NOT NULL,
    customername VARCHAR2(100) NOT NULL
);

ALTER TABLE customers ADD CONSTRAINT customers_pk PRIMARY KEY ( customerno );

CREATE TABLE orderlines (
    lineno            NUMBER(5) NOT NULL,
    orders_orderno    VARCHAR2(10 BYTE) NOT NULL,
    amount            NUMBER NOT NULL,
    pcs               NUMBER(10) NOT NULL,
    product_productid VARCHAR2(16) NOT NULL
);

ALTER TABLE orderlines ADD CONSTRAINT orderlines_pk PRIMARY KEY ( lineno,
                                                                  orders_orderno );

CREATE TABLE orders (
    orderno              VARCHAR2(10 BYTE) NOT NULL,
    orderdate            DATE NOT NULL,
    customers_customerno VARCHAR2(10 BYTE) NOT NULL
);

COMMENT ON COLUMN orders.orderno IS
    'Orderno identifies an order';

ALTER TABLE orders ADD CONSTRAINT orders_pk PRIMARY KEY ( orderno );

CREATE TABLE productgroups (
    groupname   VARCHAR2(100 BYTE) NOT NULL,
    description VARCHAR2(200 BYTE) NOT NULL
);

ALTER TABLE productgroups ADD CONSTRAINT productgroups_pk PRIMARY KEY ( groupname );

CREATE TABLE products (
    productid   VARCHAR2(16) NOT NULL,
    productname VARCHAR2(100) NOT NULL,
    description VARCHAR2(200) NOT NULL,
    groupname   VARCHAR2(100 BYTE) NOT NULL,
    price       NUMBER(10, 2) NOT NULL
);

ALTER TABLE products ADD CONSTRAINT product_pk PRIMARY KEY ( productid );

ALTER TABLE orderlines
    ADD CONSTRAINT orderlines_orders_fk FOREIGN KEY ( orders_orderno )
        REFERENCES orders ( orderno );

ALTER TABLE orderlines
    ADD CONSTRAINT orderlines_products_fk FOREIGN KEY ( product_productid )
        REFERENCES products ( productid );

ALTER TABLE orders
    ADD CONSTRAINT orders_customers_fk FOREIGN KEY ( customers_customerno )
        REFERENCES customers ( customerno );

ALTER TABLE products
    ADD CONSTRAINT products_productgroups_fk FOREIGN KEY ( groupname )
        REFERENCES productgroups ( groupname );



-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                             5
-- CREATE INDEX                             0
-- ALTER TABLE                              9
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
