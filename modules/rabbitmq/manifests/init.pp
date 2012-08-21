# == Class: rabbitmq
#
# Installs and configures RabbitMQ
#
# === Parameters
#
# === Variables
#
# === Examples
#
#  class { rabbitmq: }
#    or
#  include rabbitmq
#
# === Authors
#
# Arcus <support@arcus.io>
#
# === Copyright
#
# Copyright 2012 Arcus, unless otherwise noted.
#
class rabbitmq (
    $rabbitmq_user=$rabbitmq::params::rabbitmq_user,
    $rabbitmq_password=$rabbitmq::params::rabbitmq_password,
  ) inherits rabbitmq::params {
  class { 'rabbitmq::package': }
  class { 'rabbitmq::config':
    require => Class['rabbitmq::package'],
  }
  class { 'rabbitmq::service':
    require => [ Class['rabbitmq::config'], Class['rabbitmq::package'] ],
  }
}
