# pm-nginx Cookbook

The pm-nginx Cookbook is a wrapper cookbook for the chef_nginx library cookbook that provides the ability to set default across all nginx deployments in the organization.  By wrapping the chef_nginx cookbook, the resources within that cookbook are inherently provided and additional tests can be crafted to ensure consistency and maintainability.

## Requirements

- Chef 12.5 or higher
- Network accessible package repositories

## Platform Support

The following platforms have been tested with Test Kitchen:

```
|----------------+-----+-----+-----+
|                | 0.1 | 1.0 | 1.1 |
|----------------+-----+-----+-----+
| ubuntu-14.04   | X   | X   | X   |
|----------------+-----+-----+-----+
| ubuntu-16.04   | X   | X   | X   |
|----------------+-----+-----+-----+
```

## Cookbook Dependencies

-[chef_nginx](https://supermarket.chef.io/cookbooks/chef_nginx)

## Usage

Place a dependency on the pm-nginx cookbook in your cookbook's metadata.rb (and Berksfile if leveraging berks)

```ruby
depends 'pm-nginx', '~> 1.0.0', git: 'https://github.com/rlafferty/pm-nginx.git'
```

Then, in a recipe:

```ruby
include_recipe 'pm-nginx'
```

## Attributes

- `['nginx']['default_site_enabled']` - to enable or disable the default nginx site (default: false).
- `['nginx']['install_method']` - install method, either from source or package (default: package).
- `['nginx']['conf_template']` - the template name to be used for nginx.conf configuration file (default: nginx.conf.erb).
- `['nginx']['conf_cookbook']` - the name of the cookbook in which the conf_template is located (default: chef_nginx).

## Resources Overview

### nginx_site

Enable or disable a Server Block in `#{node['nginx']['dir']}/sites-available` by calling nxensite or nxdissite (introduced by this cookbook) to manage the symbolic link in `#{node['nginx']['dir']}/sites-enabled`.

### Actions

- `enable` - Enable the nginx site (default)
- `disable` - Disable the nginx site

### Properties:

- `name` - (optional) Name of the site to enable. By default it's assumed that the name of the nginx_site resource is the site name, but this allows overriding that.
- `template` - (optional) Path to the source for the `template` resource.
- `cookbook` - (optional) The cookbook that contains the template source.
- `variables` - (optional) Variables to be used with the `template` resource

## Frequently Asked Questions


## License

```text
Copyright:: 2009-2017 Chef Software, Inc

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
