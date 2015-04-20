#
# Cookbook Name:: osx-elasticsearch
# Recipe:: default
#
package 'elasticsearch'

include_recipe 'osx-elasticsearch::plugins'
