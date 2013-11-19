class gvm($version=undef, $install_grails=true, $install_groovy=true, $user ='vagrant', $user_home='/home/$user')

{
	package {'java-1.6.0-openjdk': 
	ensure => installed 
}->
exec {'set_java_home': 
	require=>Package['java-1.6.0-openjdk'], 
	command=>"/bin/echo 'export JAVA_HOME=/usr/lib/jvm/java-1.6.0-openjdk-1.6.0.0.x86_64/jre' >> /home/$user/.bashrc",
}->
package{'curl':
        ensure => installed,
        provider=>'yum'
}->

package{'unzip':
	ensure => installed,
        provider=>'yum'
}->
exec {'install_curl': 
	user => $user,
	cwd => '/home/vagrant',
	provider=>'shell',
	path=>['/bin/bash', '/usr/bin', '/bin/sh', '/usr/bin', '/bin', '/usr/sbin'], 
        command=>"sudo su vagrant -c 'curl get.gvmtool.net | bash'",
	logoutput=>true
}->
exec {'source_gvm_init':
	cwd=>'/home/vagrant',
	path=>['/bin/sh', '/bin/bash', '/usr/bin', '/bin', '/usr/sbin'],
	command=>"sudo su vagrant -c 'bash .gvm/bin/gvm-init.sh'",
	logoutput=>true
}->
exec {'source_bashrc': 
	cwd=>'/home/vagrant',
	path=>['/bin/sh', '/bin/bash', '/usr/bin', '/bin', '/usr/sbin'], 
	command=>"sudo su vagrant -c 'sh .bashrc'",
	logoutput=>true
}
}
if $install_grails{
	class{
		'gvm::grails': stage => 'grails-install', version => $version;
	}
}
if $install_groovy{
	class{
	'gvm::groovy' : stage => 'groovy-install', version => $version;
	}
}
