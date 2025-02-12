
#aqui le decimos a packer que use vagrant para generar el box
source "vagrant" "aisi" {
  communicator = "ssh"
  source_path  = "ubuntu/jammy64"
  box_version  = "20241002.0.0"
  provider     = "virtualbox"
  add_force    = true
  skip_add     = false
  template     = "provisioning/Vagrantfile.template"
}



#bloque build define provisioners y origenes
build {
  sources = ["source.vagrant.aisi"]

  provisioner "shell" {
    script  = "provisioning/install-docker-ubuntu.sh"
    timeout = "3600s"
  }
}
