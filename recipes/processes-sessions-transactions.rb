#
# Cookbook Name:: oracle-xe
# Recipe:: processes-sessions-transactions
# Author:: Christoph Jahn (<github@jahntech.com>)
#
# Copyright (C) 2016 Christoph Jahn
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


procs_sess_tx_sql = File.join(Chef::Config[:file_cache_path], 'set-processes-sessions-transactions.sql')

template procs_sess_tx_sql do
  action :create
  notifies :run, 'execute[set-processes-sessions-transactions]', :immediately
end

execute 'set-processes-sessions-transactions' do
  command "source /u01/app/oracle/product/11.2.0/xe/bin/oracle_env.sh && sqlplus / as sysdba @#{procs_sess_tx_sql}"
  user 'oracle'
  group 'dba' # required
  action :nothing
end
