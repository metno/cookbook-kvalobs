 # Which version of kvalobs to deploy
default['met-kvalobs']['kvalobs']['version'] = '2.7.7-1'

# User to run kvalobs programs
default['met-kvalobs']['kvalobsuser'] = 'kvalobs'

# kvalobs-db connection info
default['met-kvalobs']['kvalobsdb'] = {
    'host'   => 'localhost',
    'port'   => 5432,
    'user'   => 'kvproc',
    'dbname' => 'kvalobs',
    'password' => 'kvproc'
}

default['met-kvalobs']['packages'] = {
    'kvalobs'                       => '2.7.7-1',
    'kvagregated'                   => '2.2.12-1'
#    'norcom2kv'                     => '2.4.5-1',
#    'kvalobs-log-mailer'            => '0.12-1',
#    'kvalobs-model-populate'        => '0.3.6',
#    'kvbufrd'                       => '2.5.14-1',
#    'kvdataclt'                     => '2.7.6-1',
#    'kvget-metadata'                => '2.8.12-1',
#    'kvqc2d'                        => '1.5.12-1',
#    'kvsynopd'                      => '2.5.0-1',
#    'kvbufrd'                       => '1.1.9-1'
}

default['met-kvalobs']['corba']['endPointPublish'] = '1.2.3.4'
default['met-kvalobs']['corba']['nameserver']['host'] = 'corbans.met.no'
default['met-kvalobs']['corba']['nameserver']['port'] = '2809'
default['met-kvalobs']['corba']['nameserver']['path'] = 'kvalobs-test'

default['met-server']['apt']['devel'] = false
