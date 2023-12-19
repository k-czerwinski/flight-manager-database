SET search_path to manager_lotniczy;

CREATE OR REPLACE FUNCTION create_sample_data_pracownik_lotnisko_funkcja (
    idx_start integer,
    ICAO char(4))
RETURNS integer
    AS
$$
    DECLARE
        i integer := idx_start;
        n integer := 1;
    BEGIN
        LOOP
            EXIT WHEN n > 2;
            INSERT INTO pracownik_lotnisko_funkcja(pracownik_id, "lotnisko_ICAO", funkcja_id)
            VALUES
            (i, ICAO, 1),
            (i + 1, ICAO, 2),
            (i + 2, ICAO, 3),
            (i + 3, ICAO, 4),
            (i + 4, ICAO, 5),
            (i + 5, ICAO, 6),
            (i + 6, ICAO, 7),
            (i + 7, ICAO, 8),
            (i + 8, ICAO, 9),
            (i + 9, ICAO, 10),
            (i + 10, ICAO, 11);

            INSERT INTO pracownik_lotnisko_dostep(pracownik_id, "lotnisko_ICAO", dostep_strefa_kontroli_bezpieczenstwa, dostep_strefa_emigracyjna, dostep_airside)
            VALUES
            (i, ICAO, true, true, false),
            (i + 1, ICAO, true, false, false),
            (i + 2, ICAO, true, false, false),
            (i + 3, ICAO,true, true, true),
            (i + 4, ICAO, true, true, true),
            (i + 5, ICAO, true, true, true),
            (i + 6, ICAO, false, false, false),
            (i + 7, ICAO, false, false, false),
            (i + 8, ICAO, true, true, true),
            (i + 9, ICAO, false, false, false),
            (i + 10, ICAO, true, true, true);

            n := n + 1;
            i := i + 11;
        end loop;
        RETURN i;
    END;
$$
LANGUAGE plpgsql;

-- insert for each airport
DO
$$
DECLARE
    pracownik_idx integer = 1;
    t_row lotnisko%rowtype;
BEGIN
    FOR t_row in SELECT * FROM lotnisko LOOP
        pracownik_idx := (select create_sample_data_pracownik_lotnisko_funkcja(pracownik_idx, t_row."ICAO"));
    END LOOP;
END;
$$;
