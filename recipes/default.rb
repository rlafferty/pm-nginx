#
# Cookbook:: pm-nginx
# Recipe:: default
#
# Copyright:: 2017, PhishMe, All Rights Reserved.

directory node['nginx']['default_root'] do
  owner 'root'
  group 'root'
  mode '755'
  recursive true
  action :create
end

nginx_site 'default' do
  action :disable
end

# logrotate_app 'nginx-logs' do
#   path      "#{node['nginx']['log_dir']}/*.log"
#   frequency 'daily'
#   rotate    30
#   create    '644 root adm'
# end

include_recipe 'chef_nginx'

# nginx_site 'test-site'
