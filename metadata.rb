name             'oracle-xe'
maintainer       'Chef Software, Inc.'
maintainer_email 'jdunn@chef.io'
license          'Apache-2.0'
description      'Installs Oracle 11g Express Edition'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'
issues_url       'https://github.com/juliandunn/oracle-xe/issues'
source_url       'https://github.com/juliandunn/oracle-xe'
chef_version     '>= 12.14'

%w(redhat centos scientific oracle).each do |p|
  supports p
end
