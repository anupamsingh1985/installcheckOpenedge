# Cookbook:: installcheckOpenedge

# The Chef InSpec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec/resources/
chef_node = input('chef_node', description: 'Chef Node')

java_path = chef_node['Java']['javapath']
install_path = chef_node['Type and Destination']['path']
workpath = chef_node['Type and Destination']['workpath']
oem_path = chef_node['Type and Destination']['oem_path']
oem_workpath = chef_node['Type and Destination']['oem_workpath']

control 'Check for installations Path' do
  impact 1.0
  title 'Install Path should exist'
  desc  'Install Path should exist'
  describe directory(install_path) do
    it { should exist }
  end
end

control 'Check for workpath' do
  impact 1.0
  title 'Workpath should exist'
  desc  'Workpath should exist'
  describe directory(workpath) do
    it { should exist }
  end
end

control 'Check for oem_path' do
  impact 1.0
  title 'oem_path should exist'
  desc  'oem_path should exist'
  describe directory(oem_path) do
    it { should exist }
  end
end

control 'Check for oem_workpath' do
  impact 1.0
  title 'oem_workpath should exist'
  desc  'oem_workpath should exist'
  describe directory(oem_workpath) do
    it { should exist }
  end
end

control 'Check if the ' + install_path + '/install/openedge_tailor.log file contains BUILD SUCCESSFUL' do
  title(install_path + '/install/openedge_tailor.log File should contain BUILD SUCCESSFUL')
  desc(install_path + '/install/openedge_tailor.log File should contain BUILD SUCCESSFUL')
  describe file(install_path + '/install/openedge_tailor.log') do
    its('content') { should match('BUILD SUCCESSFUL') }
  end
end

control 'Check if the ' + install_path + '/install/tlr/cleanup/oem_install_tlr.log file contains BUILD SUCCESSFUL' do
  title(install_path + '/install/tlr/cleanup/oem_install_tlr.log File should contain BUILD SUCCESSFUL')
  desc(install_path + '/install/tlr/cleanup/oem_install_tlr.log File should contain BUILD SUCCESSFUL')
  describe file(install_path + '/install/tlr/cleanup/oem_install_tlr.log') do
    its('content') { should match('BUILD SUCCESSFUL') }
  end
end

control 'Check if the ' + install_path + '/install/tlr/cleanup/post_cleanup_tlr.log file contains BUILD SUCCESSFUL' do
  title(install_path + '/install/tlr/cleanup/post_cleanup_tlr.log  File should contain BUILD SUCCESSFUL')
  desc(install_path + '/install/tlr/cleanup/post_cleanup_tlr.log  File should contain BUILD SUCCESSFUL')
  describe file(install_path + '/install/tlr/cleanup/post_cleanup_tlr.log') do
    its('content') { should match('BUILD SUCCESSFUL') }
  end
end

control 'Check if the ' + install_path + '/install/tlr/cleanup/pre_cleanup_tlr.log file contains BUILD SUCCESSFUL' do
  title(install_path + '/install/tlr/cleanup/pre_cleanup_tlr.log File should contain BUILD SUCCESSFUL')
  desc(install_path + '/install/tlr/cleanup/pre_cleanup_tlr.log File should contain BUILD SUCCESSFUL')
  describe file(install_path + '/install/tlr/cleanup/pre_cleanup_tlr.log') do
    its('content') { should match('BUILD SUCCESSFUL') }
  end
end

control 'Java path setup via response.ini file should match with the java.properties  on the machine' do
  title(install_path + '/properties/java.properties should contain the same path as the Java path setup via response.ini file')
  desc(install_path + '/properties/java.properties should contain the same path as the Java path setup via response.ini file')
  describe file(install_path + '/properties/java.properties') do
    its('content') { should match('JAVA_HOME=' + java_path) }
  end
end
