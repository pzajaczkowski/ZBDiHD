DROP TABLE ZIP CASCADE CONSTRAINTS;
CREATE TABLE ZIP
(
    ID_ZIP   NUMBER(5) PRIMARY KEY,
    ZIP_CODE VARCHAR2(5),
    STATE    VARCHAR2(2)
);

DROP TABLE TIME CASCADE CONSTRAINTS;
CREATE TABLE TIME
(
    ID_TIME NUMBER(4) PRIMARY KEY,
    MONTH   NUMBER(2),
    YEAR    NUMBER(4)
);

DROP TABLE SALE CASCADE CONSTRAINTS;
CREATE TABLE SALE
(
    ID_SALE     NUMBER PRIMARY KEY,
    ID_ZIP      NUMBER(5) REFERENCES ZIP (ID_ZIP),
    ID_TIME     NUMBER(4) REFERENCES TIME (ID_TIME),
    SALE_AMOUNT NUMBER
);

CREATE SEQUENCE S_ZIP;
CREATE SEQUENCE S_TIME;
CREATE SEQUENCE S_SALE;

DROP TRIGGER T_SET_ID_ZIP;
CREATE
    OR REPLACE TRIGGER T_SET_ID_ZIP
    BEFORE INSERT
    ON ZIP
    FOR EACH ROW
BEGIN
    :NEW
        .ID_ZIP := S_ZIP.NEXTVAL;
END;
/

DROP TRIGGER T_SET_ID_TIME;
CREATE
    OR REPLACE TRIGGER T_SET_ID_TIME
    BEFORE INSERT
    ON TIME
    FOR EACH ROW
BEGIN
    :NEW
        .ID_TIME := S_TIME.NEXTVAL;
END;
/

DROP TRIGGER T_SET_ID_SALE;
CREATE
    OR REPLACE TRIGGER T_SET_ID_SALE
    BEFORE INSERT
    ON SALE
    FOR EACH ROW
BEGIN
    :NEW
        .ID_SALE := S_SALE.NEXTVAL;
END;
/

CREATE OR REPLACE FUNCTION GET_PROFIT(P_STATE ORDERS.SHIPSTATE%TYPE) RETURN NUMBER IS
    PROFIT NUMBER;
BEGIN
    SELECT SUM(OI.QUANTITY * (B.RETAIL - B.COST))
    INTO PROFIT
    FROM BOOKS B
             JOIN ORDERITEMS OI ON B.ISBN = OI.ISBN
             JOIN
         ORDERS O ON OI.ORDER# = O.ORDER#
    WHERE UPPER(O.SHIPSTATE) = UPPER(P_STATE);
    RETURN PROFIT;
END;
/

SELECT DISTINCT O.SHIPSTATE, GET_PROFIT(O.SHIPSTATE)
FROM ORDERS O;