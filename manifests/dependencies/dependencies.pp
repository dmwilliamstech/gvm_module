
class gvm::dependencies {
	if ! defined(Package['curl']) {package {'curl': ensure => installed, require => Class['java'] } }
	if ! defined(Package['which'])	{package {'which': ensure => installed }}
	if ! defined(Package['unzip']) {package {'unzip': ensure => installed}}

}
