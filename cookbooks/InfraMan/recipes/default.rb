#
# Cookbook:: InfraMan
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
apt_update 'daily' do
  frequency 86_400
  action :periodic
end

include_recipe 'java'
include_recipe 'chef-apt-docker'

package 'Install docker' do
	package_name 'docker-ce'
end

group 'docker' do
	members 'ubuntu'
end

package 'Install Maven' do
	package_name 'maven'
end
