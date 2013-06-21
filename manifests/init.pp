include nodejs

file { "/etc/motd":
  content => "Welcome to vagrant-meteor, the Meteor development machine.
Meteorite is installed, to start a project, use 'mrt create my-app",
}

package { [
		"git",
		"zsh",
		"curl",
		"mongodb",
	]:
	ensure => installed,
}

exec { "/usr/bin/curl https://install.meteor.com | /bin/sh":
	require => Package["curl"],
	creates => "/usr/local/bin/meteor",
}

user { "vagrant":
  shell => "/bin/zsh",
}

vcsrepo { "/home/vagrant/.oh-my-zsh":
  ensure => latest,
  provider => git,
  source => "git://github.com/robbyrussell/oh-my-zsh.git",
  revision => "master",
  user => "vagrant",
}

package { "meteorite":
	ensure => installed,
  provider => npm,
	require => Package["nodejs"],
}

file { "/home/vagrant/.zshrc":
  owner => "vagrant",
  group => "vagrant",
  content => "ZSH=\$HOME/.oh-my-zsh
ZSH_THEME=\"robbyrussell\"
plugins=(git bundler rake)
source \$ZSH/oh-my-zsh.sh
export MONGO_URL=mongodb://localhost:27017
cd /vagrant",
}
