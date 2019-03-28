class minecraft {
   package {‘java’:
   require => Exec['yum update -y'],
   ensure => installed,
  } 
}
