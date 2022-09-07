# Cookbook:: installcheckOpenedge

# The Chef InSpec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec/resources/

chef_node = input('chef_node', description: 'Chef Node')

install_path = chef_node['Type and Destination']['path']
workpath = chef_node['Type and Destination']['workpath']
oem_path = chef_node['Type and Destination']['oem_path']
oem_workpath = chef_node['Type and Destination']['oem_workpath']

describe directory(install_path) do
  it { should exist }
end

describe directory(workpath) do
  it { should exist }
end

describe directory(oem_path) do
  it { should exist }
end

describe directory(oem_workpath) do
  it { should exist }
end
