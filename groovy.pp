include gvm

class gvm::groovy($version=undef){
    exec{'install-groovy':
        command=>'gvm install groovy -v $version',
        cwd=> "/home/vagrant",
        logoutput=>true,
        path=> ["/usr/bin", "/usr/sbin", "/bin", "/home/vagrant/.gvm/bin"],
        require=> Class['gvm']
}
}
