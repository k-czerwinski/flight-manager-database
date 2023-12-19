SET search_path to manager_lotniczy;

INSERT INTO "funkcja_pracownika_lotnisko" ("nazwa") VALUES
('Agent obsługi naziemnej na stanowisku odprawy biletowej'),
('Agent obsługi naziemnej na stanowisku obsługi bagażu'),
('Agent obsługi naziemnej na stanowisku informacyjnym'),
('Agent obsługi naziemnej na stanowisku pomocy dla pasażerów z ograniczeniami ruchowymi'),
('Ochrona'),
('Specjalista ds. bezpieczeństwa'),
('Pracownik biurowy'),
('Personel administracyjny'),
('Kontroler bezpieczeństwa'),
('Planista lotów'),
('Agent obsługi naziemnej na stanowisku zarządzania lotami');


INSERT INTO "funkcja_pracownika_linia_lotnicza" ("nazwa") VALUES
('Obsługa klienta'),
('Sprzedaż biletów'),
('Obsługa biletów'),
('Pilot - Kapitan'),
('Pilot - Pierwszy Oficer'),
('Mechanik lotniczy - Silniki'),
('Mechanik lotniczy - Awionika'),
('Personel pokładowy - Stewardessa/Steward');

INSERT INTO "funkcja_pracownika_sklep" ("nazwa") VALUES
('Kierownik sklepu'),
('Barman'),
('Kelner'),
('Kucharz'),
('Personel sprzątający'),
('Sprzedawca');