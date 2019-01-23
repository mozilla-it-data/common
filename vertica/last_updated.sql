CREATE TABLE public.last_updated (
  name VARCHAR(100) PRIMARY KEY,
  updated_at TIMESTAMP,
  updated_by VARCHAR(255)
);

GRANT SELECT ON public.last_updated TO nagiosdaemon;