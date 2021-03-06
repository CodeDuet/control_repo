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
        before => Service['minecraft'],
    }
    file {"${install_dir}/eula.txt":
    ensure => present,
    replace => 'yes',
    content => "eula=true",
    }
    file {'/etc/systemd/system/minecraft.service':
       ensure => file,
       source => 'puppet:///modules/minecraft/minecraft.service',
       #content => epp('minecraft/minecraft.service',{
       #install_dir => "${install_dir}",
       #}),
      
  }
    service { 'minecraft':
      ensure => running,
      enable => true,
      require => [File["${install_dir}/minecraft_server.jar"],File['/etc/systemd/system/minecraft.service']],
  }
}
