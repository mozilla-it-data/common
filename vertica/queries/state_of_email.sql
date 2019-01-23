-- Unique contacts added in a given quarter
SELECT QUARTER(created_date) AS quarter,
YEAR (created_date) AS YEAR,
COUNT (Id)
FROM sf_contacts_vw
GROUP BY quarter, YEAR
ORDER BY YEAR, quarter;

-- # of contacts by list
SELECT
  list,
  n
FROM (
       SELECT
         'dev' AS list,
         COUNT(*) n
       FROM sf_contacts_vw
       WHERE dev_subscriber IS TRUE
       UNION
       SELECT
         'firefox' AS list,
         COUNT(*)     n
       FROM sf_contacts_vw
       WHERE fx_subscriber IS TRUE
       UNION
       SELECT
         'foundation' AS list,
         COUNT(*)        n
       FROM sf_contacts_vw
       WHERE moz_subscriber IS TRUE
       UNION
       SELECT
         'other' AS list,
         COUNT(*)   n
       FROM sf_contacts_vw
       WHERE other_subscriber IS TRUE
     ) a
ORDER BY n DESC;

-- # of contacts with name
SELECT
  has_name,
  COUNT(*)
FROM sf_contacts_vw
GROUP BY has_name;

--- # of contacts with email
SELECT
  has_email,
  COUNT(*)
FROM sf_contacts_vw
GROUP BY has_email;

-- # of opt-in contacts
SELECT
  is_active_subscriber,
  COUNT(*)
FROM sf_contacts_vw
GROUP BY is_active_subscriber;

-- # of contacts with FF account
-- TODO: Not sure how we figure this one out

-- # of contacts with HTML vs TEXT
SELECT
  email_format,
  COUNT(*)
FROM sf_contacts_vw
WHERE
  is_active_subscriber IS TRUE
GROUP BY email_format;

-- # of Opt-in Contacts with Source Info
SELECT COUNT(*) AS n
FROM sf_contacts_vw
WHERE
  is_active_subscriber IS TRUE
  AND signup_source_url IS NOT NULL;

-- Top 5 sources
SELECT
  RANK()      OVER (ORDER BY COUNT (*) DESC) AS rank,
  COUNT(*) AS n,
  signup_source_url
FROM sf_contacts_vw
WHERE
  signup_source_url IS NOT NULL
  AND is_active_subscriber IS TRUE
GROUP BY signup_source_url
ORDER BY count(*) DESC
LIMIT 5;


-- # of contacts with language
SELECT
  COUNT(*)
FROM sf_contacts_vw
WHERE email_language IS NOT NULL
AND is_active_subscriber IS TRUE;


-- Top 5 languages
SELECT
  email_language,
  RANK() OVER (ORDER BY COUNT (*) DESC) AS rank,
  COUNT(*)
FROM sf_contacts_vw
WHERE email_language IS NOT NULL
      AND is_active_subscriber IS TRUE
GROUP BY email_language
ORDER BY COUNT(*) DESC
LIMIT 5;


-- # of contacts with mailing country
SELECT
  COUNT(*)
FROM sf_contacts_vw
WHERE mailing_country IS NOT NULL
AND is_active_subscriber IS TRUE;


-- Top 5 countries
SELECT
  mailing_country,
  RANK() OVER (ORDER BY COUNT (*) DESC) AS rank,
  COUNT(*)
FROM sf_contacts_vw
WHERE email_language IS NOT NULL
      AND is_active_subscriber IS TRUE
  AND mailing_country IS NOT NULL
GROUP BY mailing_country
ORDER BY COUNT(*) DESC
LIMIT 5;

-- REQUIRES MARKETING CLOUD DATA --
-- # of Active Contacts (>25% of opens of emails received in quarter)
-- # of low active contacts (0<x<25% of opens of emails received in quarter)
-- # of inactive contacts (0 opens of emails in 12 months)
-- # of hard bounce contacts (cannot reach System status: held or global unsubsribed)
-- # of emails sent
-- # of HTML Emails Sent
-- # of Emails Delivered (only applies to HTML, no tracking in text)
-- # of Unique Opens (only applies to HTML, no tracking in text)
-- # of Unique Clicks (only applies to HTML)
-- Avg Click to Open Rate
-- # of Unsubscribes
-- # of marked as spam
-- # of individual campaigns sent