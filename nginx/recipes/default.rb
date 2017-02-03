#
# Cookbook Name:: nginx
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'nginx'

package 'nginx' do
  action :install
end

template '/etc/nginx/conf.d/webapp.conf' do 
  source 'webapp.erb' 
  mode 777 
  owner 'vagrant' 
  group 'vagrant' 
  variables( :listening_port => node['listening_port'], :webapp_port => node['webapp-port'], :hosts => node['hosts'], :privateip => node['private-ip'] || node['ipaddress'] ) 
end 


service 'nginx' do
  supports status: true, restart: true, reload: true
  action :enable
end

