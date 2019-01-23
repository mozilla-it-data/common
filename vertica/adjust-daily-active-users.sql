CREATE TABLE public.adjust_ios_daily_active_users (
  adj_date DATE,
  daus     FLOAT,
  waus     FLOAT,
  maus     FLOAT
);

GRANT SELECT ON public.adjust_ios_daily_active_users TO mdc_read;
GRANT SELECT ON public.adjust_ios_daily_active_users TO tableau_read;

CREATE TABLE public.adjust_android_daily_active_users (
  adj_date DATE,
  daus     FLOAT,
  waus     FLOAT,
  maus     FLOAT
);

GRANT SELECT ON public.adjust_android_daily_active_users TO mdc_read;
GRANT SELECT ON public.adjust_android_daily_active_users TO tableau_read;


CREATE TABLE public.adjust_focus_daily_active_users (
  adj_date DATE,
  daus     FLOAT,
  waus     FLOAT,
  maus     FLOAT,
  install  INT
);

GRANT SELECT ON public.adjust_focus_daily_active_users TO mdc_read;
GRANT SELECT ON public.adjust_focus_daily_active_users TO tableau_read;


CREATE TABLE public.adjust_klar_daily_active_users (
  adj_date DATE,
  daus     FLOAT,
  waus     FLOAT,
  maus     FLOAT,
  installs INT
);

GRANT SELECT ON public.adjust_klar_daily_active_users TO mdc_read;
GRANT SELECT ON public.adjust_klar_daily_active_users TO tableau_read;


CREATE OR REPLACE VIEW PUBLIC.adjust_daily_active_users_vw AS
SELECT
  adj_date,
  daus,
  waus,
  maus,
  'Firefox iOS' AS type
FROM adjust_ios_daily_active_users
UNION
SELECT
  adj_date,
  daus,
  waus,
  maus,
  'Firefox Android' AS type
FROM adjust_android_daily_active_users
UNION
SELECT
  adj_date,
  daus,
  waus,
  maus,
  'Klar' AS type
FROM adjust_klar_daily_active_users
UNION
SELECT
  adj_date,
  daus,
  waus,
  maus,
  'Focus' AS type
FROM adjust_focus_daily_active_users;

GRANT SELECT ON public.adjust_daily_active_users_vw TO mdc_read;
GRANT SELECT ON public.adjust_daily_active_users_vw TO tableau_read;


--Combined
CREATE TABLE public.adjust_daily_active_users (
  adj_date DATE,
  os varchar(10),
  daus     FLOAT,
  waus     FLOAT,
  maus     FLOAT,
  installs INT,
  app varchar(10)
);

GRANT SELECT ON public.adjust_daily_active_users TO mdc_read;
GRANT SELECT ON public.adjust_daily_active_users TO tableau_read;
