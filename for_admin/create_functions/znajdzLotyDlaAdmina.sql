SET SEARCH_PATH to manager_lotniczy;

CREATE OR REPLACE FUNCTION znajdzLotyDlaAdmina(
    order_by text,
    sort_order text,
    number_of_records_on_single_page integer,
    number_of_page integer
)
RETURNS TABLE(
    lotnisko_odlotu_kod text,
    data_odlotu date,
    godzina_odlotu time,
    lotnisko_przylotu_kod text,
    data_przylotu date,
    godzina_przylotu time,
    cena_biletu_klasa_1 decimal,
    cena_biletu_klasa_2 decimal,
    nazwa_lini_lotniczej text,
    model_samolotu text,
    numer_samolotu text,
    liczba_zalogi int
)
AS
$$
BEGIN
    IF sort_order NOT IN ('ASC', 'DESC') THEN
        RAISE EXCEPTION 'Podaj poprawne sort direction!';
    end if;

    RETURN QUERY EXECUTE 'SELECT
        concat(lo."ICAO", ''/'', lo."IATA"),
        lds."data_odlotu",
        r."godzina_odlotu",
        concat(lp."ICAO", ''/'', lp."IATA"),
        lds."data_przylotu",
        r."godzina_przylotu",
        lds."cena_biletu_klasa_1",
        lds."cena_biletu_klasa_2",
        ll."nazwa"::text,
        s."model"::text,
        s."numer"::text,
        s."liczba_zalogi"
    FROM rejs r
    INNER JOIN lotnisko lo ON r."lotnisko_odlotu_ICAO" = lo."ICAO"
    INNER JOIN lotnisko lp ON r."lotnisko_przylotu_ICAO" = lp."ICAO"
    INNER JOIN lot_data_samolot lds ON r."numer_rejsu" = lds."numer_rejsu"
    INNER JOIN linia_lotnicza ll ON r."linia_lotnicza_id" = ll."id"
    INNER JOIN samolot s ON lds."samolot_id" = s."numer"
    ORDER BY ' || order_by || ' ' || sort_order ||
        ' LIMIT ' || number_of_records_on_single_page ||
        ' OFFSET ' || (number_of_page - 1) * number_of_records_on_single_page;
END;
$$
LANGUAGE plpgsql;
