
class gvm::dependencies {
	if ! defined(Package['curl']) {package {'curl': ensure => installed} }
        if ! defined(Package['which'])  {package {'which': ensure => installed }}
        if ! defined(Package['unzip']) {package {'unzip': ensure => installed}}

	 package {'java-1.6.0-openjdk': ensure => installed
}->
        exec {'set_java_home':
        require=>Package['java-1.6.0-openjdk'],
        command=>"/bin/echo 'export JAVA_HOME=/usr/lib/jvm/java-1.6.0-openjdk-1.6.0.0.x86_64/jre' >> /home/vagrant/.bashrc"
}->
exec {'source_bashrc':
	provider=>'shell',
        command=>'source /home/vagrant/.bashrc',
        refreshonly=>true
}
}
