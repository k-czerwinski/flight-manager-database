SET SEARCH_PATH to manager_lotniczy;

CREATE OR REPLACE VIEW samolot_widok AS
    SELECT numer, model, liczba_pasazerow_klasa_1, liczba_pasazerow_klasa_2, liczba_zalogi, ll.nazwa as nazwa_lini_lotniczej FROM samolot s
INNER JOIN linia_lotnicza ll ON s.linia_lotnicza_id = ll.id