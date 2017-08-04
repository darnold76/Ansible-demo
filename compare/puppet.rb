# Puppet

$ntpServerList = [ 'pool.ntp.org' ]
$ntpNetDevice = 'eth0'

class ntp( $ntpServerList = $common::data::ntpServerList) {
  package { 'ntp':
  ensure => 'present',
  } #package

  file { '/etc/ntp.conf':
    mode    => "644",
    content => template("ntp/client-ntp.conf.erb"),
    notify  => Service["ntpd"],
    require => Package["ntp"],
  } # file

  service { 'ntpd':
    ensure  => running,
    enable  => true,
    require => Package["ntp"],
  } # service
}

# vim: ft=puppet
