class gvm::grails($version = '1.3.7'){

    exec{'install-grails':
        command=>'gvm install grails -v $version',
        cwd =>"/home/vagrant",
        logoutput=>true,
        path=> ["/usr/bin", "/usr/sbin", "/bin", "/.gvm/bin"],
        require=> Class['gvm']
}
 }
