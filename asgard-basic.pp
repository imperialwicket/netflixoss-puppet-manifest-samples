# Asgard (basic)
#
# At a minimum, Asgard requires a JDK, a Java servlet container (tomcat - since it is the Netflix recommendation), and the Asgard war file.
#
# Required modules:
#
# tomcat - https://github.com/camptocamp/puppet-tomcat.git
# asgard - https://github.com/imperialwicket/puppet-asgard.git
#
node default {
  # JDK
  package { 'openjdk-devel':
    ensure => installed,
  }

  # Tomcat
  include tomcat
  tomcat::instance { 'asgard':
    ensure    => present,
    http_port => '8080',
  }
}
