SET SEARCH_PATH to manager_lotniczy;

CREATE OR REPLACE VIEW raport_linia_lotnicza AS
    WITH linia_lotnicza_ilosc_samolotow AS (
        SELECT s.linia_lotnicza_id as llis_llid, COUNT(*) as liczba_samolotow from samolot s
            GROUP BY s.linia_lotnicza_id
    ),
        linia_lotnicza_pracownicy AS (
            SELECT
                pllf.linia_lotnicza_id llp_llid,
                MAX(CASE WHEN pllf.funkcja_id = 1 THEN 1 else 0 END) as obsluga_klienta,
                MAX(CASE WHEN pllf.funkcja_id = 2 THEN 1 else 0 END) as sprzedaz_biletow,
                MAX(CASE WHEN pllf.funkcja_id = 3 THEN 1 else 0 END) as obsluga_biletow,
                MAX(CASE WHEN pllf.funkcja_id = 4 THEN 1 else 0 END) as pilot_kapitan,
                MAX(CASE WHEN pllf.funkcja_id = 5 THEN 1 else 0 END) as pilot_1oficer,
                MAX(CASE WHEN pllf.funkcja_id = 6 THEN 1 else 0 END) as mechanik_lotniczy_silnik,
                MAX(CASE WHEN pllf.funkcja_id = 7 THEN 1 else 0 END) as mechanik_lotniczy_awionika,
                MAX(CASE WHEN pllf.funkcja_id = 8 THEN 1 else 0 END) as personel_pokladowy
            FROM
                pracownik_linia_lotnicza_funkcja pllf
            GROUP BY linia_lotnicza_id
        )
    SELECT liczba_samolotow, obsluga_klienta, sprzedaz_biletow, obsluga_biletow, pilot_kapitan, pilot_1oficer, mechanik_lotniczy_silnik, mechanik_lotniczy_awionika, personel_pokladowy, id, nazwa from linia_lotnicza_ilosc_samolotow llis
    inner join linia_lotnicza_pracownicy llp on llis_llid = llp_llid
    inner join linia_lotnicza ll on ll."id" = llp_llid;