# Install kvalobs packages

node.set['ulimit']['params']['kvalobs']['nofile'] = 8192 # open file limit for the kvalobs user

include_recipe 'ulimit2::default'    



#node['met-kvalobs']['packages'].each do |pkg, ver|
#    package pkg do
#        action :install
#        version ver
#    end
#end
