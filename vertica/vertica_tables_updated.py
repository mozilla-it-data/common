#!/usr/bin/env python

import argparse
import os
import subprocess
import sys
from datetime import datetime, timedelta

STATUS = {'OK': 0,
          'WARNING': 1,
          'CRITICAL': 2,
          'UNKNOWN': 3}

LAST_UPDATED_QUERY = "SELECT name, MAX(trunc(updated_at, 'SS')) FROM last_updated WHERE name = '{table_name}' GROUP BY name"
CURRENT_TIME_QUERY = "SELECT trunc(now(), 'SS') FROM dual"

# Time units
_units = dict(d=60 * 60 * 24, h=60 * 60, m=60, s=1)


def check(tables, username, password, database, host, port, allowed_lag):
    if not os.path.exists("/opt/vertica/bin/vsql"):
        print("WARNING:  Unable to run check, vsql not found at path /opt/vertica/bin/vsql")
        return STATUS['WARNING']

    credentials = {
        "username": username,
        "password": password,
        "database": database,
        "host": host,
        "port": port,
    }

    vsql = build_vsql_call(credentials, CURRENT_TIME_QUERY)
    returncode, result = call_subprocess(vsql)

    if returncode > 0:
        print(result)
        print("CRITICAL:  Failed to execute current time query, possible connection problem to Vertica")
        return (STATUS['CRITICAL'])

    current_time = parse_timestamp(result)

    # Status only changes if it becomes critical
    ret_status = STATUS['OK']
    for table in tables:
        status = check_table(allowed_lag, credentials, current_time, table)
        if status is STATUS['CRITICAL']:
            ret_status = STATUS['CRITICAL']

    return ret_status


def check_table(allowed_lag, credentials, current_time, table):
    try:
        query = LAST_UPDATED_QUERY.format(table_name=table)
        vsql = build_vsql_call(credentials, query)
        returncode, result = call_subprocess(vsql)

        if returncode > 0:
            print(result)
            print("CRITICAL:  Failed to execute last_updated query for table %s" % table)
            return STATUS['CRITICAL']

        # Split on pipe, second field is timestamp
        parts = result.split("|")
        last_updated = parse_timestamp(parts[1])

        lag = current_time - last_updated

        if lag > allowed_lag:
            print("CRITICAL: %s has not been updated in %s" % (table, lag))
            return STATUS['CRITICAL']

        print("OK: Table %s was updated within the SLA" % table)
        return STATUS['OK']
    except:
        print("CRITICAL:  Error while processing check for %s" % table)
        return STATUS['CRITICAL']


def build_vsql_call(credentials, query):
    """
    Build the VSQL command
    :param credentials: Credentials for accessing the database
    :param query: Query to execute
    """

    return '/opt/vertica/bin/vsql -t -A  -h {host} -U {username} -w {password} -p {port} -c "{query}" {database}'.format(
        query=query,
        **credentials
    )


def parse_timestamp(time_str):
    return datetime.strptime(time_str, "%Y-%m-%d %H:%M:%S")


def call_subprocess(vsql):
    """
    Execute the VSQL call and read the result from stdout.  Strongly assumes that we get one row back!
    """
    p = subprocess.Popen(vsql, shell=True, stdout=subprocess.PIPE)
    result = p.stdout.read()
    # Wait for completion
    p.wait()

    return p.returncode, result.rstrip()


def mkdelta(deltavalue):
    seconds = 0
    defaultunit = unit = _units['d']  # default to days
    value = ''
    for ch in list(str(deltavalue).strip()):
        if ch.isdigit():
            value += ch
            continue
        if ch in _units:
            unit = _units[ch]
            if value:
                seconds += unit * int(value)
                value = ''
                unit = defaultunit
            continue
        if ch in ' \t':
            # skip whitespace
            continue
        raise ValueError('Invalid time delta: %s' % deltavalue)
    if value:
        seconds = unit * int(value)
    return timedelta(seconds=seconds)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description="Nagios check for ensuring that vertica tables have been loaded")
    parser.add_argument("-u", "--username", dest="username", help="Vertica username", default="<%= scope.function_hiera('secrets_nagiosdaemon_vertica_username') %>")
    parser.add_argument("-p", "--password", dest="password", help="Vertica password", default="<%= scope.function_hiera('secrets_nagiosdaemon_vertica_password') %>")
    parser.add_argument("-H", "--host", dest="host", help="Vertica host", default='localhost')
    parser.add_argument("-d", "--database", dest="database", default="metrics", help="Vertica database")
    parser.add_argument("-P", "--port", dest="port", default=5433, help="Vertica port")
    parser.add_argument("-l", "--allowed-lag", dest="allowed_lag", default=timedelta(hours=25), type=mkdelta)
    args = parser.parse_args()

    with open('/etc/vertica/watched_tables', 'r') as f:
        tables = f.readlines()
        tables = [t.rstrip() for t in tables]


    status = check(tables=tables, **vars(args))
    sys.exit(status)
