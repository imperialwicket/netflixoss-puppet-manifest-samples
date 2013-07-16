# Asgard (basic)
#
# At a minimum, Asgard requires a JDK, a Java servlet container (tomcat - since it is the Netflix recommendation), and the Asgard war file.
#
# Required modules:
#
# asgard - https://github.com/imperialwicket/puppet-asgard.git
#
node default {
  # JDK
  package { 'openjdk-7-jdk':
    ensure => installed,
  }

  # Tomcat
  package { 'tomcat7':
    ensure  => installed,
    require => Package['openjdk-7-jdk']
  }
  file { '/usr/share/tomcat7':
    owner   => 'tomcat7',
    group   => 'tomcat7',
    require => Package['tomcat7'],
  }
  # Big hack, probably breaks RHEL...
  file { '/usr/share/tomcat7/bin/setenv.sh':
    ensure  => link,
    target  => '/var/lib/tomcat7/bin/setenv.sh',
    require => Package['tomcat7'],
  }

  # Asgard
  class { 'asgard':
    version    => '1.2',
    tomcat_dir => '/var/lib/tomcat7',
  }

  File['/usr/share/tomcat7'] -> Class['asgard']
}
