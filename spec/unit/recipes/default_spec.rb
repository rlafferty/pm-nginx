#
# Cookbook:: pm-nginx
# Spec:: default
#
# Copyright:: 2017, PhishMe, All Rights Reserved.

require 'spec_helper'

test_platforms = {
  'ubuntu' => {
    'versions' => ['14.04', '16.04']
  }
}

describe 'pm-nginx::default' do
  test_platforms.each do |platform, config|
    config['versions'].each do |version|
      context "on #{platform} #{version}" do
        let(:chef_run) do
          ChefSpec::ServerRunner.new(platform: platform,
                                     version: version) do |node|
            node.default['nginx']['default_root'] = '/opt/site'
          end.converge(described_recipe)
        end

        it 'converges successfully' do
          expect { chef_run }.to_not raise_error
        end

        it 'disables default nginx site' do
          expect(chef_run).to disable_nginx_site('default')
        end

        it 'creates the default site directory' do
          expect(chef_run).to create_directory('/opt/site')
        end

        it 'includes the chef_nginx recipe' do
          expect(chef_run).to include_recipe('chef_nginx::default')
        end
      end
    end
  end
end
