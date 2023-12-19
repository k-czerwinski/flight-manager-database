SET SEARCH_PATH to manager_lotniczy;
CREATE OR REPLACE FUNCTION sprawdzDostepnoscLotu(klasa_miejsca integer, id_lotu integer)
RETURNS boolean AS
    $$
        DECLARE
        liczba_rekordow integer;
        BEGIN
            IF klasa_miejsca NOT IN (1,2) THEN
                RAISE EXCEPTION 'Klasa miejsca to 1 lub 2';
            end if;
            SELECT INTO liczba_rekordow COUNT(lot_data_id) FROM lot_data_samolot lds
            INNER JOIN bilet b on lds.lot_data_id = b.lot_data_samolot_id
            INNER JOIN samolot s ON lds.samolot_id = s.numer
            WHERE b.klasa_siedzenia = klasa_miejsca AND lds.lot_data_id = id_lotu;
            IF (klasa_miejsca = 1) THEN
            RETURN liczba_rekordow < (SELECT s1.liczba_pasazerow_klasa_1
                                      FROM lot_data_samolot lds1 inner join samolot s1 on lds1.samolot_id = s1.numer where lds1.lot_data_id=id_lotu);
            ELSE
                RETURN liczba_rekordow < (SELECT s1.liczba_pasazerow_klasa_2
                    FROM lot_data_samolot lds1 inner join samolot s1 on lds1.samolot_id = s1.numer where lds1.lot_data_id=id_lotu);
            END IF;
        END;
    $$
LANGUAGE plpgsql;
