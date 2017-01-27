#
# Cookbook:: HelloWorldNodeJS
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
package 'nodejs' do
  action :install
end

template '/home/vagrant/hello.js' do
  source 'hello.erb'
  mode 777
  owner 'vagrant'
  group 'vagrant'
  variables( :port => node['HelloWorldNodeJS']['port'], :ip => node['private-ip'] || node['ipaddress'] )
end


service 'helloworldApp' do
  action :restart
  status_command 'ps -ef | grep hello.js| grep -v grep'
  start_command '/usr/bin/nodejs /home/vagrant/hello.js &' 
  stop_command "kill -9 `ps -ef | grep hello.js | grep -v grep | awk '{print $2}' `"
  restart_command "kill -9 `ps -ef | grep hello.js | grep -v grep | awk '{print $2}'` ; /usr/bin/nodejs /home/vagrant/hello.js &"
end

