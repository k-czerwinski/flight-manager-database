SET SEARCH_PATH to manager_lotniczy;

CREATE view pracownik_widok AS
WITH
znajdzPracownikaLotniska AS
    (SELECT plf."pracownik_id" AS plf_id, concat('(',plf."lotnisko_ICAO",'): ', fpl."nazwa") as prac_lotnisko
        FROM pracownik_lotnisko_funkcja plf
        INNER JOIN funkcja_pracownika_lotnisko fpl on fpl."id" = plf."funkcja_id"),
znajdzPracownikaLini AS
    (SELECT pllf."pracownik_id" AS pllf_id, concat(ll."nazwa", ': ', fpll."nazwa") as prac_linia
        FROM pracownik_linia_lotnicza_funkcja pllf
        INNER JOIN funkcja_pracownika_linia_lotnicza fpll on fpll."id" = pllf."funkcja_id"
        INNER JOIN linia_lotnicza ll on ll."id" = pllf."linia_lotnicza_id"),
znajdzPracownikaSklepu AS
    (SELECT psf."pracownik_id" AS psf_id, concat('(', s."lotnisko_ICAO", ') - ', s."nazwa_sklepu", ' - ', fps."nazwa") as prac_sklep
        FROM pracownik_sklep_funkcja psf
        INNER JOIN funkcja_pracownika_sklep fps on fps."id" = psf."funkcja_id"
        INNER JOIN sklep s on psf."sklep_id" = s."id")
SELECT p."id" as id, imie::text, drugie_imie::text, nazwisko::text,
       coalesce(prac_lotnisko,'') as pracownik_lotniska,
       coalesce(prac_linia,'') as pracownik_lini,
       coalesce(prac_sklep,'') as pracownik_sklepu
    FROM pracownik p
    LEFT JOIN znajdzPracownikaLotniska ON plf_id = p."id"
    LEFT JOIN znajdzPracownikaLini ON pllf_id = p."id"
    LEFT JOIN znajdzPracownikaSklepu ON psf_id = p."id";
