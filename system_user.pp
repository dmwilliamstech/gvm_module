class gvm::user () {

  $user ='gvm' 

  if ! defined(User[$user]) {
    user { $user:
	name=>$user
	ensure => present;
      
    }
  }

 exec { "/usr/sbin/usermod -a -G $user":
    unless => "/bin/cat /etc/group |  grep $user",
    require => [User[$user]];
  }
}
