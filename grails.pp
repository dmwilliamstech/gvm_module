include gvm

class gvm::grails($version=undef){


    exec{'install-grails':
        command=>'gvm install grails -v $version',
        cwd =>"/home/vagrant",
        logoutput=>true,
        path=> ["/usr/bin", "/usr/sbin", "/bin", "/home/vagrant/.gvm/bin", '/bin/bash', '/bin/sh', ],
        require=> Class['gvm']
}
 }
