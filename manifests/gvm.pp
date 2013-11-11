# install gvm
class gvm {

        exec { "install-gvm":
                command => "sudo su - vagrant -c 'curl -s get.gvmtool.net | bash'",
                cwd => "/var/tmp",
                user => "vagrant",
                logoutput => true,
                path => ["/usr/bin", "/usr/sbin", "/bin"],
                require => Package['curl']
        }
