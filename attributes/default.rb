# Which version of kvalobs to deploy
default['kvalobs']['version'] = '2.7.7-1'

# kvalobs-db connection info
default['kvalobsdb']['host'] = 'localhost'
default['kvalobsdb']['port'] = 5432
default['kvalobsdb']['user'] = 'kvproc'
default['kvalobsdb']['dbname'] = 'kvalobs'

# CORBA do not work well with firewalls so we disable it
default['met-server']['firewall']['enabled'] = false
