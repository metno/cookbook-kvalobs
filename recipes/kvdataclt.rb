include_recipe "met-kvalobs::kvalobs-base"

kvuser = node['met-kvalobs']['kvalobsuser']

package 'kvdataclt' do
  version node['met-kvalobs']['packages']['kvdataclt']
end
