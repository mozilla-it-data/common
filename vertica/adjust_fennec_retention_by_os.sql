CREATE TABLE public.adjust_fennec_retention_by_os (
  date date,
  os varchar(10),
  period int,
  retention NUMERIC(5, 4)
);

GRANT SELECT on public.adjust_fennec_retention_by_os TO mdc_read;
GRANT SELECT on public.adjust_fennec_retention_by_os TO tableau_read;




CREATE TABLE public.adjust_retention (
  date date,
  os varchar(10),
  period int,
  retention NUMERIC(5, 4),
  app varchar(10)
);

GRANT SELECT ON public.adjust_retention TO mdc_read;
GRANT SELECT ON public.adjust_retention TO tableau_read;