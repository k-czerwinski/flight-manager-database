SET SEARCH_PATH to manager_lotniczy;

CREATE OR REPLACE VIEW raport_lotnisko_sklep_kategoria AS
SELECT
    l."ICAO",
    concat('(', l."ICAO",'/', l."IATA", ') ', l.nazwa ,' - ', l.miasto) as nazwa_lotniska,
    MAX(CASE WHEN ks.nazwa_kategorii = 'Odzież podróżna' THEN 1 ELSE 0 END)::integer as odziez_podrozna,
    MAX(CASE WHEN ks.nazwa_kategorii = 'Sklep z pamiątkami' THEN 1 ELSE 0 END)::integer as sklep_pamiatkowy,
    MAX(CASE WHEN ks.nazwa_kategorii = 'Księgarnia lotnicza' THEN 1 ELSE 0 END)::integer as ksiegarnia_lotnicza,
    MAX(CASE WHEN ks.nazwa_kategorii = 'Elektronika podróżna' THEN 1 ELSE 0 END)::integer as elektronika_podrozna,
    MAX(CASE WHEN ks.nazwa_kategorii = 'Kawiarnia lotnicza' THEN 1 ELSE 0 END)::integer as kawiarnia_lotnicza,
    MAX(CASE WHEN ks.nazwa_kategorii = 'Restauracja z widokiem na lotnisko' THEN 1 ELSE 0 END)::integer as restauracja_widok,
    MAX(CASE WHEN ks.nazwa_kategorii = 'Sklep z gadżetami lotniczymi' THEN 1 ELSE 0 END)::integer as sklep_gadzety,
    MAX(CASE WHEN ks.nazwa_kategorii = 'Sklep z elektroniką podróżną' THEN 1 ELSE 0 END)::integer as sklep_elektronika,
    MAX(CASE WHEN ks.nazwa_kategorii = 'Sklep z alkoholami na wynos' THEN 1 ELSE 0 END)::integer as sklep_alkohole,
    MAX(CASE WHEN ks.nazwa_kategorii = 'Sklep z kosmetykami podróżnymi' THEN 1 ELSE 0 END)::integer as sklep_kosmetyki,
    MAX(CASE WHEN ks.nazwa_kategorii = 'Sklep z akcesoriami podróżnymi' THEN 1 ELSE 0 END)::integer as sklep_akcesoria,
    MAX(CASE WHEN ks.nazwa_kategorii = 'Sklep z prasą i czasopismami' THEN 1 ELSE 0 END)::integer as sklep_prasa,
    MAX(CASE WHEN ks.nazwa_kategorii = 'Sklep z biżuterią podróżną' THEN 1 ELSE 0 END)::integer as sklep_bizuteria,
    MAX(CASE WHEN ks.nazwa_kategorii = 'Sklep z artykułami dla dzieci' THEN 1 ELSE 0 END)::integer as sklep_dla_dzieci,
    MAX(CASE WHEN ks.nazwa_kategorii = 'Sklep z obuwiem wygodnym do podróży' THEN 1 ELSE 0 END)::integer as sklep_obuwie
FROM
    sklep s
    INNER JOIN kategoria_sklepu ks ON ks.id = s.kategoria_id
    INNER JOIN lotnisko l ON s."lotnisko_ICAO" = l."ICAO"
GROUP BY
    l."ICAO";