class php {
	package { 
		[
			"php5",
			"php5-cli",
			"php5-mysql",
		    "php5-mcrypt",
		    "php5-gd",
		    "php5-curl",			
			"libapache2-mod-php5"
		]:
			ensure => present,
			require => Package[
				"apache2",
				"mysql-server"
			]
	}
}