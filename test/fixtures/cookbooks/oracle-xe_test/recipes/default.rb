#
# Cookbook Name:: oracle-xe_test
# Recipe:: default
#
# Copyright (C) 2014 Chef Software, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

yum_globalconfig '/etc/yum.conf' do
  cachedir node['yum']['main']['cachedir']
  keepcache node['yum']['main']['keepcache']
  debuglevel node['yum']['main']['debuglevel']
  exclude node['yum']['main']['exclude']
  gpgcheck node['yum']['main']['gpgcheck']
  logfile node['yum']['main']['logfile']
  exactarch node['yum']['main']['exactarch']
  obsoletes node['yum']['main']['obsoletes']
  proxy node['yum']['main']['proxy']
  installonly_limit node['yum']['main']['installonly_limit']
  installonlypkgs node['yum']['main']['installonlypkgs']
  installroot node['yum']['main']['installroot']
  distroverpkg node['yum']['main']['distroverpkg']
  action :create
end

swap_file '/swap' do
  size 2048
end

# Oracle configuration will fail if hostname does not resolve
unless File.readlines('/etc/hosts').grep(/#{node['hostname']}/).size > 0
  replace_or_add 'add_hostname_to_hosts' do
    path '/etc/hosts'
    pattern '127.0.0.1\s*localhost\s*.*'
    line '127.0.0.1   localhost localhost.localdomain localhost4 '\
         "localhost4.localdomain4 #{node['hostname']}"
  end
end
