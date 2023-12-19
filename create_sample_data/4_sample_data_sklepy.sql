SET search_path to manager_lotniczy;

-- Sklepy na lotnisku Heathrow (EGLL)
INSERT INTO "sklep" ("nazwa_sklepu", "kategoria_id", "lotnisko_ICAO") VALUES
('SkyFashion Heathrow', 1, 'EGLL'),
('Travel Treasures Heathrow', 1, 'EGLL'),
('AirBooks Heathrow', 8, 'EGLL'),
('TechJet Heathrow', 4, 'EGLL'),
('Duty-Free Emporium Heathrow', 5, 'EGLL'),
('Cloud Coffee Heathrow', 6, 'EGLL'),
('Skyline Dining Heathrow', 7, 'EGLL'),
('Wings & Things Heathrow', 3, 'EGLL'),
('Globe Electronics Heathrow', 9, 'EGLL'),
('FlyBy Perfumes Heathrow', 10, 'EGLL'),
('Kids Jet Set Heathrow', 15, 'EGLL'),
('Sole in the Sky Heathrow', 1, 'EGLL'),
('Aviation Elegance Heathrow', 8, 'EGLL'),
('SkyTunes Heathrow', 7, 'EGLL'),
('Wine & Wings Heathrow', 6, 'EGLL');

-- Sklepy na lotnisku Charles de Gaulle (LFPG)
INSERT INTO "sklep" ("nazwa_sklepu", "kategoria_id", "lotnisko_ICAO") VALUES
('LeChic Aviation CDG', 1, 'LFPG'),
('Parisian Souvenirs CDG', 2, 'LFPG'),
('Livre de LAir CDG', 8, 'LFPG'),
('ElectroParis CDG', 4, 'LFPG'),
('Duty-Free Excellence CDG', 5, 'LFPG'),
('Café du Ciel CDG', 6, 'LFPG'),
('Vue sur la Piste CDG', 7, 'LFPG'),
('Mode en Vol CDG', 1, 'LFPG'),
('Bijoux Skyline CDG', 9, 'LFPG'),
('Parfums de Vol CDG', 10, 'LFPG'),
('Enfants du Ciel CDG', 15, 'LFPG'),
('Soleil et Ciel CDG', 9, 'LFPG'),
('Élégance Aérienne CDG', 8, 'LFPG'),
('AirMélodies CDG', 7, 'LFPG'),
('Vin et Ailes CDG', 6, 'LFPG');

-- Sklepy na lotnisku Adolfo Suárez Madrid–Barajas (LEMD)
INSERT INTO "sklep" ("nazwa_sklepu", "kategoria_id", "lotnisko_ICAO") VALUES
('Madrid SkyStyle LEMD', 1, 'LEMD'),
('Spanish Souvenirs LEMD', 2, 'LEMD'),
('Libros del Aire LEMD', 8, 'LEMD'),
('ElectroMadrid LEMD', 4, 'LEMD'),
('Duty-Free Delight LEMD', 5, 'LEMD'),
('Café del Cielo LEMD', 6, 'LEMD'),
('Vista a la Pista LEMD', 7, 'LEMD'),
('Moda en Vuelo LEMD', 1, 'LEMD'),
('Joyas del Cielo LEMD', 9, 'LEMD'),
('Perfumes del Vuelo LEMD', 10, 'LEMD'),
('Niños del Cielo LEMD', 15, 'LEMD'),
('Sol y Cielo LEMD', 9, 'LEMD'),
('Elegancia Aérea LEMD', 8, 'LEMD'),
('AireMelodías LEMD', 7, 'LEMD'),
('Vino y Alas LEMD', 6, 'LEMD');

-- Sklepy na lotnisku Frankfurt (EDDF)
INSERT INTO "sklep" ("nazwa_sklepu", "kategoria_id", "lotnisko_ICAO") VALUES
('Frankfurt SkyFashion EDDF', 1, 'EDDF'),
('German Treasures EDDF', 2, 'EDDF'),
('LuftBücher EDDF', 8, 'EDDF'),
('TechFlug EDDF', 4, 'EDDF'),
('Duty-Free Himmel EDDF', 5, 'EDDF'),
('WolkenKaffee EDDF', 6, 'EDDF'),
('Himmelblick Restaurant EDDF', 7, 'EDDF'),
('Flügel & Dinge EDDF', 3, 'EDDF'),
('Globe Elektronik EDDF', 9, 'EDDF'),
('FlugPerfume EDDF', 10, 'EDDF'),
('Kinder FlugSet EDDF', 14, 'EDDF'),
('Soleil am Himmel EDDF', 9, 'EDDF'),
('Aviation Eleganz EDDF', 8, 'EDDF'),
('SkyTunes EDDF', 7, 'EDDF'),
('Wein & Flügel EDDF', 6, 'EDDF');

-- Sklepy na lotnisku Barcelona–El Prat (LEBL)
INSERT INTO "sklep" ("nazwa_sklepu", "kategoria_id", "lotnisko_ICAO") VALUES
('Barcelona SkyModa LEBL', 1, 'LEBL'),
('Barcelona Souvenirs LEBL', 2, 'LEBL'),
('Llibres de lAire LEBL', 8, 'LEBL'),
('ElectroBarcelona LEBL', 4, 'LEBL'),
('Duty-Free Plaer LEBL', 5, 'LEBL'),
('Cafè del Cel LEBL', 6, 'LEBL'),
('Vista a la Pista LEBL', 7, 'LEBL'),
('Moda en Vol LEBL', 3, 'LEBL'),
('Joies del Cel LEBL', 9, 'LEBL'),
('Perfums del Vol LEBL', 10, 'LEBL'),
('Nens del Cel LEBL', 15, 'LEBL'),
('Sol i Cel LEBL', 9, 'LEBL'),
('Elegància Aèria LEBL', 8, 'LEBL'),
('AireMelodíes LEBL', 7, 'LEBL'),
('Vi i Ales LEBL', 6, 'LEBL');

-- Sklepy na lotnisku Leonardo da Vinci–Fiumicino (LIRF)
INSERT INTO "sklep" ("nazwa_sklepu", "kategoria_id", "lotnisko_ICAO") VALUES
('Fiumicino SkyStyle LIRF', 1, 'LIRF'),
('Italian Souvenirs LIRF', 2, 'LIRF'),
('Libri dell Aria LIRF', 8, 'LIRF'),
('ElectroFiumicino LIRF', 4, 'LIRF'),
('Duty-Free Delizie LIRF', 5, 'LIRF'),
('Cloud Coffee Italia LIRF', 3, 'LIRF'),
('Skyline Dining Fiumicino LIRF', 7, 'LIRF'),
('Moda in Volo LIRF', 3, 'LIRF'),
('Globe Electronics Italia LIRF', 9, 'LIRF'),
('FlyBy Profumi LIRF', 10, 'LIRF'),
('Bambini del Cielo LIRF', 15, 'LIRF'),
('Soleil in the Sky Fiumicino LIRF', 9, 'LIRF'),
('Aviation Elegance Italia LIRF', 8, 'LIRF'),
('SkyTunes Fiumicino LIRF', 7, 'LIRF'),
('Vino & Ali Fiumicino LIRF', 6, 'LIRF');

-- Sklepy na lotnisku Gatwick (EGKK)
INSERT INTO "sklep" ("nazwa_sklepu", "kategoria_id", "lotnisko_ICAO") VALUES
('Gatwick SkyChic EGKK', 1, 'EGKK'),
('British Treasures EGKK', 2, 'EGKK'),
('AirBooks London EGKK', 8, 'EGKK'),
('ElectroGatwick EGKK', 4, 'EGKK'),
('Duty-Free Delight EGKK', 5, 'EGKK'),
('Cloud Coffee UK EGKK', 6, 'EGKK'),
('Skyline Dining Gatwick EGKK', 7, 'EGKK'),
('Fashion in Flight UK EGKK', 3, 'EGKK'),
('Jewelry in the Sky Gatwick EGKK', 9, 'EGKK'),
('Perfumes in the Air UK EGKK', 10, 'EGKK'),
('Kids Sky Adventures Gatwick EGKK', 15, 'EGKK'),
('Soleil in the Sky Gatwick EGKK', 9, 'EGKK'),
('Air Elegance Gatwick EGKK', 8, 'EGKK'),
('SkyTunes UK EGKK', 7, 'EGKK'),
('Wine & Wings Gatwick EGKK', 6, 'EGKK');

-- Sklepy na lotnisku Palma de Mallorca (LEPA)
INSERT INTO "sklep" ("nazwa_sklepu", "kategoria_id", "lotnisko_ICAO") VALUES
('Palma SkyModa LEPA', 1, 'LEPA'),
('Mallorcan Souvenirs LEPA', 2, 'LEPA'),
('Llibres de lAire LEPA', 8, 'LEPA'),
('ElectroPalma LEPA', 4, 'LEPA'),
('Duty-Free Plaer LEPA', 5, 'LEPA'),
('Cafè del Cel LEPA', 6, 'LEPA'),
('Vista a la Pista LEPA', 7, 'LEPA'),
('Moda en Vol LEPA', 3, 'LEPA'),
('Joies del Cel LEPA', 9, 'LEPA'),
('Perfums del Vol LEPA', 10, 'LEPA'),
('Nens del Cel LEPA', 15, 'LEPA'),
('Sol i Cel LEPA', 9, 'LEPA'),
('Elegància Aèria LEPA', 8, 'LEPA'),
('AireMelodíes LEPA', 7, 'LEPA'),
('Vi i Ales LEPA', 6, 'LEPA');

-- Sklepy na lotnisku Malpensa (LIMC)
INSERT INTO "sklep" ("nazwa_sklepu", "kategoria_id", "lotnisko_ICAO") VALUES
('Malpensa SkyChic LIMC', 1, 'LIMC'),
('Italian Airport Gifts LIMC', 2, 'LIMC'),
('Libri dellAria LIMC', 8, 'LIMC'),
('ElectroMalpensa LIMC', 4, 'LIMC'),
('Duty-Free Elegance LIMC', 5, 'LIMC'),
('Cloud Coffee Malpensa LIMC', 6, 'LIMC'),
('Skyline Dining Milano LIMC', 7, 'LIMC'),
('Fashion in Flight LIMC', 3, 'LIMC'),
('Jewelry in the Sky LIMC', 9, 'LIMC'),
('Perfumes in the Air LIMC', 10, 'LIMC'),
('Kids Sky Adventures LIMC', 15, 'LIMC'),
('Soleil in the Sky Malpensa LIMC', 9, 'LIMC'),
('Air Elegance LIMC', 8, 'LIMC'),
('SkyTunes Milano LIMC', 7, 'LIMC'),
('Wine & Wings Malpensa LIMC', 6, 'LIMC');

-- Sklepy na lotnisku Oslo Gardermoen (ENGM)
INSERT INTO "sklep" ("nazwa_sklepu", "kategoria_id", "lotnisko_ICAO") VALUES
('Oslo SkyStyle ENGM', 1, 'ENGM'),
('Norwegian Souvenirs ENGM', 2, 'ENGM'),
('AirBooks Norway ENGM', 8, 'ENGM'),
('ElectroOslo ENGM', 4, 'ENGM'),
('Duty-Free Delights ENGM', 5, 'ENGM'),
('Cloud Coffee Norway ENGM', 6, 'ENGM'),
('Skyline Dining Oslo ENGM', 7, 'ENGM'),
('Fashion in Flight ENGM', 3, 'ENGM'),
('Jewelry in the Sky Oslo ENGM', 9, 'ENGM'),
('Perfumes in the Air ENGM', 10, 'ENGM'),
('Kids Sky Adventures ENGM', 15, 'ENGM'),
('Soleil in the Sky Oslo ENGM', 9, 'ENGM'),
('Air Elegance Norway ENGM', 8, 'ENGM'),
('SkyTunes Oslo ENGM', 7, 'ENGM'),
('Wine & Wings Norway ENGM', 6, 'ENGM');

-- Sklepy na lotnisku Stockholm Arlanda (ESSA)
INSERT INTO "sklep" ("nazwa_sklepu", "kategoria_id", "lotnisko_ICAO") VALUES
('Stockholm SkyChic ESSA', 1, 'ESSA'),
('Swedish Treasures ESSA', 2, 'ESSA'),
('AirBooks Stockholm ESSA', 8, 'ESSA'),
('ElectroStockholm ESSA', 4, 'ESSA'),
('Duty-Free Elegance ESSA', 5, 'ESSA'),
('Cloud Coffee Sweden ESSA', 6, 'ESSA'),
('Skyline Dining Stockholm ESSA', 7, 'ESSA'),
('Fashion in Flight ESSA', 3, 'ESSA'),
('Jewelry in the Sky Stockholm ESSA', 9, 'ESSA'),
('Perfumes in the Air ESSA', 10, 'ESSA'),
('Kids Sky Adventures ESSA', 15, 'ESSA'),
('Soleil in the Sky Stockholm ESSA', 9, 'ESSA'),
('Air Elegance ESSA', 8, 'ESSA'),
('SkyTunes Stockholm ESSA', 7, 'ESSA'),
('Wine & Wings Sweden ESSA', 6, 'ESSA');

-- Sklepy na lotnisku Lyon–Saint-Exupéry (LFLL)
INSERT INTO "sklep" ("nazwa_sklepu", "kategoria_id", "lotnisko_ICAO") VALUES
('Lyon SkyMode LFLL', 1, 'LFLL'),
('French Souvenirs LFLL', 2, 'LFLL'),
('Livres de LFLL', 8, 'LFLL'),
('ElectroLyon LFLL', 4, 'LFLL'),
('Duty-Free Délices LFLL', 5, 'LFLL'),
('WolkenKaffee Lyon LFLL', 6, 'LFLL'),
('Himmelblick Restaurant LFLL', 7, 'LFLL'),
('Mode in der Luft LFLL', 3, 'LFLL'),
('Globe Elektronik France LFLL', 9, 'LFLL'),
('FlyBy Parfums LFLL', 10, 'LFLL'),
('Kinder FlugSet Lyon LFLL', 15, 'LFLL'),
('Soleil in the Sky LFLL', 9, 'LFLL'),
('Aviation Eleganz France LFLL', 8, 'LFLL'),
('SkyTunes Lyon LFLL', 7, 'LFLL'),
('Wein & Flügel France LFLL', 6, 'LFLL');

-- Sklepy na lotnisku Lisbon (LPPT)
INSERT INTO "sklep" ("nazwa_sklepu", "kategoria_id", "lotnisko_ICAO") VALUES
('Lisbon SkyStyle LPPT', 1, 'LPPT'),
('Portuguese Souvenirs LPPT', 2, 'LPPT'),
('AirBooks Lisbon LPPT', 8, 'LPPT'),
('ElectroLisbon LPPT', 4, 'LPPT'),
('Duty-Free Delights LPPT', 5, 'LPPT'),
('Cloud Coffee Portugal LPPT', 6, 'LPPT'),
('Skyline Dining Lisbon LPPT', 7, 'LPPT'),
('Fashion in Flight LPPT', 3, 'LPPT'),
('Jewelry in the Sky Lisbon LPPT', 9, 'LPPT'),
('Perfumes in the Air LPPT', 10, 'LPPT'),
('Kids Sky Adventures LPPT', 15, 'LPPT'),
('Soleil in the Sky Lisbon LPPT', 9, 'LPPT'),
('Air Elegance Lisbon LPPT', 8, 'LPPT'),
('SkyTunes Portugal LPPT', 7, 'LPPT'),
('Wine & Wings Lisbon LPPT', 6, 'LPPT');

-- Sklepy na lotnisku Václav Havel Airport Prague (LKPR)
INSERT INTO "sklep" ("nazwa_sklepu", "kategoria_id", "lotnisko_ICAO") VALUES
('Prague SkyChic LKPR', 1, 'LKPR'),
('Czech Souvenirs LKPR', 2, 'LKPR'),
('AirBooks Prague LKPR', 8, 'LKPR'),
('ElectroPrague LKPR', 4, 'LKPR'),
('Duty-Free Elegance LKPR', 5, 'LKPR'),
('Cloud Coffee Czech LKPR', 6, 'LKPR'),
('Skyline Dining Prague LKPR', 7, 'LKPR'),
('Fashion in Flight LKPR', 3, 'LKPR'),
('Jewelry in the Sky Prague LKPR', 9, 'LKPR'),
('Perfumes in the Air LKPR', 10, 'LKPR'),
('Kids Sky Adventures Prague LKPR', 15, 'LKPR'),
('Soleil in the Sky Prague LKPR', 9, 'LKPR'),
('Air Elegance Czech LKPR', 8, 'LKPR'),
('SkyTunes Prague LKPR', 7, 'LKPR'),
('Wine & Wings Czech LKPR', 6, 'LKPR');

-- Sklepy na lotnisku Málaga Airport (LEMG)
INSERT INTO "sklep" ("nazwa_sklepu", "kategoria_id", "lotnisko_ICAO") VALUES
('Málaga SkyModa LEMG', 1, 'LEMG'),
('Spanish Souvenirs LEMG', 2, 'LEMG'),
('Libros del Aire LEMG', 8, 'LEMG'),
('ElectroMálaga LEMG', 4, 'LEMG'),
('Duty-Free Plaer LEMG', 5, 'LEMG'),
('Cafè del Cel LEMG', 6, 'LEMG'),
('Vista a la Pista LEMG', 7, 'LEMG'),
('Moda en Vol LEMG', 3, 'LEMG'),
('Joies del Cel LEMG', 9, 'LEMG'),
('Perfums del Vol LEMG', 10, 'LEMG'),
('Nens del Cel LEMG', 15, 'LEMG'),
('Sol i Cel LEMG', 9, 'LEMG'),
('Elegància Aèria LEMG', 8, 'LEMG'),
('AireMelodíes LEMG', 7, 'LEMG'),
('Vi i Ales LEMG', 6, 'LEMG');

-- Sklepy na lotnisku Henri Coandă International Airport (LROP)
INSERT INTO "sklep" ("nazwa_sklepu", "kategoria_id", "lotnisko_ICAO") VALUES
('Bucharest SkyStyle LROP', 1, 'LROP'),
('Romanian Souvenirs LROP', 2, 'LROP'),
('AirBooks Bucharest LROP', 8, 'LROP'),
('ElectroBucharest LROP', 4, 'LROP'),
('Duty-Free Delights LROP', 5, 'LROP'),
('Cloud Coffee Romania LROP', 6, 'LROP'),
('Skyline Dining Bucharest LROP', 7, 'LROP'),
('Fashion in Flight LROP', 3, 'LROP'),
('Jewelry in the Sky Bucharest LROP', 9, 'LROP'),
('Perfumes in the Air LROP', 10, 'LROP'),
('Kids Sky Adventures LROP', 15, 'LROP'),
('Soleil in the Sky Bucharest LROP', 9, 'LROP'),
('Air Elegance Romania LROP', 8, 'LROP'),
('SkyTunes Bucharest LROP', 7, 'LROP'),
('Wine & Wings Romania LROP', 6, 'LROP');

-- Sklepy na lotnisku Marseille Provence Airport (LFML)
INSERT INTO "sklep" ("nazwa_sklepu", "kategoria_id", "lotnisko_ICAO") VALUES
('Marseille SkyChic LFML', 1, 'LFML'),
('French Treasures LFML', 2, 'LFML'),
('Livres de lAir LFML', 8, 'LFML'),
('ElectroMarseille LFML', 4, 'LFML'),
('Duty-Free Délices LFML', 5, 'LFML'),
('WolkenKaffee Marseille LFML', 6, 'LFML'),
('Himmelblick Restaurant LFML', 7, 'LFML'),
('Mode in der Luft LFML', 3, 'LFML'),
('Globe Elektronik France LFML', 9, 'LFML'),
('FlyBy Parfums LFML', 10, 'LFML'),
('Kinder FlugSet Marseille LFML', 15, 'LFML'),
('Soleil in the Sky LFML', 9, 'LFML'),
('Aviation Eleganz France LFML', 8, 'LFML'),
('SkyTunes Marseille LFML', 7, 'LFML'),
('Wein & Flügel France LFML', 6, 'LFML');

-- Sklepy na lotnisku Kraków Airport (EPKK)
INSERT INTO "sklep" ("nazwa_sklepu", "kategoria_id", "lotnisko_ICAO") VALUES
('Kraków SkyMode EPKK', 1, 'EPKK'),
('Polish Souvenirs EPKK', 2, 'EPKK'),
('Książki o Lotnictwie EPKK', 8, 'EPKK'),
('ElectroKraków EPKK', 4, 'EPKK'),
('Duty-Free Elegance EPKK', 5, 'EPKK'),
('Cloud Coffee Poland EPKK', 6, 'EPKK'),
('Skyline Dining Kraków EPKK', 7, 'EPKK'),
('Moda w Locie EPKK', 3, 'EPKK'),
('Elektronika w Chmurach EPKK', 9, 'EPKK'),
('Perfumy w Powietrzu EPKK', 10, 'EPKK'),
('Dziecięcy Lotniczy Świat EPKK', 15, 'EPKK'),
('Słońce w Chmurach Kraków EPKK', 9, 'EPKK'),
('Elegancja Powietrzna EPKK', 8, 'EPKK'),
('Melodie Powietrza Kraków EPKK', 7, 'EPKK'),
('Wino & Skrzydła EPKK', 6, 'EPKK');

-- Sklepy na lotnisku Gdańsk Lech Wałęsa Airport (EPGD)
INSERT INTO "sklep" ("nazwa_sklepu", "kategoria_id", "lotnisko_ICAO") VALUES
('Gdańsk SkyStyle EPGD', 1, 'EPGD'),
('Polish Treasures EPGD', 2, 'EPGD'),
('Książki o Lotnictwie EPGD', 8, 'EPGD'),
('ElectroGdańsk EPGD', 4, 'EPGD'),
('Duty-Free Delights EPGD', 5, 'EPGD'),
('Cloud Coffee Poland EPGD', 6, 'EPGD'),
('Skyline Dining Gdańsk EPGD', 7, 'EPGD'),
('Moda w Locie EPGD', 3, 'EPGD'),
('Elektronika w Chmurach EPGD', 9, 'EPGD'),
('Perfumy w Powietrzu EPGD', 10, 'EPGD'),
('Dziecięcy Lotniczy Świat EPGD', 15, 'EPGD'),
('Słońce w Chmurach Gdańsk EPGD', 9, 'EPGD'),
('Elegancja Powietrzna EPGD', 8, 'EPGD'),
('Melodie Powietrza Gdańsk EPGD', 7, 'EPGD'),
('Wino & Skrzydła EPGD', 6, 'EPGD');

-- Sklepy na lotnisku Katowice Airport (EPKT)
INSERT INTO "sklep" ("nazwa_sklepu", "kategoria_id", "lotnisko_ICAO") VALUES
('Katowice SkyChic EPKT', 1, 'EPKT'),
('Polish Treasures EPKT', 2, 'EPKT'),
('Książki o Lotnictwie EPKT', 8, 'EPKT'),
('ElectroKatowice EPKT', 4, 'EPKT'),
('Duty-Free Elegance EPKT', 5, 'EPKT'),
('Cloud Coffee Poland EPKT', 6, 'EPKT'),
('Skyline Dining Katowice EPKT', 7, 'EPKT'),
('Moda w Locie EPKT', 3, 'EPKT'),
('Elektronika w Chmurach EPKT', 9, 'EPKT'),
('Perfumy w Powietrzu EPKT', 10, 'EPKT'),
('Dziecięcy Lotniczy Świat EPKT', 15, 'EPKT'),
('Słońce w Chmurach Katowice EPKT', 9, 'EPKT'),
('Elegancja Powietrzna EPKT', 8, 'EPKT'),
('Melodie Powietrza Katowice EPKT', 7, 'EPKT'),
('Wino & Skrzydła EPKT', 6, 'EPKT');

-- Sklepy na lotnisku Poznań-Ławica Henryk Wieniawski Airport (EPPO)
INSERT INTO "sklep" ("nazwa_sklepu", "kategoria_id", "lotnisko_ICAO") VALUES
('Poznań SkyStyle EPPO', 1, 'EPPO'),
('Polish Treasures EPPO', 2, 'EPPO'),
('Książki o Lotnictwie EPPO', 8, 'EPPO'),
('ElectroPoznań EPPO', 4, 'EPPO'),
('Duty-Free Delights EPPO', 5, 'EPPO'),
('Cloud Coffee Poland EPPO', 6, 'EPPO'),
('Skyline Dining Poznań EPPO', 7, 'EPPO'),
('Moda w Locie EPPO', 3, 'EPPO'),
('Elektronika w Chmurach EPPO', 9, 'EPPO'),
('Perfumy w Powietrzu EPPO', 10, 'EPPO'),
('Dziecięcy Lotniczy Świat EPPO', 15, 'EPPO'),
('Słońce w Chmurach Poznań EPPO', 9, 'EPPO'),
('Elegancja Powietrzna EPPO', 8, 'EPPO'),
('Melodie Powietrza Poznań EPPO', 7, 'EPPO'),
('Wino & Skrzydła EPPO', 6, 'EPPO');

-- Sklepy na lotnisku Warsaw Chopin Airport (EPWA)
INSERT INTO "sklep" ("nazwa_sklepu", "kategoria_id", "lotnisko_ICAO") VALUES
('Warsaw SkyChic EPWA', 1, 'EPWA'),
('Polish Treasures EPWA', 2, 'EPWA'),
('Książki o Lotnictwie EPWA', 8, 'EPWA'),
('ElectroWarsaw EPWA', 4, 'EPWA'),
('Duty-Free Elegance EPWA', 5, 'EPWA'),
('Cloud Coffee Poland EPWA', 6, 'EPWA'),
('Skyline Dining Warsaw EPWA', 7, 'EPWA'),
('Moda w Locie EPWA', 3, 'EPWA'),
('Elektronika w Chmurach EPWA', 9, 'EPWA'),
('Perfumy w Powietrzu EPWA', 10, 'EPWA'),
('Dziecięcy Lotniczy Świat EPWA', 15, 'EPWA'),
('Słońce w Chmurach Warsaw EPWA', 9, 'EPWA'),
('Elegancja Powietrzna EPWA', 8, 'EPWA'),
('Melodie Powietrza Warsaw EPWA', 7, 'EPWA'),
('Wino & Skrzydła EPWA', 6, 'EPWA');