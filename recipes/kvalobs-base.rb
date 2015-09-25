kvuser = node['met-kvalobs']['kvalobsuser']

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

directory '/var/lib/kvalobs/' do
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
