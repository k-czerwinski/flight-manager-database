SET SEARCH_PATH to manager_lotniczy;

CREATE OR REPLACE VIEW sklep_widok
AS
    SELECT s."nazwa_sklepu", ks."nazwa_kategorii", ks."id" AS kategoria_id, concat(l."ICAO",'/',l."IATA",' ', l."miasto") as lotnisko, l."ICAO" as ICAO
    FROM sklep s
    INNER JOIN kategoria_sklepu ks ON s."kategoria_id" = ks."id"
    INNER JOIN lotnisko l on s."lotnisko_ICAO" = l."ICAO";