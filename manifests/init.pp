# == Class: lnet
#
# This class manage lnet.
#
# === Parameters
#
# === Authors
#
# Paul Edmon <pedmon@cfa.harvard.edu>
#
# === Copyright
#
# Copyright 2018 Paul Edmon.
#
class lnet {

  service { 'lnet':
    name      => 'lnet',
    ensure    => running,
    enable    => true,
  }

}
