class mysql {
	package { 
		"mysql-server":
			ensure => present
	}

	service { 
		"mysql":
	    	enable => true,
			ensure => running,
			require => Package["mysql-server"]
	}
}