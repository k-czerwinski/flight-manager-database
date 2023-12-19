SET search_path to manager_lotniczy;

CREATE OR REPLACE FUNCTION create_sample_data_pracownik_linia_lotnicza_funkcja (
    idx_prac_start integer,
    for_linia_lotnicza_id integer)
RETURNS integer
    AS
$$
    DECLARE
        i integer := idx_prac_start;
    BEGIN
        LOOP
            EXIT WHEN i > (idx_prac_start + 20);
            INSERT INTO pracownik_linia_lotnicza_funkcja(pracownik_id, linia_lotnicza_id, funkcja_id)
            VALUES
            (i, for_linia_lotnicza_id, 8);
            i := i + 1;
        end loop;
        LOOP
            EXIT WHEN i > (idx_prac_start + 30);
            INSERT INTO pracownik_linia_lotnicza_funkcja(pracownik_id, linia_lotnicza_id, funkcja_id)
            VALUES
            (i, for_linia_lotnicza_id, 4),
            (i + 1, for_linia_lotnicza_id, 5);
            i := i + 2;
        end loop;
        INSERT INTO pracownik_linia_lotnicza_funkcja(pracownik_id, linia_lotnicza_id, funkcja_id)
        VALUES
            (i, for_linia_lotnicza_id, 1),
            (i + 1, for_linia_lotnicza_id, 2),
            (i + 2, for_linia_lotnicza_id, 3),
            (i + 3, for_linia_lotnicza_id, 6),
            (i + 4, for_linia_lotnicza_id, 7),
            (i + 5, for_linia_lotnicza_id, 1),
            (i + 6, for_linia_lotnicza_id, 2),
            (i + 7, for_linia_lotnicza_id, 3),
            (i + 8, for_linia_lotnicza_id, 6),
            (i + 9, for_linia_lotnicza_id, 7);
        return i+10;
    END;
$$
LANGUAGE 'plpgsql';

-- insert for each airport
DO
$$
DECLARE
    pracownik_idx integer := 931;
    ll_row linia_lotnicza%rowtype;
BEGIN
    FOR ll_row in SELECT * FROM linia_lotnicza LOOP
        pracownik_idx := (select create_sample_data_pracownik_linia_lotnicza_funkcja(pracownik_idx, ll_row.id));
    end loop;
end;
$$;