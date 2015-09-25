# Install kvalobs packages

include_recipe "met-kvalobs::kvalobs-base"

kvuser = node['met-kvalobs']['kvalobsuser']

package 'kvalobs' do
  version node['met-kvalobs']['packages']['kvalobs']
end

template '/etc/kvalobs/kv_ctl.conf' do
  source 'kvalobs/etc/kvalobs/kv_ctl.erb'
  owner 'root'
  group 'root'
  mode '0644'
end

execute 'kvstart' do
  command "sudo -u#{kvuser} /usr/bin/kvstart"
end
