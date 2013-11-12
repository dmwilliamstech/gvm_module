class gvm::grails($version = '1.3.7'){

    exec{'install-grails':
        command=>'source /home/vagrant/.gvm/bin/gvm-init.sh && gvm install grails -v $version',
        cwd =>"/home/vagrant",
        logoutput=>true,
        path=> ["/usr/bin", "/usr/sbin", "/bin", "/home/vagrant/.gvm/bin"],
	require=> Class['gvm']
}
 }


