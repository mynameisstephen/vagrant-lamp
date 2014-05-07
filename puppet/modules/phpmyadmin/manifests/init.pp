class phpmyadmin {
	package { 
		"phpmyadmin":
			ensure => present,
			require => Package["apache2", "mysql-server", "php5", "php5-mysql"]
	}

	file {
		"/etc/apache2/conf.d/phpmyadmin.conf":
			ensure => link,
			target => "/etc/phpmyadmin/apache.conf",
			notify => Service["apache2"],
            require => Package["phpmyadmin", "apache2"]			
	}

    file {
        "/etc/phpmyadmin/config.inc.php":
    		ensure => file,
    		content => template("phpmyadmin/config.inc.php"),
            owner => root, 
            group => root,
            mode => '0775',    		
            notify => Service["apache2"],
            require => Package["phpmyadmin", "apache2"]
    }	
}