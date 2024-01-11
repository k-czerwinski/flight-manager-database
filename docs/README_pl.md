# Manager Lotniczy - Projekt Bazy Danych Postgre SQL

Repozytorium zawiera skrypty SQL tworzące strukturę bazy danych oraz dodające do niej przykładowe dane. Ta baza danych została stworzona na potrzeby projektu zaliczeniowego do przedmiotu Bazy Danych 1. Język polski aplikacji oraz bazy danych jest wymuszony poprzez wymagania dotyczące projektu zaliczeniowego.
**Link do repozytorium aplikacji:** <a href="https://github.com/k-czerwinski/manager-lotniczy" target="_blank">Manager Lotniczy</a>

## Struktura bazy danych

Projekt bazy danych obejmuje stworzenie schem-y, tabeli, funkcji oraz widoków, a także stworzenie danych testowych - wygenerowych przy pomocy AI. Baza danych zapewnia kompleksowe zarządzanie lotniskami, lotami, liniami lotniczymi oraz samolotami, a także dla każdych z tych encji mamy możliwość zarządzania pracownikami. Baza danych zawiera również informację o dostępach pracowników, który pracownik ma dostęp do danej części danego lotniska. Dodatkowo dla bazy danych tworzymy dwie rolę użytkownika(klient/admin), które określają możliwości dostępów do tabeli i widoków.
Poniżej załączony jest diagram ERD:
![ERD](./manager_lotniczy.png)

## Aspekty techniczne

W projekcie wykorzystano wiele funkcjonalności Postgre SQL, w tym:

- Widoki: Widoki pozwalają na tworzenie wirtualnych tabel, które można wykorzystać w zapytaniach SQL. W projekcie wykorzystano widoki do uproszczenia zapytań i ułatwienia analizy danych.
- Procedury CTE: Procedury CTE pozwalają na tworzenie tymczasowych tabel, które można wykorzystać w zapytaniach SQL. W projekcie wykorzystano procedury CTE do uproszczenia zapytań i ułatwienia analizy danych.
- Pętle: Pętle pozwalają na powtarzanie operacji w zapytaniach SQL. W projekcie wykorzystano pętle do automatyzacji procesów biznesowych.
- Funkcje: Funkcje pozwalają na tworzenie niestandardowych funkcji w języku SQL. W projekcie wykorzystano funkcje do uproszczenia zapytań i ułatwienia analizy danych.
- Role użytkowników: Role użytkowników pozwalają na kontrolowanie dostępu do bazy danych. W projekcie wykorzystano role admina i klienta, które określają możliwości dostępów do tabeli i widoków.
- Constrainty: walidują dane, które wstawiane są do bazy danych

## Normalizacja

Tabele zostały zoptymalizowane zgodnie z 3 postaciami normalnymi

#### Pierwsza postać normalna

W tym kroku stowrzyliśmy klilka nowych tabeli, aby uniknąć redundancji:

- Z tabeli sklep wyłączyliśmy tabelę sklep_kategoria zwierająca informacje o kategorii sklepu
- dla każdego z typów pracownika wyłączyliśmy osobną tabele z funkcjami dla danego typu prracownika

#### Druga postać normalna

W tym kroku wykonaliśmy następujące operacje:

- Zamiast tworzyć 3 tabele(pracownik lotniska, pracownik sklepu, pracownik lini) stworzyliśmy jedną tabelę zawierającą informację o wszystkich pracownikach, klucz główny w tej tabel jest używany w osobnych tabelach, aby określić funkcje pracownikow, mejsca pracy jak i dostępy

#### Trzecia postać normalna

W przypadku tej zasady nie zdecydowałem się na kolejne podziały tabel.
