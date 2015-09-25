include_recipe "met-kvalobs::kvalobs-base"

kvuser = node['met-kvalobs']['kvalobsuser']

package 'norcom2kv' do
  version node['met-kvalobs']['packages']['norcom2kv']
end

template '/etc/kvalobs/norcom2kv.conf' do
  source 'kvalobs/etc/kvalobs/norcom2kv.erb'
  owner 'root'
  group 'root'
  mode '0644'
end

directory '/var/lib/norcom2kv' do
  owner kvuser
  group kvuser
  mode '0775'
end

directory '/var/lib/norcom2kv/tmp' do
  owner kvuser
  group kvuser
  mode '0775'
end
