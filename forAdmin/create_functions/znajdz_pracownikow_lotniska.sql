SET SEARCH_PATH to manager_lotniczy;

CREATE OR REPLACE FUNCTION lotnisko_pracownicy(lotniskoICAO text)
    RETURNS table(
        ICAO char(4),
        nazwa_sklepu varchar(50),
        nazwa_kategorii varchar(40),
        kierownik_sklepu integer,
        barman integer,
        kelner integer,
        kucharz integer,
        personel_sprzatajacy integer,
        sprzedawca integer
        )
    AS
    $$
    BEGIN
        RETURN QUERY
        SELECT
            concat('(', l."ICAO",'/', l."IATA", ') ', l.nazwa ,' - ', l.miasto) as nazwa_lotniska,
            SUM(CASE WHEN psf.funkcja_id = 1 THEN 1 ELSE 0 END)::integer as kierownik_sklepu,
            SUM(CASE WHEN psf.funkcja_id = 2 THEN 1 ELSE 0 END)::integer as barman,
            SUM(CASE WHEN psf.funkcja_id = 3 THEN 1 ELSE 0 END)::integer as kelner,
            SUM(CASE WHEN psf.funkcja_id = 4 THEN 1 ELSE 0 END)::integer as kucharz,
            SUM(CASE WHEN psf.funkcja_id = 5 THEN 1 ELSE 0 END)::integer as personel_sprzatajacy,
            SUM(CASE WHEN psf.funkcja_id = 6 THEN 1 ELSE 0 END)::integer as sprzedawca
        FROM
            lotnisko l
            INNER JOIN sklep s ON s."lotnisko_ICAO" = l."ICAO"
            RIGHT JOIN pracownik_sklep_funkcja psf ON s."id" = psf."sklep_id"
            RIGHT JOIN pracownik_lotnisko_funkcja plf ON l."ICAO" = plf."lotnisko_ICAO"
            INNER JOIN funkcja_pracownika_sklep fps ON psf."funkcja_id" = fps."id"
            INNER JOIN manager_lotniczy.funkcja_pracownika_lotnisko fpl on plf."funkcja_id" = fpl."id"
        WHERE l."ICAO" = lotniskoICAO
        GROUP BY
            l."ICAO";
    END;
    $$
LANGUAGE plpgsql;


