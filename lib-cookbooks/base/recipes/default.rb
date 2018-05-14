#
# Cookbook:: base
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
include_recipe 'chef-apt-docker'

package 'docker-ce'

docker_installation_package 'default' do
  version '18.03.1'
  action :create
end