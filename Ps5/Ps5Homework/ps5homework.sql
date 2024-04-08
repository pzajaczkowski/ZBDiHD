-- PRACA DOMOWA PIOTR ZAJACZKOWSKI

-- ZADANIE 1
-- Dla każdego odwiedzanego państwa
-- (City.country) wyznacz ranking malejący względem
-- liczby wizyt. Następnie dla każdego państwa, z którego
-- pochodzi odwiedzający
-- (VisitorCountry.visitor_country) wyznacz
-- ranking malejący względem liczby odwiedzających. Wynik
-- powinien zawierać zestawienie państw, które są na tym
-- samym miejscu w obu rankingach, czyli np. Spain oraz
-- Poland otrzymały tę samą wartość rankingu równą 1.

SELECT VISIT.COUNTRY,
       VISITORS.VISITOR_COUNTRY,
       VISITORS.VISITS_RANKING
FROM (SELECT C.COUNTRY,
             DENSE_RANK() OVER (ORDER BY SUM(V.NUMBER_OF_VISITS) DESC) AS VISITS_RANKING
      FROM VISIT V
               JOIN CITY C ON C.ID_CITY = V.ID_CITY
      GROUP BY C.COUNTRY) VISIT,
     (SELECT VC.VISITOR_COUNTRY,
             DENSE_RANK() OVER (ORDER BY SUM(V.NUMBER_OF_VISITORS) DESC) AS VISITS_RANKING
      FROM VISIT V
               JOIN VISITORCOUNTRY VC ON VC.ID_COUNTRY = V.ID_COUNTRY
      GROUP BY VC.VISITOR_COUNTRY) VISITORS
WHERE VISIT.VISITS_RANKING = VISITORS.VISITS_RANKING

-- ZADANIE 2
-- Dla każdego typu wizyty (VisitType.description),
-- roku i miesiąca wyznacz zysk. Następnie w ramach każdego typu
-- wizyty wyznacz średnią (w oparciu o jeden wiersz poprzedni i dwa
-- następne). Dodatkowo wyznacz wartość zysku dla każdego typu wizyty
-- z pominięciem wymiaru czasu. Odpowiednio sformatuj kolumny
-- dodając etykiety oraz formatowanie kolumn PROFIT i AVERAGE.

SELECT VT.DESCRIPTION                                                                                AS VISIT_TYPE,
       DECODE(T.YEAR, NULL, 'SUMMARY:', T.YEAR)                                                      AS YEAR,
       DECODE(T.MONTH, NULL, '-------', T.MONTH)                                                        AS MONTH,
       TO_CHAR(SUM(V.PROFIT), '$9999.9')                                                             AS PROFIT,
       DECODE(T.MONTH, NULL, '-------', ROUND(AVG(SUM(V.PROFIT))
                                                 OVER (PARTITION BY VT.DESCRIPTION
                                                     ORDER BY T.YEAR, T.MONTH
                                                     ROWS BETWEEN 1 PRECEDING AND 2 FOLLOWING ), 2)) AS AVERAGE
FROM VISIT V
         JOIN VISITTYPE VT ON VT.ID_VISIT_TYPE = V.ID_VISIT_TYPE
         JOIN TIME T ON T.ID_TIME = V.ID_TIME
GROUP BY GROUPING SETS ( (VT.DESCRIPTION, T.YEAR, T.MONTH), VT.DESCRIPTION)
ORDER BY VT.DESCRIPTION, T.YEAR, T.MONTH

-- ZADANIE 3
-- Dla każdego odwiedzanego kontynentu (City.continent) oraz typu wizyty (VisitType), wyznacz liczbę
-- odwiedzających oraz śrenią liczbę odwiedzających. Dane przedstaw w postaci tabeli przestawnej. Dodatkowo dodaj
-- podsumowania oraz odpowiednie etykiety.

SELECT *
FROM (SELECT DECODE(C.CONTINENT, NULL, 'TOTAL:', C.CONTINENT)                    AS CONTINENT,
             DECODE(UPPER(VT.DESCRIPTION), NULL, 'TOTAL', UPPER(VT.DESCRIPTION)) AS VISIT_TYPE,
             SUM(V.NUMBER_OF_VISITS)                                             AS SUM_VISITORS,
             ROUND(AVG(V.NUMBER_OF_VISITS), 2)                                   AS AVG_VISITORS
      FROM VISIT V
               JOIN CITY C ON C.ID_CITY = V.ID_CITY
               JOIN VISITTYPE VT ON VT.ID_VISIT_TYPE = V.ID_VISIT_TYPE
      GROUP BY CUBE (C.CONTINENT, VT.DESCRIPTION))
    PIVOT (SUM(SUM_VISITORS) AS SUM, AVG(AVG_VISITORS) AS AVG FOR VISIT_TYPE
    IN ('BUSINESS', 'INDIVIDUAL', 'ORGANIZED GROUP', 'TOTAL'))
ORDER BY 1

-- ZADANIE 4
-- Dla każdego roku i rodzaju zakwaterowania
-- wyznacz zysk. Następnie w ramach każdego roku wybierz
-- rekordy reprezentujące zakwaterowanie z pierwszej
-- ćwiartki (podział rekordów na ćwiartki powinien być
-- wyznaczony zgodnie z zyskiem malejąco). Dla każdego
-- roku i wybranych rekordów z pierwszej ćwiartki policz zysk
-- oraz udział tych zysków w stosunku do zysku całkowitego
-- (dla wszystkich lat łącznie).

SELECT YEAR,
       SUM(PROFIT)                                                 AS QUARTER_PROFIT,
       ROUND(RATIO_TO_REPORT(SUM(PROFIT)) OVER () * 100, 1) || '%' AS PERCENTAGE
FROM (SELECT T.YEAR,
             A.NAME                                                          AS ACCOMODATION_TYPE,
             SUM(V.PROFIT)                                                   AS PROFIT,
             NTILE(4) OVER (PARTITION BY T.YEAR ORDER BY SUM(V.PROFIT) DESC) AS CWIARTKA
      FROM VISIT V
               JOIN TIME T ON T.ID_TIME = V.ID_TIME
               JOIN ACCOMMODATIONTYPE A ON A.ID_TYPE = V.ID_TYPE
      GROUP BY T.YEAR, A.NAME)
WHERE CWIARTKA = 1
GROUP BY YEAR

-- ZADANIE 5
-- Dla każdego państwa, z którego pochodzi
-- odwiedzający (VisitorCountry.visitor_country),
-- oraz państwa odwiedzanego (City.country) wyznacz
-- liczbę odwiedzających. Następnie w ramach państwa, z
-- którego pochodzi odwiedzający wyznacz udział
-- odwiedzających dla każdego odwiedzanego państwa.
-- Uwaga: wynik powinien zawierać listę wszystkich możliwych
-- państw z tabeli VisitorCountry, nawet jeśli nie było
-- jeszcze z danego kraju odwiedzających (w przykładzie
-- poniżej jest to Meksyk, Peru i Tunezja). Odpowiednio
-- sformatuj wynik zapytania.

SELECT VC.VISITOR_COUNTRY,
       DECODE(C.COUNTRY, NULL, '--NO DATA--', C.COUNTRY)                                                          AS COUNTRY_TO_VISIT,
       DECODE(SUM(V.NUMBER_OF_VISITORS), NULL, 0,
              SUM(V.NUMBER_OF_VISITORS))                                                                          AS VISITORS,
       TO_CHAR(DECODE(C.COUNTRY, NULL, 0, RATIO_TO_REPORT(SUM(V.NUMBER_OF_VISITORS))
                                                          OVER (PARTITION BY VC.VISITOR_COUNTRY) * 100),
               '990.9')                                                                                           AS PERCENTAGE
FROM VISITORCOUNTRY VC
         LEFT JOIN VISIT V ON VC.ID_COUNTRY = V.ID_COUNTRY
         LEFT JOIN CITY C ON C.ID_CITY = V.ID_CITY
GROUP BY VC.VISITOR_COUNTRY, C.COUNTRY
ORDER BY 1, 2