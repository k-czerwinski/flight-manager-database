-- SET SEARCH_PATH to manager_lotniczy;

CREATE ROLE app_admin;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA postgres.manager_lotniczy TO app_admin;
grant connect, create, temporary on database postgres to app_admin;


create role app_user;
GRANT SELECT ON TABLE postgres.manager_lotniczy.lot_klient TO app_user;
grant create, usage on schema postgres."manager_lotniczy" to "app_admin";