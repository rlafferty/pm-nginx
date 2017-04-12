# # encoding: utf-8

# Inspec test for recipe pm-nginx::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe port(80) do
  it { should_not be_listening }
end

describe service('nginx') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end

describe file('/opt/site') do
  it { should exist }
  it { should be_directory }
  it { should be_owned_by 'root' }
end
