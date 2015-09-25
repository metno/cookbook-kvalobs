# Install kvalobs packages

kvuser = node['met-kvalobs']['kvalobsuser']

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

directory '/var/log/kvalobs' do
  owner kvuser
  group kvuser
  mode '0775'
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

template '/etc/kvalobs/kvalobs.conf' do
  source 'kvalobs/etc/kvalobs/kvalobs.erb'
  owner 'root'
  group 'root'
  mode '0644'
end

template '/etc/kvalobs/norcom2kv.conf' do
  source 'kvalobs/etc/kvalobs/norcom2kv.erb'
  owner 'root'
  group 'root'
  mode '0644'
end

template '/etc/kvalobs/kvbufrd.conf' do
  source 'kvalobs/etc/kvalobs/kvbufrd.erb'
  owner 'root'
  group 'root'
  mode '0644'
end

template '/etc/kvalobs/kvbufrconf.conf' do
  source 'kvalobs/etc/kvalobs/kvbufrconf.erb'
  owner 'root'
  group 'root'
  mode '0644'
end

['kvsynop_kvbufr_common.conf','kvbufrd_precip.conf','kvbufrd_ship.conf','kvbufrd_sochi.conf','kvbufrd_bstations.conf'].each do |file|
  template "/etc/kvalobs/#{file}" do
     source 'kvalobs/etc/kvalobs/kvbufrd.include.erb'
     owner 'root'
     group 'root'
     mode '0644'
     not_if { File.exist?("/etc/kvalobs/#{file}" )}
  end
end


template '/etc/kvalobs/kvsynopd.conf' do
  source 'kvalobs/etc/kvalobs/kvsynopd.erb'
  owner 'root'
  group 'root'
  mode '0644'
end

directory '/var/lib/kvalobs/' do
  owner 'root'
  group 'root'
  mode '0755'
end

directory '/var/lib/kvalobs/synopreports' do
  owner kvuser
  group kvuser
  mode '0775'
end

directory '/var/lib/kvbufrd' do
  owner kvuser
  group kvuser
  mode '0775'
end

directory '/var/lib/kvbufrd/bufr2norcom' do
  owner kvuser
  group kvuser
  mode '0775'
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

directory '/var/lib/kvbufrd' do
  owner kvuser
  group kvuser
  mode '0775'
end

directory '/var/lib/kvbufrd/bufr2norcom' do
  owner kvuser
  group kvuser
  mode '0775'
end

directory '/var/lib/kvbufrd/bufr2norcom/tmp' do
  owner kvuser
  group kvuser
  mode '0775'
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
