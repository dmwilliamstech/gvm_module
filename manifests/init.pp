class gvm{
	package {'java-1.6.0-openjdk': 
	ensure => installed 
}->

exec {'set_java_home': 
	require=>Package['java-1.6.0-openjdk'], 
	command=>"/bin/echo 'export JAVA_HOME=/usr/lib/jvm/java-1.6.0-openjdk-1.6.0.0.x86_64/jre' >> /home/vagrant/.bashrc"
}->

if ! defined(Package['curl']) 

{package 
	{'curl': 
	ensure => installed, 
	provider=>'yum'} 
}

if ! defined(Package['unzip']) 
{package 
	{'unzip': 
	ensure => installed, 
	provider=>'yum'}}

exec {'install_curl': cwd=>"/home/vagrant/", path=>['/bin/sh', '/bin/bash', '/usr/bin', '/bin', '/usr/sbin'], command=>"cat .bashrc", onlyif=>"bash -c '/usr/bin/curl -s get.gvmtool.net | bash'"}->
file{'/tmp/gvm_source.sh':
	ensure=>present,
	mode=>'0777',
	source=>'puppet:///modules/gvm_module/files/gvm_source.sh'
}->
exec {'/tmp/gvm_source.sh': 
	path=>['/bin/sh', '/bin/bash', '/usr/bin', '/bin', '/usr/sbin'],
	require=>File["/tmp/gvm_source.sh"]
}->

exec {'source_bashrc': 
	path=>['/bin/sh', '/bin/bash', '/usr/bin', '/bin', '/usr/sbin'], 
	command=>'sudo bash -c /home/vagrant/.bashrc'}
}
