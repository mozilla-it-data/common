CREATE TABLE public.ut_desktop_daily_active_users (
  day DATE,
  mau int,
  dau int,
  smooth_dau FLOAT,
  engagement_ratio NUMERIC(5, 2)
);


GRANT SELECT on public.ut_desktop_daily_active_users TO tableau_read;
GRANT SELECT on public.ut_desktop_daily_active_users TO mdc_read;