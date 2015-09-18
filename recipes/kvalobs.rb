# Install kvalobs packages

node.set['ulimit']['params']['kvalobs']['nofile'] = 8192 # open file limit for the kvalobs user

include_recipe 'ulimit2::default'    

node['met-kvalobs']['packages'].each do |pkg, ver|
    package pkg do
        action :install
        version ver
    end
end

directory '/etc/kvalobs' do
  owner 'root'
  group 'root'
  mode '0755'
end

template '/etc/kvalobs/kvalobs.conf' do
  source 'kvalobs/etc/kvalobs/kvalobs.erb'
  owner 'root'
  group 'root'
  mode '0644'
end

template '/etc/kvalobs/kv_ctl.conf' do
  source 'kvalobs/etc/kvalobs/kv_ctl.erb'
  owner 'root'
  group 'root'
  mode '0644'
end

execute 'kvstart' do
  command 'sudo -ukvalobs /usr/bin/kvstart'
end
