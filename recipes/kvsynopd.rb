include_recipe "met-kvalobs::kvalobs-base"

kvuser = node['met-kvalobs']['kvalobsuser']

package 'kvsynopd' do
  version node['met-kvalobs']['packages']['kvsynopd']
end

directory '/var/log/kvalobs/kvsynop' do
  owner kvuser
  group kvuser
  mode '0775'
end

directory '/var/log/kvalobs/kvsynop/debug' do
  owner kvuser
  group kvuser
  mode '0775'
end

template '/etc/kvalobs/kvsynopd.conf' do
  source 'kvalobs/etc/kvalobs/kvsynopd.erb'
  owner 'root'
  group 'root'
  mode '0644'
end

directory '/var/lib/kvalobs/synopreports' do
  owner kvuser
  group kvuser
  mode '0775'
end
