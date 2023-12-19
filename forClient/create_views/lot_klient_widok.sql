SET SEARCH_PATH to manager_lotniczy;

CREATE OR REPLACE VIEW lot_klient AS
SELECT
        lot_data_id as numer_lotu,
        concat(lo."miasto", '(', lo."nazwa", ')') as "lotnisko_odlotu",
        concat(lo."ICAO", '/', lo."IATA") as "lotnisko_odlotu_kod",
        lds."data_odlotu" as "data_odlotu",
        r."godzina_odlotu" AS "godzina_odlotu",
        concat(lp."miasto", '(', lp."nazwa", ')') as "lotnisko_przylotu",
        concat(lp."ICAO", '/', lp."IATA") as "lotnisko_przylotu_kod",
        lds."data_przylotu" as "data_przylotu",
        r."godzina_przylotu" as "godzina_przylotu",
        lds."cena_biletu_klasa_1" as "cena_biletu_1_klasa",
        lds."cena_biletu_klasa_2" as "cena_biletu_2_klasa"
    FROM rejs r
    INNER JOIN lotnisko lo ON r."lotnisko_odlotu_ICAO" = lo."ICAO"
    INNER JOIN lotnisko lp ON r."lotnisko_przylotu_ICAO" = lp."ICAO"
    INNER JOIN lot_data_samolot lds ON r."numer_rejsu" = lds."numer_rejsu";