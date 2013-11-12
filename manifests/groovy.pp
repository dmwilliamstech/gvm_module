class gvm::groovy($version = '1.8.8'){
    exec{'install-groovy':
        command=>'source /home/vagrant/.gvm/bin/gvm-init.sh && gvm install groovy -v $version',
        cwd=> "/home/vagrant",
        logoutput=>true,
        path=> ["/usr/bin", "/usr/sbin", "/bin", "/home/vagrant/.gvm/bin"],
	require=> Class['gvm']
}
}
