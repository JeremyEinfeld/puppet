class graylog2::params {
  $server_name = hiera('graylog_server_name', "localhost")
  $external_hostname = hiera('graylog_external_hostname', "localhost")
  $update_local_syslog = true
  $graylog_dir = "/opt/graylog"
  $graylog_server_dir = "/opt/graylog_server"
  $graylog_server_url = "https://github.com/downloads/Graylog2/graylog2-server/graylog2-server-0.9.6.tar.gz"
  $graylog_web_url = "https://github.com/downloads/Graylog2/graylog2-web-interface/graylog2-web-interface-0.9.6p1-RC1.tar.gz"
  $graylog_web_port = hiera('graylog_web_port', '3000')
  $mongodb_url = "http://fastdl.mongodb.org/linux/mongodb-linux-x86_64-2.0.2.tgz"
  $mongodb_dir = "/opt/mongodb"
  $mongodb_data_dir = "/opt/mongodb_data"
  $elasticsearch_dir = "/opt/elasticsearch"
  $elasticsearch_url = "https://s3.amazonaws.com/arcus-support/puppet/elasticsearch-0.18.6.tar.gz"
  $iptables_hosts = hiera_array('graylog_iptables_hosts', ['0.0.0.0/0'])
}
