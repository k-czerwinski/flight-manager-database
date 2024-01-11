SET SEARCH_PATH to manager_lotniczy;

CREATE OR REPLACE FUNCTION znajdzPilotowDlaLiniLotniczej(liniaLotniczaId int)
RETURNS TABLE (id integer, imie_nazwisko text)
AS
    $$
        BEGIN
            RETURN QUERY
            SELECT p."id", concat(p."imie", ' ', p."nazwisko")
            FROM pracownik p
            INNER JOIN pracownik_linia_lotnicza_funkcja pllf on p.id = pllf.pracownik_id
            INNER JOIN funkcja_pracownika_linia_lotnicza fpll on pllf.funkcja_id = fpll.id
            where pllf.linia_lotnicza_id = liniaLotniczaId and fpll."nazwa" LIKE '%Pilot%';
        end;
    $$
LANGUAGE plpgsql;
