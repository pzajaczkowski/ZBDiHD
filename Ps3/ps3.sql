SELECT DISTINCT ORDERDATE,
                EXTRACT(DAY FROM ORDERDATE)          AS MONTH_DAY,
                EXTRACT(MONTH FROM ORDERDATE)        AS MONTH_NUMBER,
                EXTRACT(YEAR FROM ORDERDATE)         AS YEAR,
                TO_NUMBER(TO_CHAR(ORDERDATE, 'D'))   AS WEEK_DAY,
                TO_NUMBER(TO_CHAR(ORDERDATE, 'WW'))  AS WEEK_NUBMBER,
                TO_CHAR(ORDERDATE, 'MONTH')          AS MONTH_NAME,
                TO_NUMBER(TO_CHAR(ORDERDATE, 'Q'))   AS QUARTER,
                TO_NUMBER(TO_CHAR(ORDERDATE, 'DDD')) AS YEAR_DAY,
                TO_CHAR(ORDERDATE, 'DAY')            AS WEEK_DAY_NAME,
                CASE
                    WHEN TO_NUMBER(TO_CHAR(ORDERDATE, 'D')) IN (6, 7) THEN 1
                    ELSE 0 END                       AS IS_WEEKEND
FROM ORDERS
UNION
SELECT DISTINCT SHIPDATE,
                EXTRACT(DAY FROM SHIPDATE)          AS MONTH_DAY,
                EXTRACT(MONTH FROM SHIPDATE)        AS MONTH_NUMBER,
                EXTRACT(YEAR FROM SHIPDATE)         AS YEAR,
                TO_NUMBER(TO_CHAR(SHIPDATE, 'D'))   AS WEEK_DAY,
                TO_NUMBER(TO_CHAR(SHIPDATE, 'WW'))  AS WEEK_NUBMBER,
                TO_CHAR(SHIPDATE, 'MONTH')          AS MONTH_NAME,
                TO_NUMBER(TO_CHAR(SHIPDATE, 'Q'))   AS QUARTER,
                TO_NUMBER(TO_CHAR(SHIPDATE, 'DDD')) AS YEAR_DAY,
                TO_CHAR(SHIPDATE, 'DAY')            AS WEEK_DAY_NAME,
                CASE
                    WHEN TO_NUMBER(TO_CHAR(SHIPDATE, 'D')) IN (6, 7) THEN 1
                    ELSE 0 END                       AS IS_WEEKEND
FROM ORDERS;
