SET SEARCH_PATH to manager_lotniczy;

CREATE OR REPLACE VIEW rejs_widok
AS
    SELECT r."numer_rejsu",
           r."lotnisko_odlotu_ICAO",
           r."lotnisko_przylotu_ICAO",
           r."godzina_odlotu",
           r."godzina_przylotu",
           r."linia_lotnicza_id",
           ll."nazwa" as linia_lotnicza_nazwa
    FROM rejs r
    INNER JOIN manager_lotniczy.linia_lotnicza ll on r."linia_lotnicza_id" = ll."id";
