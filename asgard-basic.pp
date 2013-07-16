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
}
