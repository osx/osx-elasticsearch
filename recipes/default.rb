#
# Cookbook Name:: osx-elasticsearch
# Recipe:: default
#
include_recipe 'osx-java'

package 'elasticsearch'

include_recipe 'osx-elasticsearch::plugins'

link "#{ENV['HOME']}/Library/LaunchAgents/homebrew.mxcl.elasticsearch.plist" do
  to '/usr/local/opt/elasticsearch/homebrew.mxcl.elasticsearch.plist'
end

service 'homebrew.mxcl.elasticsearch' do
  action :enable
end
