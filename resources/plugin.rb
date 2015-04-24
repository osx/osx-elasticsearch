include Chef::Mixin::ShellOut

actions :install, :uninstall
default_action :install

provides :osx_elasticsearch_plugin, os: 'mac_os_x'

attribute :name, :kind_of => String, :name_attribute => true

def exists?
  homebrew = shell_out('brew --prefix').stdout.chomp
  dir = "#{homebrew}/var/lib/elasticsearch/plugins/"
  Chef::Log.debug "Looking for #{@name} in #{dir}"

  Dir.entries(dir).any? do |plugin|
    next if plugin =~ /^\./
    @name.include? plugin
  end rescue false
end
