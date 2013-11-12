class gvm($grails-version='1.3.7', $groovy-version='1.8.8',  $install_gvm=true, $install_grails=false, $install_groovy=false) {
	stage{'gvm-install':}
  if $install_gvm {
    class {
      'gvm::dependencies': stage => 'gvm-install'
    }
  }
  if $install_grails{
    exec{'install-grails':
	command=>'source /home/vagrant/.gvm/bin/gvm-init.sh && gvm install grails -v $grails-version',
	cwd =>"/home/vagrant",
	logoutput=>true,
	path=> ["/usr/bin", "/usr/sbin", "/bin", "/home/vagrant/.gvm/bin"]
}
 }
  if $install_groovy{
    exec{'install-groovy':
	command=>'source /home/vagrant/.gvm/bin/gvm-init.sh && gvm install groovy -v $groovy-version',
	cwd=> "/home/vagrant",
	logoutput=>true,
	path=> ["/usr/bin", "/usr/sbin", "/bin", "/home/vagrant/.gvm/bin"]
}
}
}
