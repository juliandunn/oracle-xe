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

# Oracle configuration will fail if hostname does not resolve
if File.readlines('/etc/hosts').grep(/#{node['hostname']}/).empty?
  replace_or_add 'add_hostname_to_hosts' do
    path '/etc/hosts'
    pattern '127.0.0.1\s*localhost\s*.*'
    line '127.0.0.1   localhost localhost.localdomain localhost4 '\
         "localhost4.localdomain4 #{node['hostname']}"
  end
end
