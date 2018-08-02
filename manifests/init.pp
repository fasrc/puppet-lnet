# == Class: lnet
#
# This class manage lnet.
#
# === Parameters
#
# lnet::net
#   Is a hash of values that will be used by the lnet.conf.erb template to
#   construct the lnet.conf.  Here is a hiera example:
#
#  lnet::net:
#    tcp:
#      ip: 10.0.0.1
#      status: up
#      interfaces: em1
#    o2ib:
#      ip: 10.0.1.1
#      status: up
#      interfaces: ib0
#
# === Authors
#
# Paul Edmon <pedmon@cfa.harvard.edu>
#
# === Copyright
#
# Copyright 2018 Paul Edmon.
#
class lnet (
  $net    = $lnet::net,
) {

  validate_hash($net)

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
