actions :install, :uninstall
default_action :install

provides :osx_elasticsearch_plugin, os: 'mac_os_x'

attribute :name, :kind_of => String, :name_attribute => true

attr_accessor :name, :exists
