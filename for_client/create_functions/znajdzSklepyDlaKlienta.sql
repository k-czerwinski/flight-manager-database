SET SEARCH_PATH to manager_lotniczy;

CREATE OR REPLACE FUNCTION znajdzSklepyDlaKlienta(
    lotnisko_ICAO text,
    kat_id integer,
    order_by text,
    sort_order text,
    number_of_records_on_single_page integer,
    number_of_page integer
)
RETURNS TABLE(
    nazwaSklepu varchar(50),
    nazwaKategorii varchar(40),
    lotnisko text
)
AS
$$
BEGIN
    IF sort_order NOT IN ('ASC', 'DESC') THEN
        RAISE EXCEPTION 'Podaj poprawne sort direction!';
    end if;

    RETURN QUERY EXECUTE 'SELECT nazwa_sklepu, nazwa_kategorii, lotnisko FROM sklep_widok
    WHERE
        ($1 is null or ICAO LIKE CONCAT(''%'', $1, ''%'')) AND
        ($2 is null or kategoria_id = $2)
        ORDER BY ' || order_by || ' ' || sort_order ||
        ' LIMIT ' || number_of_records_on_single_page ||
        ' OFFSET ' || (number_of_page - 1) * number_of_records_on_single_page
        USING
            lotnisko_ICAO,
            kat_id;
END;
$$
LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION znajdzLiczbeSklepowDlaKlienta(
    lotnisko_ICAO text,
    kat_id integer
)
RETURNS integer
AS
$$
DECLARE
    liczba_rekordow integer;
BEGIN
    SELECT INTO liczba_rekordow
    COUNT(*)
    FROM sklep_widok
    WHERE
    (lotnisko_ICAO IS NULL OR ICAO LIKE CONCAT('%', lotnisko_ICAO, '%')) AND
    (kat_id IS NULL OR kategoria_id = kat_id);
    RETURN liczba_rekordow::integer;
END;
$$
LANGUAGE plpgsql;

