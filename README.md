[puppet-gvm](https://github.com/dmwilliamstech/puppet-gvm)
======

Puppet module for installing gvm on centos hosts.


## Installation

``` bash
cd /etc/puppet/modules
git clone git://github.com/dmwilliamstech/puppet-gvm gvm
```

## Usage
include gvm
(if you want groovy or grails installed include)
gvm::grails
gvm::groovy
