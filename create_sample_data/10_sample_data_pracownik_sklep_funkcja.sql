SET search_path to manager_lotniczy;

CREATE OR REPLACE FUNCTION create_sample_data_pracownik_sklep_funkcja (
    idx_prac_start integer,
    for_ICAO char(4))
RETURNS integer
    AS
$$
    DECLARE
        i integer := idx_prac_start + 2;
        kierownik_id integer := idx_prac_start;
        sprzatacz_id integer := idx_prac_start + 1;
        sklep_row sklep%rowtype;
    BEGIN
        FOR sklep_row in SELECT * from sklep where "lotnisko_ICAO" = for_ICAO LOOP
            insert into pracownik_sklep_funkcja (pracownik_id, funkcja_id, sklep_id)
            VALUES
            (kierownik_id, 1, sklep_row.id),
            (sprzatacz_id, 5, sklep_row.id),
            (i, 6, sklep_row.id);

            insert into pracownik_lotnisko_dostep("lotnisko_ICAO", pracownik_id, dostep_strefa_kontroli_bezpieczenstwa, dostep_strefa_emigracyjna, dostep_airside)
            VALUES
            (for_ICAO,i, false, true, false);

            i := i + 1;
        end loop;
            insert into pracownik_lotnisko_dostep("lotnisko_ICAO", pracownik_id, dostep_strefa_kontroli_bezpieczenstwa, dostep_strefa_emigracyjna, dostep_airside)
            VALUES
            (for_ICAO,kierownik_id, false, true, false),
            (for_ICAO,sprzatacz_id, false, true, false);
        return i;
    END
$$
LANGUAGE 'plpgsql';

-- insert for each airport
DO
$$
DECLARE
    pracownik_idx integer := 551;
    lotnisko_row lotnisko%rowtype;
BEGIN
    FOR lotnisko_row in SELECT * FROM lotnisko LOOP
        pracownik_idx := (select create_sample_data_pracownik_sklep_funkcja(pracownik_idx, lotnisko_row."ICAO"));
    end loop;
end;
$$;
