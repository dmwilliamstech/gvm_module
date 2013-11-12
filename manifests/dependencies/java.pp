class java{

 package {'java-1.6.0-openjdk': ensure => installed 
}->
	exec {'set_java_home':
        require=>Package['java-1.6.0-openjdk'],
        command=>"/bin/echo 'export JAVA_HOME=/usr/lib/jvm/java-1.6.0-openjdk-1.6.0.0.x86_64/jre' >> /home/vagrant/.bashrc"
}->
exec {'source_bashrc':
	command=>'source /home/vagrant/.bashrc',
	refreshonly=>true	
}

}
