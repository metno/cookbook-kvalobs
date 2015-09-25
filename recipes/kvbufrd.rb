include_recipe "met-kvalobs::kvalobs-base"

kvuser = node['met-kvalobs']['kvalobsuser']

package 'kvbufrd' do
  version node['met-kvalobs']['packages']['kvbufrd']
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

%w[ /var/lib/kvbufrd /var/lib/kvbufrd/bufr2norcom /var/lib/kvbufrd/bufr2norcom/tmp ].each do |path|
  directory path do
    owner kvuser
    group kvuser
    mode '0775'
  end
end
