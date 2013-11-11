class gvm::dependencies {
    default: {
      if ! defined(Package['curl'])    { package { 'curl':      ensure => installed , require=>Class['java'] } }
    }

  if ! defined(Package['which'])           { package { 'which':           ensure => installed } }
  if ! defined(Package['wget'])            { package { 'wget':            ensure => installed } }
  if ! defined(Package['git'])             { package { 'git':             ensure => installed } }
  if ! defined(Package['unzip'])           { package { 'unzip':             ensure => installed } 
}
