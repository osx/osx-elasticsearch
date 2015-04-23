#
# Cookbook Name:: osx-elasticsearch
# Recipe:: plugins
#
node['osx-elasticsearch']['plugins'].each do |name, enable|
  osx_elasticsearch_plugin name do
    only_if { enable }
  end
end
