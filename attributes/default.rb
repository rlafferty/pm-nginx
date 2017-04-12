# Default nginx config attributes
default['nginx']['default_site_enabled'] = false
default['nginx']['install_method'] = 'package'
default['nginx']['conf_template'] = 'nginx.conf.erb'
default['nginx']['conf_cookbook'] = 'chef_nginx'

# Default root site directory
default['nginx']['default_root'] = '/opt/site'
