class apache {      
    package { 
        "apache2":
            ensure => present
    }

    service { 
    	"apache2":
        	enable => true,
    		ensure => running,
            require => Package["apache2"]
    }

    file { 
        "/etc/apache2/mods-enabled/rewrite.load":
            ensure  => link,
            target  => "/etc/apache2/mods-available/rewrite.load",
            require => Package['apache2']
    }

    file {
    	"/etc/apache2/mods-enabled/ssl.conf":
    		ensure => link,
	    	target => "/etc/apache2/mods-available/ssl.conf",
    		notify => Service["apache2"],
            require => Package['apache2']
    }

    file {
    	"/etc/apache2/mods-enabled/ssl.load":
    		ensure => link,
	    	target => "/etc/apache2/mods-available/ssl.load",
    		notify => Service["apache2"],
            require => Package['apache2']	
    }

    file {
    	"/etc/apache2/sites-available/vhosts": 
    		ensure => file,
    		content => template("apache/vhosts"),
    		require => File[
    			"/etc/apache2/mods-enabled/ssl.conf",
    			"/etc/apache2/mods-enabled/ssl.load"
    		]
    }

    file {
    	"/etc/apache2/sites-enabled/vhosts":
    		ensure => link,
    		require => File["/etc/apache2/sites-available/vhosts"],
	    	target => "/etc/apache2/sites-available/vhosts",
    		notify => Service["apache2"]
    }

    file {
    	"/etc/apache2/sites-enabled/000-default":
    		ensure => absent,
    		notify => Service["apache2"]
    }
}