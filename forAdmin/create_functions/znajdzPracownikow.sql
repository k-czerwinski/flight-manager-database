SET SEARCH_PATH to manager_lotniczy;
-- DROP FUNCTION znajdzPracownikow(imiePrac text, nazwiskoPrac text, order_by text, sort_order text, number_of_records_on_single_page integer, number_of_page integer);
CREATE OR REPLACE FUNCTION znajdzPracownikow(
    imiePrac text,
    nazwiskoPrac text,
    order_by text,
    sort_order text,
    number_of_records_on_single_page integer,
    number_of_page integer
)
RETURNS TABLE(
    id integer,
    imie text,
    drugie_imie text,
    nazwisko text,
    pracownik_lotniska text,
    pracownik_lini text,
    pracownik_sklepu text
)
AS
$$
BEGIN
    IF sort_order NOT IN ('ASC', 'DESC') THEN
        RAISE EXCEPTION 'Podaj poprawne sort direction!';
    end if;

    RETURN QUERY EXECUTE
        'SELECT * from pracownik_widok
        WHERE
        ($1 is null or imie LIKE CONCAT(''%'', $1, ''%'')) AND
        ($2 is null or nazwisko LIKE CONCAT(''%'', $2, ''%''))
        ORDER BY ' || order_by || ' ' || sort_order ||
        ' LIMIT ' || number_of_records_on_single_page ||
        ' OFFSET ' || (number_of_page - 1) * number_of_records_on_single_page
        USING
            imiePrac,
            nazwiskoPrac;
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION znajdzLiczbePracownikow(
    imiePrac text,
    nazwiskoPrac text
)
RETURNS integer
AS
$$
DECLARE
    liczba_rekordow integer;
BEGIN
    SELECT INTO liczba_rekordow
    COUNT(*)
    FROM pracownik
    WHERE
    (imiePrac IS NULL OR imie LIKE CONCAT('%', imiePrac, '%')) AND
    (nazwiskoPrac IS NULL OR imie LIKE CONCAT('%',nazwiskoPrac, '%'));
    RETURN liczba_rekordow::integer;
END;
$$
LANGUAGE plpgsql;
