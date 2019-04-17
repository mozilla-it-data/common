CREATE OR REPLACE VIEW public.sf_contacts_vw  as
SELECT
id,
created_date,
FALSE as has_name,

TRUE as has_email,

email_format,
email_language,
mailing_country,
signup_source_url,
double_opt_in,
email_opt_out,
subscriber,
CASE
  WHEN sub_firefox_and_you = 1 OR sub_firefox_accounts_journey = 1 THEN TRUE
  ELSE FALSE
END as fx_subscriber,
CASE
  WHEN sub_common_voice = 1 OR sub_hubs = 1 OR sub_mixed_reality = 1 OR sub_mozilla_tech = 1 THEN TRUE
  ELSE FALSE
END as moz_labs_subscriber,

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
    sub_view_source_namerica = 1 OR
    amo_email_opt_in = 1
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
  WHEN field in ('Sub_MITI_Subscriber__c','Sub_Mozilla_Learning_Network__c','Sub_Mozilla_Leadership_Network__c','Sub_Webmaker__c','Sub_Mozillians__c','Sub_Open_Innovation_Subscriber__c','Sub_Test_Flight__c','Sub_View_Source_Global__c','Sub_View_Source_Namerica__c','Sub_Mozillians_NDA__c','AMO_Email_Opt_In__c') THEN 'Other'
  WHEN field in ('Sub_Common_Voice__c','Sub_Hubs__c','Sub_Mixed_Reality__c','Sub_Mozilla_Tech__c') THEN 'Mozilla_Labs'
  ELSE field
END as field,
new_value,
old_value
FROM sf_contact_history;

GRANT SELECT on public.sf_contact_history_vw TO tableau_read;
GRANT SELECT on public.sf_contact_history_vw TO mdc_read

CREATE OR REPLACE VIEW public.sfmc_daily_send_summary_vw as
SELECT 
send_date,
message_id,
CASE
WHEN REGEXP_LIKE(email_name, '^moco.*_moz_','i') THEN 'Mozilla-MoCo'
WHEN REGEXP_LIKE(email_name, '^mofo',       'i') THEN 'Mozilla-MoFo'
WHEN REGEXP_LIKE(email_name, '_mofo_',      'i') THEN 'Mozilla-MoFo'
WHEN REGEXP_LIKE(email_name, 'foundation',  'i') THEN 'Mozilla-MoFo'
WHEN REGEXP_LIKE(email_name, '_(AVO|FUND)_'    ) THEN 'Mozilla-MoFo'
WHEN REGEXP_LIKE(email_name, '_FF_',        'i') THEN 'Firefox'
WHEN REGEXP_LIKE(email_name, 'firefox',     'i') THEN 'Firefox'
WHEN REGEXP_LIKE(email_name, 'fx',          'i') THEN 'Firefox'
WHEN REGEXP_LIKE(email_name, '_DEV_',       'i') THEN 'Developer'
WHEN REGEXP_LIKE(email_name, '^About_Mozilla'  ) THEN 'Other'
WHEN email_name='MoCo_GLOBAL_MOZ_2017_GEN_MITI_HTML_WELCOME_ALL_EN_EML' THEN 'Other'
ELSE 'UNKNOWN'
END AS bucket_name,
CASE
WHEN REGEXP_LIKE(email_name, '[_ ]EN([_ -]|$)') THEN 'EN'
WHEN REGEXP_LIKE(email_name, '[_ ]RU([_ -]|$)') THEN 'RU'
WHEN REGEXP_LIKE(email_name, '[_ ]PT(BR)?([_ -]|$)') THEN 'PT'
WHEN REGEXP_LIKE(email_name, '[_ ]DE([_ -]|$)') THEN 'DE'
WHEN REGEXP_LIKE(email_name, '[_ ]ID([_ -]|$)') THEN 'ID'
WHEN REGEXP_LIKE(email_name, '[_ ]PL([_ -]|$)') THEN 'PL'
WHEN REGEXP_LIKE(email_name, '[_ ]FR([_ -]|$)') THEN 'FR'
WHEN REGEXP_LIKE(email_name, '[_ ]IT([_ -]|$)') THEN 'IT'
WHEN REGEXP_LIKE(email_name, '[_ ]ES([_ -]|$)') THEN 'ES'
WHEN REGEXP_LIKE(email_name, '[_ ]ZH(TW)?([_ -]|$)') THEN 'ZH'
ELSE 'EN'
END AS lang,
sends,
deliveries,
delivery_rate,
unique_opens,
open_rate,
unique_clicks,
click_rate,
unsubscribes,
unsubscribe_rate,
complaints
FROM sfmc_daily_email_send_summary;

GRANT SELECT on public.sfmc_daily_send_summary_vw TO tableau;
