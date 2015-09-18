include_recipe "firewall"

package 'omniorb'

template '/etc/omniORB.cfg' do
  source 'corba/etc/omniORB.erb'
  owner 'root'
  group 'root'
  mode '0664'
end

firewall_rule 'allow all trafic coming from met.no' do
  source    '157.249.0.0/16' 
  protocol :tcp
  action  :allow
end
