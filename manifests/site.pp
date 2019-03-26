node default {
  file {'/root/README':
    ensure  => file,
    content => 'This is a readme file for puppet.',
    owner   => 'root'
  }
}
node 'master.puppet.vm' {
  include role::master_server
}
