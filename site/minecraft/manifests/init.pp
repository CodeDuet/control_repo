class minecraft (
  $url = 'https://launcher.mojang.com/v1/objects/3737db93722a9e39eeada7c27e7aca28b144ffa7/server.jar',
  $install_dir = "/opt/minecraft"
  ) {
    
    file {"${install_dir}":
        ensure => directory,
    }
    file {"${install_dir}/minecraft_server.jar":
        ensure => file,
        source => $url,
    }
}
