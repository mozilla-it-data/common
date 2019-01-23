CREATE OR REPLACE VIEW public.sf_contacts_vw  as
SELECT
id,
created_date,
CASE
  WHEN contact_name IS NOT NULL AND contact_name != '_' THEN 1
  ELSE 0
END as has_name,

CASE
  WHEN email is not null AND email != '_' then TRUE
  ELSE FALSE
END as has_email,

email_format,
email_language,
mailing_country,
signup_source_url,
double_opt_in,
email_opt_out,
subscriber,
CASE
  WHEN sub_test_pilot =1 OR sub_firefox_and_you = 1 OR sub_firefox_accounts_journey = 1 THEN TRUE
  ELSE FALSE
END as fx_subscriber,

sub_apps_and_hacks as dev_subscriber,
sub_mozilla_foundation as moz_subscriber,
CASE
  WHEN
    sub_miti_subscriber = 1 OR
    sub_mozilla_leadership_network = 1 OR
    sub_mozilla_learning_network = 1 OR
    sub_webmaker = 1 OR
    sub_mozillians_nda = 1 OR
    sub_open_innovation_subscriber = 1 OR
    sub_test_flight = 1 OR
    sub_view_source_global = 1 OR
    sub_view_source_namerica = 1
  THEN TRUE
  ELSE FALSE
END as other_subscriber,
--other_subscriber is NOT currently supported because we are missing some of the fields we need
CASE
  WHEN double_opt_in = 1 AND email_opt_out = 0 AND subscriber = 1 THEN 1
  ELSE 0
END as is_active_subscriber
FROM sf_contacts;

GRANT SELECT on public.sf_contacts_vw TO tableau_read;
GRANT SELECT on public.sf_contacts_vw TO mdc_read

CREATE OR REPLACE VIEW public.sf_contact_history_vw  as
SELECT
contact_id,
created_date,
CASE
  WHEN field in ('Sub_Test_Pilot__c','Sub_Firefox_And_You__c','Sub_Firefox_Accounts_Journey__c') THEN 'Firefox'
  WHEN field in ('Sub_Apps_And_Hacks__c') THEN 'Developer'
  WHEN field in ('Sub_Mozilla_Foundation__c') THEN 'Mozilla'
  WHEN field in ('Sub_MITI_Subscriber__c','Sub_Mozilla_Learning_Network__c','Sub_Mozilla_Leadership_Network__c','Sub_Webmaker__c','Sub_Mozillians__c','Sub_Open_Innovation_Subscriber__c','Sub_Test_Flight__c','Sub_View_Source_Global__c','Sub_View_Source_Namerica__c','Sub_Mozillians_NDA__c') THEN 'Other'
  ELSE field
END as field,
new_value,
old_value
FROM sf_contact_history;

GRANT SELECT on public.sf_contact_history_vw TO tableau_read;
GRANT SELECT on public.sf_contact_history_vw TO mdc_read
