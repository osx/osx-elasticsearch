#
# Cookbook Name:: osx-elasticsearch
# Recipe:: plugins
#
::Chef::Resource::Execute.send(:include, OSX::Elasticsearch::Helper)

node['osx-elasticsearch']['plugins'].each do |name, enable|
  execute "install plugin: #{name}" do
    command "bin/plugin --install #{name}"
    cwd where_is_elasticsearch
    only_if { enable }
    not_if do
      #TODO: /usr/local could be $(brew --prefix)
      Dir.entries('/usr/local/var/lib/elasticsearch/plugins/').any? do |plugin|
        next if plugin =~ /^\./
        name.include? plugin
      end rescue false
    end
  end
end
