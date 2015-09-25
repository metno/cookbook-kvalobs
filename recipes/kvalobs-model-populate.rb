include_recipe "met-kvalobs::kvalobs-base"

kvuser = node['met-kvalobs']['kvalobsuser']

package 'kvalobs-model-populate' do
  version node['met-kvalobs']['packages']['kvalobs-model-populate']
end
