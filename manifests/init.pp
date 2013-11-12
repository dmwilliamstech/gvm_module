class gvm($version='latest', $install_gvm=true) {
	stage{'gvm-install':}
  if $install_gvm {
    class {
      'gvm::dependencies': stage => 'gvm-install'
    }
  }
}
