SET SEARCH_PATH to manager_lotniczy;

CREATE OR REPLACE function lotniskaBezDostepowDlaPracownika(pracownikId integer)
RETURNS TABLE(lotnisko_icao text, lotnisko_nazwa text)
AS
    $$
    BEGIN
        RETURN QUERY
        WITH lotniskaZDostepemPracownika AS (SELECT "lotnisko_ICAO" from pracownik_lotnisko_dostep where pracownik_id = pracownikId)
        SELECT
            l."ICAO"::text, concat('(', l."ICAO",'/',l."IATA",'): ', l."nazwa", ' - ', l."miasto")::text
        FROM
            lotnisko l
        WHERE l."ICAO" not in (SELECT "lotnisko_ICAO" from lotniskaZDostepemPracownika);
    end;
    $$
    LANGUAGE plpgsql;

