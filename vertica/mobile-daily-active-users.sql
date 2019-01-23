CREATE TABLE public.mobile_daily_active_users (
  app VARCHAR(20),
  os VARCHAR(20),
  day DATE,
  dau int,
  smooth_dau FLOAT,
  wau int,
  mau int,
  weekly_engagement NUMERIC(5, 2),
  monthly_engagement NUMERIC(5, 2)
);

GRANT SELECT on public.mobile_daily_active_users TO mdc_read;
GRANT SELECT on public.mobile_daily_active_users TO tableau_read;