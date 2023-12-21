CREATE ROLE app_user;
GRANT USAGE ON SCHEMA manager_lotniczy TO app_user;
GRANT SELECT, INSERT ON manager_lotniczy.bilet TO app_user;
GRANT SELECT ON manager_lotniczy.lot_klient,
    manager_lotniczy.rejs,
    manager_lotniczy.lot_data_samolot,
    manager_lotniczy.kategoria_sklepu,
    manager_lotniczy.sklep_widok,
    manager_lotniczy.lotnisko,
    manager_lotniczy.linia_lotnicza,
    manager_lotniczy.samolot
    TO app_user;
GRANT ALL PRIVILEGES ON FUNCTION manager_lotniczy.znajdzdanelotudlaklienta(lotnisko_odlotu_icao char, lotnisko_odlotu_iata char, lotnisko_odlotu_nazwa varchar, lotnisko_odlotu_miasto varchar, lotnisko_przylotu_icao char, lotnisko_przylotu_iata char, lotnisko_przylotu_nazwa varchar, lotnisko_przylotu_miasto varchar, data_odlotu_od date, data_odlotu_do date, godzina_odlotu_od time, godzina_odlotu_do time, cena_biletu_1klasa_od numeric, cena_biletu_1klasa_do numeric, cena_biletu_2klasa_od numeric, cena_biletu_2klasa_do numeric, order_by text, sort_order text, number_of_records_on_single_page integer, number_of_page integer),
    manager_lotniczy.znajdzliczbelotowdlaklienta(lotnisko_odlotu_icao char, lotnisko_odlotu_iata char, lotnisko_odlotu_nazwa varchar, lotnisko_odlotu_miasto varchar, lotnisko_przylotu_icao char, lotnisko_przylotu_iata char, lotnisko_przylotu_nazwa varchar, lotnisko_przylotu_miasto varchar, data_odlotu_od date, data_odlotu_do date, godzina_odlotu_od time, godzina_odlotu_do time, cena_biletu_1klasa_od numeric, cena_biletu_1klasa_do numeric, cena_biletu_2klasa_od numeric, cena_biletu_2klasa_do numeric),
    manager_lotniczy.znajdzliczbesklepowdlaklienta(lotnisko_icao text, kat_id integer),
    manager_lotniczy.znajdzsklepydlaklienta(lotnisko_icao text, kat_id integer, order_by text, sort_order text, number_of_records_on_single_page integer, number_of_page integer),
    manager_lotniczy.sprawdzdostepnosclotu(klasa_miejsca integer, id_lotu integer) TO app_user;


CREATE ROLE app_admin;
GRANT USAGE ON SCHEMA manager_lotniczy to app_admin;
GRANT SELECT, INSERT, UPDATE ON ALL TABLES IN SCHEMA manager_lotniczy to app_admin;
GRANT ALL PRIVILEGES ON ALL FUNCTIONS IN SCHEMA manager_lotniczy to app_admin;

