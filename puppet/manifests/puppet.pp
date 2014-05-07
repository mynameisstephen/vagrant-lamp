exec { 
	"apt-update":
    	command => "/usr/bin/apt-get update"
}

Exec["apt-update"] -> Package <| |>

include apache
include mysql
include php
include phpmyadmin