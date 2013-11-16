[puppet-gvm](https://github.com/dmwilliamstech/puppet-gvm)
======

Puppet module for installing gvm on centos hosts.


## Installation

``` bash
cd /etc/puppet/modules
git clone git://github.com/dmwilliamstech/puppet-gvm gvm
```

## Usage
To install gvm
```bash
class{'gvm':}
```
To install grails
```
class{'gvm::grails':}
```
To install groovy
```
class{'gvm::groovy':}
```
