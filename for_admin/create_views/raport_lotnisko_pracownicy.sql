SET SEARCH_PATH to manager_lotniczy;

CREATE OR REPLACE VIEW raport_lotnisko_pracownicy AS
    WITH pracownicy_sklepu AS (
        SELECT
            l."ICAO" as "ps_ICAO",
            SUM(CASE WHEN psf.funkcja_id = 1 THEN 1 ELSE 0 END)::integer as kierownik_sklepu,
            SUM(CASE WHEN psf.funkcja_id = 2 THEN 1 ELSE 0 END)::integer as barman,
            SUM(CASE WHEN psf.funkcja_id = 3 THEN 1 ELSE 0 END)::integer as kelner,
            SUM(CASE WHEN psf.funkcja_id = 4 THEN 1 ELSE 0 END)::integer as kucharz,
            SUM(CASE WHEN psf.funkcja_id = 5 THEN 1 ELSE 0 END)::integer as personel_sprzatajacy,
            SUM(CASE WHEN psf.funkcja_id = 6 THEN 1 ELSE 0 END)::integer as sprzedawca
        from
            sklep s
        inner join lotnisko l on s."lotnisko_ICAO" = l."ICAO"
        inner join pracownik_sklep_funkcja psf on s."id" = psf."sklep_id"
        GROUP BY l."ICAO"
    ),
    prcownicy_lotniska AS (
        SELECT
            l."ICAO" as "pl_ICAO",
            concat('(', l."ICAO",'/', l."IATA", ') ', l.nazwa ,' - ', l.miasto) as nazwa_lotniska,
            SUM(CASE WHEN plf.funkcja_id = 1 THEN 1 ELSE 0 END)::integer as agent_obsługi_naziemnej_odprawa_biletowa,
            SUM(CASE WHEN plf.funkcja_id = 2 THEN 1 ELSE 0 END)::integer as agent_obsługi_naziemnej_obsługa_bagażu,
            SUM(CASE WHEN plf.funkcja_id = 3 THEN 1 ELSE 0 END)::integer as agent_obsługi_naziemnej_informacyjne,
            SUM(CASE WHEN plf.funkcja_id = 4 THEN 1 ELSE 0 END)::integer as agent_obsługi_naziemnej_pomoc_dla_pasażerów,
            SUM(CASE WHEN plf.funkcja_id = 5 THEN 1 ELSE 0 END)::integer as ochrona,
            SUM(CASE WHEN plf.funkcja_id = 6 THEN 1 ELSE 0 END)::integer as specjalista_bezpieczeństwa,
            SUM(CASE WHEN plf.funkcja_id = 7 THEN 1 ELSE 0 END)::integer as pracownik_biurowy,
            SUM(CASE WHEN plf.funkcja_id = 8 THEN 1 ELSE 0 END)::integer as personel_administracyjny,
            SUM(CASE WHEN plf.funkcja_id = 9 THEN 1 ELSE 0 END)::integer as kontroler_bezpieczeństwa,
            SUM(CASE WHEN plf.funkcja_id = 10 THEN 1 ELSE 0 END)::integer as planista_lotów,
            SUM(CASE WHEN plf.funkcja_id = 11 THEN 1 ELSE 0 END)::integer as agent_obsługi_naziemnej_zarządzanie_lotami
        FROM pracownik_lotnisko_funkcja plf
        INNER JOIN lotnisko l on plf."lotnisko_ICAO" = l."ICAO"
        GROUP BY l."ICAO"
    )
    SELECT *
    FROM
        pracownicy_sklepu ps
    inner join prcownicy_lotniska pl on ps."ps_ICAO" = pl."pl_ICAO";
