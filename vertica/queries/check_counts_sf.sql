SELECT count(*), 'sf_donations' as table
FROM sf_donations
UNION
SELECT count(*), 'sf_donation_count' as table
FROM sf_donation_count
UNION
SELECT count(*), 'sf_copyright_petition' as table
FROM sf_copyright_petition
UNION
SELECT count(*), 'sf_foundation_signups' as table
FROM sf_foundation_signups;
