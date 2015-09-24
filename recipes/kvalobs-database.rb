# Install kvalobs database

package 'postgresql'
package 'kvalobs-database-files'

kvuser = node['met-kvalobs']['kvalobsuser']

user kvuser do
  username kvuser
  home "/metno/#{kvuser}"
  system true
end

directory '/metno/' do
  owner 'root'
  group 'root'
  mode '0755'
end

directory "/metno/#{kvuser}" do
  owner kvuser
  group kvuser
  mode '0755'
end

execute 'create kvalobs user' do
  command "sudo -upostgres createuser --superuser #{kvuser}"
  not_if "sudo -upostgres psql template1 --set=ON_ERROR_STOP=true -lqtc 'select count(*) FROM pg_roles WHERE rolname=$$#{kvuser}$$' | grep 1"
end

psql = "sudo -u#{kvuser} psql --set=ON_ERROR_STOP=true"

execute 'create kvalobs database' do
  command "sudo -u#{kvuser} createdb kvalobs"
  ignore_failure true # Will fail later if real error
end

execute 'setup kvalobs database users' do
  command "#{psql} -f/usr/share/kvalobs/db/kvalobs_roles.sql"
  not_if "#{psql} -lqtc \"select count(*) FROM pg_roles WHERE rolname='kvproc'\" | grep 1"
end

execute 'setup kvalobs database' do
  command "#{psql} -f/usr/share/kvalobs/db/kvalobs_schema.sql"
  not_if "#{psql} -c 'SELECT * FROM param LIMIT 1'"
end


package 'kvget-metadata' do
  version node['met-kvalobs']['packages']['kvget-metadata']
end

directory '/usr/share/kvalobs/metaget' do
  owner 'kvalobs'
  group 'kvalobs'
  mode '0755'
end

execute 'populate database with metadata' do
  command 'sudo -ukvalobs kvget-metadata'
  not_if "sudo -ukvalobs psql -c \"select name from param where name='RR_12'\" | grep -q RR_12"
end
