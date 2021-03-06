class graylog2::config inherits graylog2::params {
  Exec {
    path      => "${::path}",
    logoutput => on_failure,
  }
  $iptables_hosts = $graylog2::params::iptables_hosts
  if ($graylog2::update_local_syslog) {
    if ! defined(Package["rsyslog"]) { package { "rsyslog": ensure => installed, } }
    if ! defined(Service["rsyslog"]) { service { "rsyslog": ensure => running, } }
    if ! defined(File['/etc/rsyslog.d/50-default.conf']) {
      file { "graylog2::config::default_syslog_conf":
        ensure  => present,
        path    => "/etc/rsyslog.d/50-default.conf",
        content => template("graylog2/rsyslog-50-default.conf.erb"),
        notify  => Service["rsyslog"],
      }
    }
  }
  # iptables
  file { '/tmp/.arcus.iptables.rules.graylog':
    ensure  => present,
    owner   => root,
    group   => root,
    mode    => 0600,
    content => template('graylog2/iptables.erb'),
  }
}
