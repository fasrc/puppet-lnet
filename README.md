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

This module manages the Lustre LNET service by starting the service itself.  This has been tested for Lustre 2.10.7 and Puppet 3.

## Module Description

This module helps to set up LNET routers by managing the LNET service and its associate configuration file.  A helpful guide for LNET Routers can be found here:

http://wiki.lustre.org/LNet_Router_Config_Guide

This module currently is only set up for very basic LNET routing.  This module assumes that you have Lustre installed.  Contributions are appreciated to extend this module.

## Setup

### What lnet affects

* Runs `lnet` service

### Setup Requirements

This module assumes that you have Lustre installed.  This module does not install Lustre, it only manages the LNET service once Lustre is installed.

### Beginning with lnet

To use simply:

  ~~~ puppet
  include ::lnet
  ~~~

Then include your `lnet.conf` specification on the node you have installed on.

## Reference

Classes:
  * lnet

## Limitations

Tested for Lustre 2.10.7 and Puppet 3

## Development

Contributions are welcome via Pull Request.
