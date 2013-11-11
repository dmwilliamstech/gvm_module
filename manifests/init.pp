class gvm($version='latest', $install_gvm=true) {

  if $install_gvm {
    class {
      'gvm::dependencies': stage => 'gvm-install'
    }
  }
}
