CREATE TABLE IF NOT EXISTS workday_ta_hires (
      effective DATE,
      transaction_status VARCHAR(25),
      staffing_event_reason VARCHAR(255),
      cost_center VARCHAR(50),
      cost_center_hierarchy VARCHAR(50),
      functional_group VARCHAR(50),
      steering_committee VARCHAR(50),
      scvp VARCHAR(50),
      management_chain_level_01 VARCHAR(50),
      management_chain_level_02 VARCHAR(50),
      management_chain_level_03 VARCHAR(50),
      management_chain_level_04 VARCHAR(50),
      management_chain_level_05 VARCHAR(50),
      management_chain_level_06 VARCHAR(50),
      greenhouse_position_type VARCHAR(20),
      postion_id VARCHAR(15),
      employee_id VARCHAR(20),
      worker_type VARCHAR(25),
      position_worker_type VARCHAR(50),
      job_family VARCHAR(50),
      job_level VARCHAR(25),
      is_manager BOOLEAN,
      engineering_nonengineering VARCHAR(20),
      original_hire_date DATE,
      continuous_service_date DATE,
      company_service_date DATE,
      benefits_service_date DATE,
      seniority_date DATE,
      hire_date DATE,
      office_or_remote_status VARCHAR(10),
      work_address_city VARCHAR(100),
      work_address_postal_code VARCHAR(20),
      location VARCHAR(50),
      location_country VARCHAR(50),
      manager_name VARCHAR(100),
      worker_status VARCHAR(15),
      people_partner VARCHAR(50),
      snapshot_date DATE
);

GRANT SELECT on public.workday_ta_hires TO tableau;
GRANT SELECT on public.workday_ta_hires TO john_miller;

CREATE TABLE IF NOT EXISTS workday_hires_weekly (
  employee_id VARCHAR(20),
  gender VARCHAR(20),
  female BOOLEAN,
  male BOOLEAN,
  gender_decline BOOLEAN,
  gender_other BOOLEAN,
  gender_blank BOOLEAN,
  race_ethnicity VARCHAR(255),
  asian BOOLEAN,
  black_or_african_american BOOLEAN,
  hispanic_or_latino BOOLEAN,
  native_hawaiian_or_other_pacific_islander BOOLEAN,
  american_indian_or_alaska_native BOOLEAN,
  two_or_more_races BOOLEAN,
  race_is_other BOOLEAN,
  white BOOLEAN,
  race_decline BOOLEAN,
  race_blank BOOLEAN,
  original_hire_date DATE,
  continuous_service_date DATE,
  company_service_date DATE,
  benefits_service_date DATE,
  seniority_date DATE,
  cost_center VARCHAR(10),
  cost_center_hierarchy VARCHAR(50),
  functional_group VARCHAR(50),
  steering_committee VARCHAR(50),
  scvp VARCHAR(50),
  management_chain_level_01 VARCHAR(50),
  management_chain_level_02 VARCHAR(50),
  management_chain_level_03 VARCHAR(50),
  management_chain_level_04 VARCHAR(50),
  management_chain_level_05 VARCHAR(50),
  management_chain_level_06 VARCHAR(50),
  worker_type VARCHAR(25),
  position_worker_type VARCHAR(50),
  job_family VARCHAR(50),
  management_level VARCHAR(25),
  is_manager BOOLEAN,
  engineering_nonengineering VARCHAR(20),
  date DATE,
  office_or_remote VARCHAR(10),
  work_address_city VARCHAR(100),
  work_address_postal_code VARCHAR(20),
  location VARCHAR(50),
  location_country VARCHAR(50),
  manager_name VARCHAR(100),
  worker_status VARCHAR(15),
  people_partner VARCHAR(50),
  snapshot_date DATE,
  report_name VARCHAR(15)
);

CREATE TABLE IF NOT EXISTS workday_hires_monthly LIKE workday_hires_weekly;

GRANT SELECT on public.workday_hires_weekly TO tableau;
GRANT SELECT on public.workday_hires_weekly TO john_miller;
GRANT SELECT on public.workday_hires_monthly TO tableau;
GRANT SELECT on public.workday_hires_monthly TO john_miller;

CREATE TABLE IF NOT EXISTS workday_terminations_weekly (
  employee_id VARCHAR(20),
  gender VARCHAR(20),
  female BOOLEAN,
  male BOOLEAN,
  gender_decline BOOLEAN,
  gender_other BOOLEAN,
  gender_blank BOOLEAN,
  race_ethnicity VARCHAR(255),
  asian BOOLEAN,
  black_or_african_american BOOLEAN,
  hispanic_or_latino BOOLEAN,
  native_hawaiian_or_other_pacific_islander BOOLEAN,
  american_indian_or_alaska_native BOOLEAN,
  two_or_more_races BOOLEAN,
  race_is_other BOOLEAN,
  white BOOLEAN,
  race_decline BOOLEAN,
  race_blank BOOLEAN,
  original_hire_date DATE,
  continuous_service_date DATE,
  company_service_date DATE,
  benefits_service_date DATE,
  seniority_date DATE,
  hire_date DATE,
  cost_center VARCHAR(10),
  cost_center_hierarchy VARCHAR(50),
  functional_group VARCHAR(50),
  steering_committee VARCHAR(50),
  scvp VARCHAR(50),
  management_chain_level_01 VARCHAR(50),
  management_chain_level_02 VARCHAR(50),
  management_chain_level_03 VARCHAR(50),
  management_chain_level_04 VARCHAR(50),
  management_chain_level_05 VARCHAR(50),
  management_chain_level_06 VARCHAR(50),
  worker_type VARCHAR(25),
  position_worker_type VARCHAR(50),
  job_family VARCHAR(50),
  management_level VARCHAR(25),
  is_manager BOOLEAN,
  engineering_nonengineering VARCHAR(20),
  office_or_remote VARCHAR(10),
  work_address_city VARCHAR(100),
  work_address_postal_code VARCHAR(20),
  location VARCHAR(50),
  location_country VARCHAR(50),
  manager_name VARCHAR(100),
  worker_status VARCHAR(15),
  people_partner VARCHAR(50),
  date DATE,
  termination_category VARCHAR(50),
  reason VARCHAR(255),
  snapshot_date DATE,
  report_name VARCHAR(15)
);

CREATE TABLE IF NOT EXISTS workday_terminations_monthly LIKE workday_terminations_weekly;

GRANT SELECT on public.workday_terminations_weekly TO tableau;
GRANT SELECT on public.workday_terminations_weekly TO john_miller;
GRANT SELECT on public.workday_terminations_monthly TO tableau;
GRANT SELECT on public.workday_terminations_monthly TO john_miller;

CREATE TABLE IF NOT EXISTS workday_promotions_weekly (
  employee_id VARCHAR(20),
  gender VARCHAR(20),
  female BOOLEAN,
  male BOOLEAN,
  gender_decline BOOLEAN,
  gender_other BOOLEAN,
  gender_blank BOOLEAN,
  race_ethnicity VARCHAR(255),
  asian BOOLEAN,
  black_or_african_american BOOLEAN,
  hispanic_or_latino BOOLEAN,
  native_hawaiian_or_other_pacific_islander BOOLEAN,
  american_indian_or_alaska_native BOOLEAN,
  two_or_more_races BOOLEAN,
  race_is_other BOOLEAN,
  white BOOLEAN,
  race_decline BOOLEAN,
  race_blank BOOLEAN,
  original_hire_date DATE,
  continuous_service_date DATE,
  company_service_date DATE,
  benefits_service_date DATE,
  seniority_date DATE,
  hire_date DATE,
  cost_center VARCHAR(10),
  cost_center_hierarchy VARCHAR(50),
  functional_group VARCHAR(50),
  steering_committee VARCHAR(50),
  scvp VARCHAR(50),
  management_chain_level_01 VARCHAR(50),
  management_chain_level_02 VARCHAR(50),
  management_chain_level_03 VARCHAR(50),
  management_chain_level_04 VARCHAR(50),
  management_chain_level_05 VARCHAR(50),
  management_chain_level_06 VARCHAR(50),
  worker_type VARCHAR(25),
  position_worker_type VARCHAR(50),
  job_family VARCHAR(50),
  management_level VARCHAR(25),
  is_manager BOOLEAN,
  engineering_nonengineering VARCHAR(20),
  office_or_remote VARCHAR(10),
  work_address_city VARCHAR(100),
  work_address_postal_code VARCHAR(20),
  location VARCHAR(50),
  location_country VARCHAR(50),
  manager_name VARCHAR(100),
  worker_status VARCHAR(15),
  people_partner VARCHAR(50),
  date DATE,
  reason VARCHAR(255),
  snapshot_date DATE,
  report_name VARCHAR(15)
);

CREATE TABLE IF NOT EXISTS workday_promotions_monthly LIKE workday_promotions_weekly;

GRANT SELECT on public.workday_promotions_weekly TO tableau;
GRANT SELECT on public.workday_promotions_weekly TO john_miller;
GRANT SELECT on public.workday_promotions_monthly TO tableau;
GRANT SELECT on public.workday_promotions_monthly TO john_miller;

CREATE TABLE IF NOT EXISTS workday_employees_weekly (
  employee_id VARCHAR(20),
  cost_center VARCHAR(10),
  cost_center_hierarchy VARCHAR(50),
  functional_group VARCHAR(50),
  steering_committee VARCHAR(50),
  scvp VARCHAR(50),
  management_chain_level_01 VARCHAR(50),
  management_chain_level_02 VARCHAR(50),
  management_chain_level_03 VARCHAR(50),
  management_chain_level_04 VARCHAR(50),
  management_chain_level_05 VARCHAR(50),
  management_chain_level_06 VARCHAR(50),
  worker_type VARCHAR(25),
  position_worker_type VARCHAR(50),
  job_family VARCHAR(50),
  management_level VARCHAR(25),
  is_manager BOOLEAN,
  engineering_nonengineering VARCHAR(20),
  gender VARCHAR(20),
  female BOOLEAN,
  male BOOLEAN,
  gender_decline BOOLEAN,
  gender_other BOOLEAN,
  gender_blank BOOLEAN,
  race_ethnicity VARCHAR(255),
  asian BOOLEAN,
  black_or_african_american BOOLEAN,
  hispanic_or_latino BOOLEAN,
  native_hawaiian_or_other_pacific_islander BOOLEAN,
  american_indian_or_alaska_native BOOLEAN,
  two_or_more_races BOOLEAN,
  race_is_other BOOLEAN,
  white BOOLEAN,
  race_decline BOOLEAN,
  race_blank BOOLEAN,
  original_hire_date DATE,
  continuous_service_date DATE,
  company_service_date DATE,
  benefits_service_date DATE,
  seniority_date DATE,
  hire_date DATE,
  office_or_remote VARCHAR(10),
  work_address_city VARCHAR(100),
  work_address_postal_code VARCHAR(20),
  location VARCHAR(50),
  location_country VARCHAR(50),
  manager_name VARCHAR(100),
  worker_status VARCHAR(15),
  people_partner VARCHAR(50),
  date DATE
);

CREATE TABLE IF NOT EXISTS workday_employees_monthly LIKE workday_employees_weekly;

GRANT SELECT on public.workday_employees_weekly TO tableau;
GRANT SELECT on public.workday_employees_weekly TO john_miller;
GRANT SELECT on public.workday_employees_monthly TO tableau;
GRANT SELECT on public.workday_employees_monthly TO john_miller;

CREATE OR REPLACE VIEW public.workday_dashboard_vw  as
SELECT
  employee_id,
  cost_center,
  cost_center_hierarchy,
  functional_group,
  management_chain_level_01,
  management_chain_level_02,
  management_chain_level_03,
  management_chain_level_04,
  management_chain_level_05,
  management_chain_level_06,
  job_family,
  continuous_service_date,
  management_level,
  engineering_nonengineering,
  office_or_remote,
  steering_committee,
  manager_name,
  work_address_city,
  work_address_postal_code,
  location,
  location_country,
  gender,
  female,
  male,
  gender_decline,
  gender_other,
  gender_blank,
  race_ethnicity,
  asian,
  black_or_african_american,
  hispanic_or_latino,
  native_hawaiian_or_other_pacific_islander,
  american_indian_or_alaska_native,
  two_or_more_races,
  race_is_other,
  white,
  race_decline,
  race_blank,
  '' AS termination_category,
  '' AS reason,
  date,
  'headcount' AS report_name
FROM workday_employees_monthly
UNION
SELECT
  employee_id,
  cost_center,
  cost_center_hierarchy,
  functional_group,
  management_chain_level_01,
  management_chain_level_02,
  management_chain_level_03,
  management_chain_level_04,
  management_chain_level_05,
  management_chain_level_06,
  job_family,
  continuous_service_date,
  management_level,
  engineering_nonengineering,
  office_or_remote,
  steering_committee,
  manager_name,
  work_address_city,
  work_address_postal_code,
  location,
  location_country,
  gender,
  female,
  male,
  gender_decline,
  gender_other,
  gender_blank,
  race_ethnicity,
  asian,
  black_or_african_american,
  hispanic_or_latino,
  native_hawaiian_or_other_pacific_islander,
  american_indian_or_alaska_native,
  two_or_more_races,
  race_is_other,
  white,
  race_decline,
  race_blank,
  '' AS termination_category,
  '' AS reason,
  date,
  'hires' AS report_name
FROM workday_hires_weekly
UNION
SELECT
  employee_id,
  cost_center,
  cost_center_hierarchy,
  functional_group,
  management_chain_level_01,
  management_chain_level_02,
  management_chain_level_03,
  management_chain_level_04,
  management_chain_level_05,
  management_chain_level_06,
  job_family,
  continuous_service_date,
  management_level,
  engineering_nonengineering,
  office_or_remote,
  steering_committee,
  manager_name,
  work_address_city,
  work_address_postal_code,
  location,
  location_country,
  gender,
  female,
  male,
  gender_decline,
  gender_other,
  gender_blank,
  race_ethnicity,
  asian,
  black_or_african_american,
  hispanic_or_latino,
  native_hawaiian_or_other_pacific_islander,
  american_indian_or_alaska_native,
  two_or_more_races,
  race_is_other,
  white,
  race_decline,
  race_blank,
  termination_category,
  reason,
  date,
  'terminations' AS report_name
FROM workday_terminations_weekly;

GRANT SELECT on public.workday_dashboard_vw TO tableau;
GRANT SELECT on public.workday_dashboard_vw TO john_miller;

CREATE OR REPLACE VIEW public.workday_dashboard_monthly_vw  as
SELECT
  employee_id,
  cost_center,
  cost_center_hierarchy,
  functional_group,
  management_chain_level_01,
  management_chain_level_02,
  management_chain_level_03,
  management_chain_level_04,
  management_chain_level_05,
  management_chain_level_06,
  job_family,
  continuous_service_date,
  management_level,
  engineering_nonengineering,
  office_or_remote,
  steering_committee,
  manager_name,
  work_address_city,
  work_address_postal_code,
  location,
  location_country,
  gender,
  female,
  male,
  gender_decline,
  gender_other,
  gender_blank,
  race_ethnicity,
  asian,
  black_or_african_american,
  hispanic_or_latino,
  native_hawaiian_or_other_pacific_islander,
  american_indian_or_alaska_native,
  two_or_more_races,
  race_is_other,
  white,
  race_decline,
  race_blank,
  '' AS termination_category,
  '' AS reason,
  date,
  'headcount' AS report_name
FROM workday_employees_monthly
UNION
SELECT
  employee_id,
  cost_center,
  cost_center_hierarchy,
  functional_group,
  management_chain_level_01,
  management_chain_level_02,
  management_chain_level_03,
  management_chain_level_04,
  management_chain_level_05,
  management_chain_level_06,
  job_family,
  continuous_service_date,
  management_level,
  engineering_nonengineering,
  office_or_remote,
  steering_committee,
  manager_name,
  work_address_city,
  work_address_postal_code,
  location,
  location_country,
  gender,
  female,
  male,
  gender_decline,
  gender_other,
  gender_blank,
  race_ethnicity,
  asian,
  black_or_african_american,
  hispanic_or_latino,
  native_hawaiian_or_other_pacific_islander,
  american_indian_or_alaska_native,
  two_or_more_races,
  race_is_other,
  white,
  race_decline,
  race_blank,
  '' AS termination_category,
  '' AS reason,
  date,
  'hires' AS report_name
FROM workday_hires_monthly
UNION
SELECT
  employee_id,
  cost_center,
  cost_center_hierarchy,
  functional_group,
  management_chain_level_01,
  management_chain_level_02,
  management_chain_level_03,
  management_chain_level_04,
  management_chain_level_05,
  management_chain_level_06,
  job_family,
  continuous_service_date,
  management_level,
  engineering_nonengineering,
  office_or_remote,
  steering_committee,
  manager_name,
  work_address_city,
  work_address_postal_code,
  location,
  location_country,
  gender,
  female,
  male,
  gender_decline,
  gender_other,
  gender_blank,
  race_ethnicity,
  asian,
  black_or_african_american,
  hispanic_or_latino,
  native_hawaiian_or_other_pacific_islander,
  american_indian_or_alaska_native,
  two_or_more_races,
  race_is_other,
  white,
  race_decline,
  race_blank,
  termination_category,
  reason,
  date,
  'terminations' AS report_name
FROM workday_terminations_monthly;

GRANT SELECT on public.workday_dashboard_monthly_vw TO tableau;
GRANT SELECT on public.workday_dashboard_monthly_vw TO john_miller;

CREATE OR REPLACE VIEW public.workday_dashboard_weekly_vw  as
SELECT
  employee_id,
  cost_center,
  cost_center_hierarchy,
  functional_group,
  management_chain_level_01,
  management_chain_level_02,
  management_chain_level_03,
  management_chain_level_04,
  management_chain_level_05,
  management_chain_level_06,
  job_family,
  continuous_service_date,
  management_level,
  engineering_nonengineering,
  office_or_remote,
  steering_committee,
  manager_name,
  work_address_city,
  work_address_postal_code,
  location,
  location_country,
  gender,
  female,
  male,
  gender_decline,
  gender_other,
  gender_blank,
  race_ethnicity,
  asian,
  black_or_african_american,
  hispanic_or_latino,
  native_hawaiian_or_other_pacific_islander,
  american_indian_or_alaska_native,
  two_or_more_races,
  race_is_other,
  white,
  race_decline,
  race_blank,
  '' AS termination_category,
  '' AS reason,
  date,
  'headcount' AS report_name
FROM workday_employees_weekly
UNION
SELECT
  employee_id,
  cost_center,
  cost_center_hierarchy,
  functional_group,
  management_chain_level_01,
  management_chain_level_02,
  management_chain_level_03,
  management_chain_level_04,
  management_chain_level_05,
  management_chain_level_06,
  job_family,
  continuous_service_date,
  management_level,
  engineering_nonengineering,
  office_or_remote,
  steering_committee,
  manager_name,
  work_address_city,
  work_address_postal_code,
  location,
  location_country,
  gender,
  female,
  male,
  gender_decline,
  gender_other,
  gender_blank,
  race_ethnicity,
  asian,
  black_or_african_american,
  hispanic_or_latino,
  native_hawaiian_or_other_pacific_islander,
  american_indian_or_alaska_native,
  two_or_more_races,
  race_is_other,
  white,
  race_decline,
  race_blank,
  '' AS termination_category,
  '' AS reason,
  date,
  'hires' AS report_name
FROM workday_hires_weekly
UNION
SELECT
  employee_id,
  cost_center,
  cost_center_hierarchy,
  functional_group,
  management_chain_level_01,
  management_chain_level_02,
  management_chain_level_03,
  management_chain_level_04,
  management_chain_level_05,
  management_chain_level_06,
  job_family,
  continuous_service_date,
  management_level,
  engineering_nonengineering,
  office_or_remote,
  steering_committee,
  manager_name,
  work_address_city,
  work_address_postal_code,
  location,
  location_country,
  gender,
  female,
  male,
  gender_decline,
  gender_other,
  gender_blank,
  race_ethnicity,
  asian,
  black_or_african_american,
  hispanic_or_latino,
  native_hawaiian_or_other_pacific_islander,
  american_indian_or_alaska_native,
  two_or_more_races,
  race_is_other,
  white,
  race_decline,
  race_blank,
  termination_category,
  reason,
  date,
  'terminations' AS report_name
FROM workday_terminations_weekly;

GRANT SELECT on public.workday_dashboard_weekly_vw TO tableau;
GRANT SELECT on public.workday_dashboard_weekly_vw TO john_miller;
