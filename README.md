# lnet

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with lnet](#setup)
    * [What lnet affects](#what-lnet-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with lnet](#beginning-with-lnet)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

This module manages the Lustre LNET service by starting the service itself and managing the `lnet.conf`.  This has been tested for Lustre 2.10.3 and Puppet 3.

## Module Description

This module helps to set up LNET routers by managing the LNET service and its associate configuration file.  A helpful guide for LNET Routers can be found here:

http://wiki.lustre.org/LNet_Router_Config_Guide

This module currently is only set up for very basic LNET routing.  This module assumes that you have Lustre installed.  Contributions are appreciated to extend this module.

## Setup

### What lnet affects

* Runs `lnet` service
* Manages `lnet.conf`

### Setup Requirements

This module assumes that you have Lustre installed.  This module does not install Lustre, it only manages the LNET service and conf once Luster is installed.

### Beginning with lnet

To use simply:

  ~~~ puppet
  include ::lnet
  ~~~

Then include your `lnet.conf` specification as per below.

## Usage

The major piece of usage for this is the has for the `lnet.conf`.  Below is a hiera example:

  lnet::net:
    tcp:
      ip: 10.0.0.1
      status: up
      interfaces: em1
    o2ib:
      ip: 10.0.1.1
      status: up
      interfaces: ib0

In this each hash entry is the type of the network you want to define.  The IP address is the IP for the router on that network.  Status is whether that network is up or not.  Interfaces is what interface this network is live on.

Once you fill this out puppet will lay down the following `lnet.conf`.

  net:
      - net type: tcp
        local NI(s):
          - nid: 10.0.0.1@tcp
            status: up
            interfaces:
                0: em1
      - net type: o2ib
        local NI(s):
          - nid: 10.0.1.1@o2ib
            status: up
            interfaces:
                0: ib0

It will then start the `lnet` service.  Please note that updates to the lnet.conf after the initial deploy may require a reboot of the router to actually implement.

## Reference

Classes:
  * lnet

Templates:
  * lnet.conf.erb

## Limitations

Tested for Lustre 2.10.3 and Puppet 3

## Development

Contributions are welcome via Pull Request.
