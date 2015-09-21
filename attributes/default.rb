 # Which version of kvalobs to deploy
default['met-kvalobs']['kvalobs']['version'] = '2.7.7-1'


default['met-kvalobs']['stinfosysdb'] = {
    'host'   => 'localhost',
    'port'   => 5432,
    'user'   => 'pstinfosys',
    'dbname' => 'stinfosys',
    'password' => ''
}

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


default['met-kvalobs']['corba']['nameserver']['host'] = 'localhost'
default['met-kvalobs']['corba']['nameserver']['port'] = '2809'
default['met-kvalobs']['corba']['nameserver']['path'] = 'kvalobs-test'
default['met-kvalobs']['corba']['endPointPublish'] = ''
default['met-kvalobs']['corba']['install']['nameserver'] = (node['met-kvalobs']['corba']['nameserver']['host'].eql? "localhost")?true:false

default['met-server']['apt']['devel'] = false

#
# Database setup for PostgreSQL
#
default['postgresql']['enable_pgdg_apt'] = true
default['postgresql']['version']  =                     "9.4"
# Following is required to override version config in postgresql recipe
default['postgresql']['dir'] =                          "/etc/postgresql/#{default['postgresql']['version']}/main"
default['postgresql']['client']['packages'] =           ["postgresql-client-#{default['postgresql']['version']}", "libpq-dev"]
default['postgresql']['server']['packages'] =           ["postgresql-#{default['postgresql']['version']}"]
default['postgresql']['contrib']['packages'] =          ["postgresql-contrib-#{default['postgresql']['version']}"]
default['postgresql']['config']['data_directory'] =     "/var/lib/postgresql/#{default['postgresql']['version']}/main"
default['postgresql']['config']['hba_file'] =           "/etc/postgresql/#{default['postgresql']['version']}/main/pg_hba.conf"
default['postgresql']['config']['ident_file'] =         "/etc/postgresql/#{default['postgresql']['version']}/main/pg_ident.conf"
default['postgresql']['config']['external_pid_file'] =  "/var/run/postgresql/#{default['postgresql']['version']}-main.pid"

# Performance tuning for PostgreSQL.
# See https://github.com/hw-cookbooks/postgresql/blob/develop/recipes/config_pgtune.rb:
force_default['postgresql']['config_pgtune']['db_type'] = 'oltp'
force_default['postgresql']['config']['listen_addresses'] = '0.0.0.0'

# Setup authentication
default['postgresql']['pg_hba'] = [
    {
        :comment    => "# Peer authentication for local logins",
        :type       => "local",
        :db         => "all",
        :user       => "all",
        :addr       => "",
        :method     => "peer",
    },
    {
        :comment    => "# Local logins with password, required for Chef management of database users",
        :type       => "host",
        :db         => "all",
        :user       => "postgres",
        :addr       => "127.0.0.1/8",
        :method     => "md5",
    }
]
default['ulimit']['params']['kvalobs']['nofile'] = 8192 # open file limit for the kvalobs user
