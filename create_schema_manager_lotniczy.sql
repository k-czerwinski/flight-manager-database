CREATE SCHEMA manager_lotniczy;
SET SEARCH_PATH to manager_lotniczy;

CREATE TABLE "lotnisko" (
  "ICAO" char(4) PRIMARY KEY NOT NULL,
  "IATA" char(3) NOT NULL,
  "nazwa" varchar(50) UNIQUE NOT NULL,
  "miasto" varchar(30) NOT NULL
);

CREATE TABLE "sklep" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "nazwa_sklepu" varchar(50) NOT NULL,
  "kategoria_id" integer NOT NULL,
  "lotnisko_ICAO" char(4) NOT NULL
);

CREATE TABLE "kategoria_sklepu" (
  "id" INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY NOT NULL,
  "nazwa_kategorii" varchar(40) UNIQUE NOT NULL
);

CREATE TABLE "funkcja_pracownika_sklep" (
  "id" INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY NOT NULL,
  "nazwa" varchar(100) UNIQUE NOT NULL
);

CREATE TABLE "funkcja_pracownika_lotnisko" (
  "id" INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY NOT NULL,
  "nazwa" varchar(100) UNIQUE NOT NULL
);

CREATE TABLE "funkcja_pracownika_linia_lotnicza" (
  "id" INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY NOT NULL,
  "nazwa" varchar(100) NOT NULL
);

CREATE TABLE "pracownik" (
  "id" INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY NOT NULL,
  "imie" varchar(30) NOT NULL,
  "drugie_imie" varchar(30),
  "nazwisko" varchar(30) NOT NULL
);

CREATE TABLE "pracownik_lotnisko_dostep" (
  "lotnisko_ICAO" char(4) NOT NULL,
  "pracownik_id" integer NOT NULL,
  "dostep_strefa_kontroli_bezpieczenstwa" boolean NOT NULL DEFAULT false,
  "dostep_strefa_emigracyjna" boolean NOT NULL DEFAULT false,
  "dostep_plyta_lotniska" boolean NOT NULL DEFAULT false,
  "dostep_airside" boolean NOT NULL DEFAULT false,
  PRIMARY KEY ("lotnisko_ICAO", "pracownik_id")
);

CREATE TABLE "pracownik_sklep_funkcja" (
  "pracownik_id" integer NOT NULL,
  "funkcja_id" integer NOT NULL,
  "sklep_id" integer NOT NULL,
  PRIMARY KEY ("pracownik_id", "funkcja_id", "sklep_id")
);

CREATE TABLE "rejs" (
  "numer_rejsu" char(5) PRIMARY KEY NOT NULL,
  "lotnisko_odlotu_ICAO" char(4) NOT NULL,
  "lotnisko_przylotu_ICAO" char(4) NOT NULL,
  "godzina_odlotu" time NOT NULL,
  "godzina_przylotu" time NOT NULL,
  "linia_lotnicza_id" integer NOT NULL
);

CREATE TABLE "lot_data_samolot" (
  "lot_data_id" INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY NOT NULL,
  "data_odlotu" date NOT NULL,
  "data_przylotu" date NOT NULL,
  "numer_rejsu" char(5) NOT NULL,
  "samolot_id" char(6) NOT NULL,
  "pilot_1_id" integer,
  "pilot_2_id" integer,
  "cena_biletu_klasa_1" decimal,
  "cena_biletu_klasa_2" decimal NOT NULL
);

CREATE TABLE "samolot" (
  "numer" char(6) PRIMARY KEY NOT NULL,
  "model" varchar(30) NOT NULL,
  "liczba_pasazerow_klasa_1" integer NOT NULL,
  "liczba_pasazerow_klasa_2" integer NOT NULL,
  "liczba_zalogi" integer NOT NULL,
  "linia_lotnicza_id" integer NOT NULL
);

CREATE TABLE "linia_lotnicza" (
  "id" INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY NOT NULL,
  "nazwa" varchar(30) UNIQUE NOT NULL
);

CREATE TABLE "bilet" (
  "id" INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY NOT NULL,
  "lot_data_samolot_id" integer NOT NULL,
  "klasa_siedzenia" integer NOT NULL,
  "imie" varchar(30) NOT NULL,
  "drugie_imie" varchar(30),
  "nazwisko" varchar(30) NOT NULL,
  "numer_paszportu" char(9),
  "numer_dowodu_osobistego" char(9)
);

CREATE TABLE "pracownik_linia_lotnicza_funkcja" (
  "pracownik_id" integer NOT NULL,
  "linia_lotnicza_id" integer NOT NULL,
  "funkcja_id" integer NOT NULL,
  PRIMARY KEY ("pracownik_id", "linia_lotnicza_id", "funkcja_id")
);

CREATE TABLE "pracownik_lotnisko_funkcja" (
  "pracownik_id" integer NOT NULL,
  "lotnisko_ICAO" char(4) NOT NULL,
  "funkcja_id" integer NOT NULL,
  PRIMARY KEY ("pracownik_id", "lotnisko_ICAO", "funkcja_id")
);

COMMENT ON COLUMN "rejs"."lotnisko_odlotu_ICAO" IS 'Lotnisko wylottu nie może byc lotniskiem przylotu';

COMMENT ON COLUMN "rejs"."lotnisko_przylotu_ICAO" IS 'Lotnisko wylotu nie może być lotniskiem przylotu';

COMMENT ON COLUMN "lot_data_samolot"."pilot_1_id" IS 'Nie może być pilotem numer 2';

COMMENT ON COLUMN "lot_data_samolot"."pilot_2_id" IS 'Nie może być pilotem numer 1';

COMMENT ON COLUMN "lot_data_samolot"."cena_biletu_klasa_2" IS 'W każdym samolocie mamy miejsca w drugiej kalsie';

ALTER TABLE "sklep" ADD FOREIGN KEY ("kategoria_id") REFERENCES "kategoria_sklepu" ("id");

ALTER TABLE "sklep" ADD FOREIGN KEY ("lotnisko_ICAO") REFERENCES "lotnisko" ("ICAO");

ALTER TABLE "pracownik_lotnisko_dostep" ADD FOREIGN KEY ("lotnisko_ICAO") REFERENCES "lotnisko" ("ICAO");

ALTER TABLE "pracownik_lotnisko_dostep" ADD FOREIGN KEY ("pracownik_id") REFERENCES "pracownik" ("id");

ALTER TABLE "pracownik_sklep_funkcja" ADD FOREIGN KEY ("pracownik_id") REFERENCES "pracownik" ("id");

ALTER TABLE "pracownik_sklep_funkcja" ADD FOREIGN KEY ("funkcja_id") REFERENCES "funkcja_pracownika_sklep" ("id");

ALTER TABLE "pracownik_sklep_funkcja" ADD FOREIGN KEY ("sklep_id") REFERENCES "sklep" ("id");

ALTER TABLE "rejs" ADD FOREIGN KEY ("lotnisko_odlotu_ICAO") REFERENCES "lotnisko" ("ICAO");

ALTER TABLE "rejs" ADD FOREIGN KEY ("lotnisko_przylotu_ICAO") REFERENCES "lotnisko" ("ICAO");

ALTER TABLE "rejs" ADD FOREIGN KEY ("linia_lotnicza_id") REFERENCES "linia_lotnicza" ("id");

ALTER TABLE "lot_data_samolot" ADD FOREIGN KEY ("numer_rejsu") REFERENCES "rejs" ("numer_rejsu");

ALTER TABLE "lot_data_samolot" ADD FOREIGN KEY ("samolot_id") REFERENCES "samolot" ("numer");

ALTER TABLE "lot_data_samolot" ADD FOREIGN KEY ("pilot_1_id") REFERENCES "pracownik" ("id");

ALTER TABLE "lot_data_samolot" ADD FOREIGN KEY ("pilot_2_id") REFERENCES "pracownik" ("id");

ALTER TABLE "samolot" ADD FOREIGN KEY ("linia_lotnicza_id") REFERENCES "linia_lotnicza" ("id");

ALTER TABLE "bilet" ADD FOREIGN KEY ("lot_data_samolot_id") REFERENCES "lot_data_samolot" ("lot_data_id");

ALTER TABLE "pracownik_linia_lotnicza_funkcja" ADD FOREIGN KEY ("pracownik_id") REFERENCES "pracownik" ("id");

ALTER TABLE "pracownik_linia_lotnicza_funkcja" ADD FOREIGN KEY ("linia_lotnicza_id") REFERENCES "linia_lotnicza" ("id");

ALTER TABLE "pracownik_linia_lotnicza_funkcja" ADD FOREIGN KEY ("funkcja_id") REFERENCES "funkcja_pracownika_linia_lotnicza" ("id");

ALTER TABLE "pracownik_lotnisko_funkcja" ADD FOREIGN KEY ("pracownik_id") REFERENCES "pracownik" ("id");

ALTER TABLE "pracownik_lotnisko_funkcja" ADD FOREIGN KEY ("lotnisko_ICAO") REFERENCES "lotnisko" ("ICAO");

ALTER TABLE "pracownik_lotnisko_funkcja" ADD FOREIGN KEY ("funkcja_id") REFERENCES "funkcja_pracownika_lotnisko" ("id");

-- BELOW ADDITIONAL CONSTRAINTS NOT GENERATED AUTOAMATICALLYoraz

ALTER TABLE "lot_data_samolot" ADD CONSTRAINT CONSTRAINT_TWO_OTHER_PILOTS CHECK ("pilot_1_id" <> "pilot_2_id");

ALTER TABLE "rejs" ADD CONSTRAINT CONSTRAINT_DEPARTURE_ARRIVE_AIRPORT_NOT_SAME CHECK (rejs."lotnisko_przylotu_ICAO" <> rejs."lotnisko_odlotu_ICAO");

ALTER TABLE "lot_data_samolot" ADD CONSTRAINT CONSTRAINT_LOT_SAMOLOR_NOT_EMPTY CHECK (lot_data_samolot.samolot_id <> '');

ALTER TABLE "bilet" ADD CONSTRAINT NUMER_PASZPORTU_OR_DOWODU_NOT_EMPTY CHECK (numer_dowodu_osobistego is not null or numer_paszportu is not null);

ALTER TABLE "bilet" ADD CONSTRAINT NUMER_PASZPORTU_DLUGOSC CHECK (numer_paszportu IS NULL OR length(numer_paszportu) = 9);

ALTER TABLE "bilet" ADD CONSTRAINT NUMER_DOWODU_DLUGOSC CHECK ( numer_dowodu_osobistego IS NULL OR length(numer_dowodu_osobistego) = 9 );

ALTER TABLE "pracownik" ADD CONSTRAINT PRACOWNIK_IMIE_MIN_DLUGOSC CHECK ( length(imie) >= 2 );

ALTER TABLE "pracownik" ADD CONSTRAINT PRACOWNIK_DRUGIE_IMIE_MIN_DLUGOSC CHECK ( length(drugie_imie) >= 2 );

ALTER TABLE "pracownik" ADD CONSTRAINT PRACOWNIK_NAZIWSKO_MIN_DLUGOSC CHECK ( length(nazwisko) >= 2 );

ALTER TABLE "bilet" ADD CONSTRAINT PASAZER_IMIE_MIN_DLUGOSC CHECK ( length(imie) >= 2 );

ALTER TABLE "bilet" ADD CONSTRAINT PASAZER_DRUGIE_IMIE_MIN_DLUGOSC CHECK ( length(drugie_imie) >= 2 );

ALTER TABLE "bilet" ADD CONSTRAINT PASAZER_NAZIWSKO_MIN_DLUGOSC CHECK ( length(nazwisko) >= 2 );

ALTER TABLE "lotnisko" ADD CONSTRAINT ICAO_DLUGOSC CHECK ( length("ICAO") = 4 );

ALTER TABLE "lotnisko" ADD CONSTRAINT IATA_DLUGOSC CHECK ( length("IATA") = 3 );

ALTER TABLE "samolot" ADD CONSTRAINT NUMER_SAMOLOTU_DLUGOSC CHECK ( length(numer) = 6 );

ALTER TABLE "lotnisko" ADD CONSTRAINT MIASTO_MIN_DLUGOSC CHECK ( length(miasto) >= 3 );

ALTER TABLE "lotnisko" ADD CONSTRAINT NAZWA_MIN_DLUGOSC CHECK ( length(nazwa) >= 3 );

