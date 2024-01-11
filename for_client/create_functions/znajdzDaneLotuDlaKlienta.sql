SET SEARCH_PATH to manager_lotniczy;

-- znajduje loty z filtracją po przekazanych argumentach, ceny wyświetlane są tylko dla dostępnych miejsc w danej klasie
CREATE OR REPLACE FUNCTION znajdzDaneLotuDlaKlienta(
    lotnisko_odlotu_ICAO char(4),
    lotnisko_odlotu_IATA char(3),
    lotnisko_odlotu_nazwa varchar(50),
    lotnisko_odlotu_miasto varchar(30),
    lotnisko_przylotu_ICAO char(4),
    lotnisko_przylotu_IATA char(3),
    lotnisko_przylotu_nazwa varchar(50),
    lotnisko_przylotu_miasto varchar(30),
    data_odlotu_od date,
    data_odlotu_do date,
    godzina_odlotu_od time,
    godzina_odlotu_do time,
    cena_biletu_1klasa_od decimal,
    cena_biletu_1klasa_do decimal,
    cena_biletu_2klasa_od decimal,
    cena_biletu_2klasa_do decimal,
    order_by text,
    sort_order text,
    number_of_records_on_single_page integer,
    number_of_page integer
)
RETURNS TABLE(
    numer_lotu integer,
    lotnisko_odlotu text,
    lotnisko_odlotu_kod text,
    data_odlotu date,
    godzina_odlotu time,
    lotnisko_przylotu text,
    lotnisko_przylotu_kod text,
    data_przylotu date,
    godzina_przylotu time,
    cena_biletu_1_klasa decimal,
    cena_biletu_2_klasa decimal
)
AS
$$
BEGIN
    IF sort_order NOT IN ('ASC', 'DESC') THEN
        RAISE EXCEPTION 'Podaj poprawne sort direction!';
    end if;
--     IF order_by NOT IN ()

    RETURN QUERY EXECUTE 'SELECT
        lot_data_id,
        concat(lo."miasto", ''('', lo."nazwa", '')''),
        concat(lo."ICAO", ''/'', lo."IATA"),
        lds."data_odlotu",
        r."godzina_odlotu",
        concat(lp."miasto", ''('', lp."nazwa", '')''),
        concat(lp."ICAO", ''/'', lp."IATA"),
        lds."data_przylotu",
        r."godzina_przylotu",
        lds."cena_biletu_klasa_1",
        lds."cena_biletu_klasa_2"
    FROM rejs r
    INNER JOIN lotnisko lo ON r."lotnisko_odlotu_ICAO" = lo."ICAO"
    INNER JOIN lotnisko lp ON r."lotnisko_przylotu_ICAO" = lp."ICAO"
    INNER JOIN lot_data_samolot lds ON r."numer_rejsu" = lds."numer_rejsu"
    WHERE
        ( $1 is null or lo."ICAO" LIKE concat(''%'', $1, ''%'')) AND
        ($2 is null or lo."IATA" LIKE concat(''%'', $2, ''%'')) AND
        ($3 is null or lo."nazwa" LIKE concat(''%'', $3, ''%'')) AND
        ($4 is null or lo."miasto" LIKE concat(''%'', $4, ''%'')) AND
        ($5 is null or lp."ICAO" LIKE concat(''%'', $5, ''%'')) AND
        ($6 is null or lp."IATA" LIKE concat(''%'', $6, ''%'')) AND
        ($7 is null or lp."nazwa" LIKE concat(''%'', $7, ''%'')) AND
        ($8 is null or lp."miasto" LIKE concat(''%'', $8, ''%'')) AND
        ($9 is null or lds."data_odlotu" > $9) AND
        ($10 is null or lds."data_odlotu" < $10) AND
        ($11 is null or r."godzina_odlotu" > $11) AND
        ($12 is null or r."godzina_odlotu" < $12) AND
        ($13 is null or lds."cena_biletu_klasa_2" > $13) AND
        ($14 is null or lds."cena_biletu_klasa_2" < $14) AND
        ($15 is null or lds."cena_biletu_klasa_1" > $15) AND
        ($16 is null or lds."cena_biletu_klasa_1" < $16)
        ORDER BY ' || order_by || ' ' || sort_order ||
        ' LIMIT ' || number_of_records_on_single_page ||
        ' OFFSET ' || (number_of_page - 1) * number_of_records_on_single_page
        USING
            lotnisko_odlotu_ICAO,
            lotnisko_odlotu_IATA,
            lotnisko_odlotu_nazwa,
            lotnisko_odlotu_miasto,
            lotnisko_przylotu_ICAO,
            lotnisko_przylotu_IATA,
            lotnisko_przylotu_nazwa,
            lotnisko_przylotu_miasto,
            data_odlotu_od,
            data_odlotu_do,
            godzina_odlotu_od,
            godzina_odlotu_do,
            cena_biletu_2klasa_od,
            cena_biletu_2klasa_do,
            cena_biletu_1klasa_od,
            cena_biletu_1klasa_do;
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION znajdzLiczbeLotowDlaKlienta(
    lotnisko_odlotu_ICAO char(4),
    lotnisko_odlotu_IATA char(3),
    lotnisko_odlotu_nazwa varchar(50),
    lotnisko_odlotu_miasto varchar(30),
    lotnisko_przylotu_ICAO char(4),
    lotnisko_przylotu_IATA char(3),
    lotnisko_przylotu_nazwa varchar(50),
    lotnisko_przylotu_miasto varchar(30),
    data_odlotu_od date,
    data_odlotu_do date,
    godzina_odlotu_od time,
    godzina_odlotu_do time,
    cena_biletu_1klasa_od decimal,
    cena_biletu_1klasa_do decimal,
    cena_biletu_2klasa_od decimal,
    cena_biletu_2klasa_do decimal
)
RETURNS integer
AS
$$
DECLARE
    liczba_rekordow integer;
BEGIN
    SELECT INTO liczba_rekordow
    COUNT(*)
    FROM rejs r
    INNER JOIN lotnisko lo ON r."lotnisko_odlotu_ICAO" = lo."ICAO"
    INNER JOIN lotnisko lp ON r."lotnisko_przylotu_ICAO" = lp."ICAO"
    INNER JOIN lot_data_samolot lds ON r."numer_rejsu" = lds."numer_rejsu"
    WHERE
    (lotnisko_odlotu_ICAO IS NULL OR lo."ICAO" LIKE CONCAT('%', lotnisko_odlotu_ICAO, '%')) AND
    (lotnisko_odlotu_IATA IS NULL OR lo."IATA" LIKE CONCAT('%', lotnisko_odlotu_IATA, '%')) AND
    (lotnisko_odlotu_nazwa IS NULL OR lo."nazwa" LIKE CONCAT('%', lotnisko_odlotu_nazwa, '%')) AND
    (lotnisko_odlotu_miasto IS NULL OR lo."miasto" LIKE CONCAT('%', lotnisko_odlotu_miasto, '%')) AND
    (lotnisko_przylotu_ICAO IS NULL OR lo."ICAO" LIKE CONCAT('%', lotnisko_przylotu_ICAO, '%')) AND
    (lotnisko_przylotu_IATA IS NULL OR lo."IATA" LIKE CONCAT('%', lotnisko_przylotu_IATA, '%')) AND
    (lotnisko_przylotu_nazwa IS NULL OR lo."nazwa" LIKE CONCAT('%', lotnisko_przylotu_nazwa, '%')) AND
    (lotnisko_przylotu_miasto IS NULL OR lo."miasto" LIKE CONCAT('%', lotnisko_przylotu_miasto, '%')) AND
    (data_odlotu_od IS NULL OR lds."data_odlotu" > data_odlotu_od) AND
    (data_odlotu_do IS NULL OR lds."data_odlotu" < data_odlotu_do) AND
    (godzina_odlotu_od IS NULL OR r."godzina_odlotu" > godzina_odlotu_od) AND
    (godzina_odlotu_do IS NULL OR r."godzina_odlotu" < godzina_odlotu_do) AND
    (cena_biletu_2klasa_od IS NULL OR lds."cena_biletu_klasa_2" > cena_biletu_2klasa_od) AND
    (cena_biletu_2klasa_do IS NULL OR lds."cena_biletu_klasa_2" < cena_biletu_2klasa_do) AND
    (cena_biletu_1klasa_od IS NULL OR lds."cena_biletu_klasa_1" > cena_biletu_1klasa_od) AND
    (cena_biletu_1klasa_do IS NULL OR lds."cena_biletu_klasa_1" < cena_biletu_1klasa_do);
    RETURN liczba_rekordow::integer;
END;
$$
LANGUAGE plpgsql;