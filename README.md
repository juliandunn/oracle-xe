Description
===========

This cookbook is used to configure a system with Oracle Express Edition 11g.

Requirements
============

You must download the RPM in advance from Oracle yourself and accept the EULA. The RPM must be placed on a server that can serve it up over HTTP, and you must set the attribute `node['oracle-xe']['url']` with that URL.

## Platforms

Oracle Express Edition 11g is only supported on:

* Red Hat Enterprise Linux 5
* Red Hat Enterprise Linux 6

and variants (Oracle Enterprise Linux, CentOS, Scientific)

# Usage

Include the default recipe in your run list after setting the URL attribute.

# Attributes

* `node['oracle-xe']['url']` - The URL where you've placed the Oracle 11g Express Edition RPM.
* `node['oracle-xe']['http-port']` - The port where you want the HTTP interface to be listening.
* `node['oracle-xe']['tnslsnr-port']` - The port where you want the TNS listener to be listening.
* `node['oracle-xe']['oracle-password']`  - The password for the SYS and SYSTEM accounts.
* `node['oracle-xe']['start-lsnr-on-boot']`  - Whether to start the TNS listener on bootup (true | false).
* `node['oracle-xe']['password-lifetime-default']`  - Password lifetime for users created with the default profile (int | "UNLIMITED"; default 180)
* `node['oracle-xe']['processes']` - Number of processes to use (default: 100)
* `node['oracle-xe']['session']` - Number of session to use (default: 172)
* `node['oracle-xe']['transactions']` - Number of transactions to use (default: 189)

# Recipes

* `default` - The default recipe installs Oracle 11g Express Edition.
* `password-lifetime-default` - Changes the lifetime of passwords for accounts created with the default profile
* `processes-sessions-transactions` - Changes the max. number of processes, sessions, and transactions to allow a higher number of concurrent connections


Roadmap and Bugs
================

* Figure out why the response file doesn't actually seem to set SYS and SYSTEM passwords properly.
* Check Ohai data before doing anything to ensure the system has sufficient resources (cores, swap, memory) before running the RPM and having Oracle's installer fail.

License and Author
==================

- Author:: Julian C. Dunn (<jdunn@opscode.com>)
- Copyright:: 2013, Opscode, Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
