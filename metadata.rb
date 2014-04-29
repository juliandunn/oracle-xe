name             'oracle-xe'
maintainer       'Chef Software, Inc.'
maintainer_email 'jdunn@getchef.com'
license          'Apache 2.0'
description      'Installs Oracle 11g Express Edition'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

%w(redhat centos scientific oracle).each do |p|
  supports p
end

suggests 'swap'
