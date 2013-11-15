class gvm::groovy($version = '1.8.8'){
    exec{'install-groovy':
        command=>'gvm install groovy -v $version',
        cwd=> "/home/vagrant",
        logoutput=>true,
        path=> ["/usr/bin", "/usr/sbin", "/bin", "/.gvm/bin"],
        require=> Class['gvm']
}
}
