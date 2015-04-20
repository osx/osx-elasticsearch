name             'osx-elasticsearch'
maintainer       'Greg Levine'
maintainer_email 'levine.greg@gmail.com'
license          'MIT'
description      'Installs Elasticsearch on OS X using Hombrew.'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

recipe 'osx-elasticsearch::default', description

supports 'mac_os_x'