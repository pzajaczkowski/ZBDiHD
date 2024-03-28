DROP TABLE D_TIME;

CREATE TABLE D_TIME

(
    ID_TIME          NUMBER(4) PRIMARY KEY,

    ORDERDATE        DATE,

    DAY_NAME         VARCHAR2(13),

    WEEK_DAY_NUMBER  NUMBER(1),

    MONTH_DAY_NUMBER NUMBER(2),

    WEEK_NUMBER      NUMBER(2),

    YEAR_DAY_NUMBER  NUMBER(3),

    IS_WEEKEND       NUMBER(1),

    MONTH_NAME       VARCHAR2(12),

    MONTH_NUMBER     NUMBER(2),

    QUARTER          NUMBER(1),

    YEAR             NUMBER(4)

);


----------------FUNKCJA F_IS_WEEKEND----------------


CREATE OR REPLACE FUNCTION F_IS_WEEKEND(P_DATE DATE) RETURN NUMBER IS
    IS_WEEKEND NUMBER;
BEGIN
    SELECT CASE WHEN MOD(TO_CHAR(P_DATE, 'J'), 7) + 1 IN (6, 7) THEN 1 ELSE 0 END
    INTO IS_WEEKEND
    FROM DUAL;
    RETURN IS_WEEKEND;
END F_IS_WEEKEND;

/


DROP SEQUENCE S_D_TIME;

CREATE SEQUENCE S_D_TIME;

---------------------------------------------------------


DROP VIEW V_ORDER_DATES;

CREATE VIEW V_ORDER_DATES AS

SELECT DISTINCT ORDERDATE,

                TO_CHAR
                (ORDERDATE, 'DAY')
                    DAY_NAME,

                TO_NUMBER
                (TO_CHAR(ORDERDATE, 'D'))
                    WEEK_DAY_NUMBER,

                TO_NUMBER
                (TO_CHAR(ORDERDATE, 'DD'))
                    MONTH_DAY_NUMBER,

                TO_NUMBER
                (TO_CHAR(ORDERDATE, 'WW'))
                    WEEK_NUMBER,

                TO_NUMBER
                (TO_CHAR(ORDERDATE, 'DDD'))
                    YEAR_DAY_NUMBER,

                F_IS_WEEKEND
                (ORDERDATE)
                    IS_WEEKEND,

                TO_CHAR
                (ORDERDATE, 'MONTH')
                    MONTH_NAME,

                TO_NUMBER
                (TO_CHAR(ORDERDATE, 'MM'))
                    MONTH_NUMBER,

                TO_NUMBER
                (TO_CHAR(ORDERDATE, 'Q'))
                    QUARTER,

                TO_NUMBER
                (TO_CHAR(ORDERDATE, 'YYYY'))
                    YEAR_NUMBER

FROM ORDERS

UNION

SELECT DISTINCT SHIPDATE,

                TO_CHAR
                (SHIPDATE, 'DAY')
                    DAY_NAME,

                TO_NUMBER
                (TO_CHAR(SHIPDATE, 'D'))
                    WEEK_DAY_NUMBER,

                TO_NUMBER
                (TO_CHAR(SHIPDATE, 'DD'))
                    MONTH_DAY_NUMBER,

                TO_NUMBER
                (TO_CHAR(SHIPDATE, 'WW'))
                    WEEK_NUMBER,

                TO_NUMBER
                (TO_CHAR(SHIPDATE, 'DDD'))
                    YEAR_DAY_NUMBER,

                F_IS_WEEKEND
                (SHIPDATE)
                    IS_WEEKEND,

                TO_CHAR
                (SHIPDATE, 'MONTH')
                    MONTH_NAME,

                TO_NUMBER
                (TO_CHAR(SHIPDATE, 'MM'))
                    MONTH_NUMBER,

                TO_NUMBER
                (TO_CHAR(SHIPDATE, 'Q'))
                    QUARTER,

                TO_NUMBER
                (TO_CHAR(SHIPDATE, 'YYYY'))
                    YEAR_NUMBER

FROM ORDERS

WHERE SHIPDATE IS NOT NULL;

--------------------------------------------------------

CREATE OR REPLACE PROCEDURE P_LOAD_D_TIME IS

BEGIN

    MERGE
    INTO D_TIME T

    USING V_ORDER_DATES V

    ON (T.ORDERDATE = V.ORDERDATE)

    WHEN NOT MATCHED THEN

        INSERT
        VALUES (S_D_TIME.NEXTVAL,
                V.ORDERDATE,
                V.DAY_NAME,
                V.WEEK_DAY_NUMBER,
                V.MONTH_DAY_NUMBER,
                V.WEEK_NUMBER,
                V.YEAR_DAY_NUMBER,
                V.IS_WEEKEND,
                V.MONTH_NAME,
                V.MONTH_NUMBER,
                V.QUARTER,
                V.YEAR_NUMBER);

END;

/

BEGIN
    P_LOAD_D_TIME;
END;

COMMIT;