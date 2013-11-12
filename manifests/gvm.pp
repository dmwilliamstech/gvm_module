# install gvm
class gvm::gvm {

        exec { "install-gvm":
                command => "sudo curl -s get.gvmtool.net | bash",
                cwd => "/home/vagrant",
                logoutput => true,
                path => ["/usr/bin", "/usr/sbin", "/bin"],
                require => Package['curl']
        }->

exec {'source_gvm_init':
        provider=>'shell',
        cwd=>'/home/vagrant/.gvm/bin',
        refreshonly=>true,
        command => 'source gvm-init.sh',
}
}
