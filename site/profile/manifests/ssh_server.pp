class profile::ssh_server {
	package {'openssh-server':
		ensure => present,
	}
	service { 'sshd':
		ensure => 'running',
		enable => 'true',
	}
	ssh_authorized_key { 'root@master.puppet.vm':
		ensure => present,
		user   => 'root',
		type   => 'ssh-rsa',
		key    => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQC0+Yh1TPvj9buB4o6JvvkzPk+BcVCY7IqxxX1s2NdynYUL/nO/zZfd+TGAV9cevi9iSKfL/O47BquCCzE+xomZRBQ0JVFUszLP+yLj75NE+djrq0RlJes9dzqMXqr7CrNbM7KxCZBUs3xxfGDe3k8eaFP0six27Jfvmp1J+FtH7SlHXnO3uZygwFxpBXdPMlmRUFsRBIYQfnMguTEQWdgp26OuYUX9VnY374ifdm36i+pEma+/l1/5NFep5aCtp16x/fjTw+caqEGgTsOCSdD6d0+n5FDyZj1HjI9viqNQdYajYT5umV0r7KaRgRw3r/LcqqLywgzULXW2uIxeYU7L',
	}  
}
