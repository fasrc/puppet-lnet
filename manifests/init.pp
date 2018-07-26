# == Class: lnet
#
# Full description of class lnet here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'lnet':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2018 Your name here, unless otherwise noted.
#
class lnet {

  file { '/etc/lnet.conf':
    content => template('lnet/lnet.conf.erb'),
    owner   => 'root',
    group   => 'root',
    backup  => 'false',
  }

  service { 'lnet':
    name      => 'lnet',
    ensure    => running,
    enable    => true,
    subscribe => File['/etc/lnet.conf'],
    require   => File['/etc/lnet.conf'],
  }

}
