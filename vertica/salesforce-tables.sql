CREATE TABLE IF NOT EXISTS public.sf_donation_count (
  opp_name varchar(20),
  opp_type varchar(50),
  lead_source varchar(50),
  amount float,
  close_date date,
  next_step varchar(50),
  stage varchar(20),
  probability int,
  fiscal_period char(7),
  age float,
  created_date date,
  opp_owner varchar(50),
  owner_role varchar(50),
  account_name varchar(50)
);

CREATE TABLE IF NOT EXISTS public.sf_donations (
  opp_name varchar(20),
  amount NUMERIC(18, 2),
  contact_id VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS public.sf_foundation_signups (
  contact_id VARCHAR(50),
  signup_date TIMESTAMP WITH TIMEZONE
);

CREATE TABLE IF NOT EXISTS public.sf_copyright_petition (
  contact_id VARCHAR(50),
  signed_on_date DATE
);


GRANT SELECT on public.sf_donation_count TO mdc_read;
GRANT SELECT on public.sf_donation_count TO tableau_read;
GRANT SELECT on public.sf_donations TO mdc_read;
GRANT SELECT on public.sf_donations TO tableau_read;
GRANT SELECT on public.sf_foundation_signups TO mdc_read;
GRANT SELECT on public.sf_foundation_signups TO tableau_read;
GRANT SELECT on public.sf_copyright_petition TO mdc_read;
GRANT SELECT on public.sf_copyright_petition TO tableau_read;


CREATE TABLE IF NOT EXISTS public.sf_contacts (
  id VARCHAR(50),
  created_date TIMESTAMP,
  email_format VARCHAR(1),
  email_language VARCHAR(10),
  signup_source_url VARCHAR(500),
  confirmation_miti_subscriber BOOLEAN,
  sub_apps_and_hacks BOOLEAN,
  sub_firefox_and_you BOOLEAN,
  sub_firefox_accounts_journey BOOLEAN,
  sub_mozilla_foundation BOOLEAN,
  sub_miti_subscriber BOOLEAN,
  sub_mozilla_leadership_network BOOLEAN,
  sub_mozilla_learning_network BOOLEAN,
  sub_webmaker BOOLEAN,
  sub_mozillians_nda BOOLEAN,
  sub_open_innovation_subscriber BOOLEAN,
  subscriber BOOLEAN,
  sub_test_flight BOOLEAN,
  sub_test_pilot BOOLEAN,
  sub_view_source_global BOOLEAN,
  sub_view_source_namerica BOOLEAN,
  double_opt_in BOOLEAN,
  unengaged BOOLEAN,
  email_opt_out BOOLEAN,
  mailing_country VARCHAR(255),
  sub_common_voice BOOLEAN,
  sub_hubs BOOLEAN,
  sub_mixed_reality BOOLEAN,
  sub_mozilla_tech BOOLEAN,
  amo_email_opt_in BOOLEAN
);

CREATE TABLE IF NOT EXISTS public.sf_contact_history (
  field VARCHAR(50),
  contact_id VARCHAR(50),
  created_date timestamp,
  new_value VARCHAR(255),
  old_value VARCHAR(255)
);

-- NOTE:  We explicitly do NOT give access to these tables to mdc or tableau
