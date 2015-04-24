require 'pathname'
include Chef::Mixin::ShellOut

provides :osx_elasticsearch_plugin, os: 'mac_os_x'

def whyrun_supported?
  true
end

use_inline_resources

action :install do
  if @current_resource.exists?
    Chef::Log.info "#{@new_resource} is already installed"
  else
    converge_by("install plugin: #{@new_resource}") do
      install_plugin @new_resource.name
    end
  end
end

action :uninstall do
  if @current_resource.exists?
    converge_by("uninstall plugin: #{@new_resource}") do
      uninstall_plugin @new_resource.name
    end
  else
    Chef::Log.info "#{@new_resource} could not be found"
  end
end

def load_current_resource
  @current_resource = Chef::Resource::OsxElasticsearchPlugin.new @new_resource.name
end

def install_plugin name
  execute "install plugin: #{name}" do
    command "plugin --install #{name}"
    cwd "#{bin_dir}"
  end
end

def uninstall_plugin name
  execute "uninstall plugin: #{name}" do
    command "plugin --remove #{name}"
    cwd "#{bin_dir}"
  end
end

def bin_dir
  homedir = shell_out('brew --prefix elasticsearch').stdout.chomp
  Pathname.new(homedir).realpath.join('bin')
end
