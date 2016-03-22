default['loggly']['tags'] = []

default['loggly']['log_files'] = []
default['loggly']['log_dirs'] = []

default['loggly']['tls']['enabled'] = true
default['loggly']['tls']['cert_path'] = '/etc/rsyslog.d/keys/ca.d'
default['loggly']['tls']['cert_url'] = 'https://logdog.loggly.com/media/logs-01.loggly.com_sha12.crt'
default['loggly']['tls']['cert_checksum'] = 'b562ae82b54bcb43923290e78949153c0c64910d40b02d2207010bb119147ffc'

default['loggly']['rsyslog']['host'] = 'logs-01.loggly.com'
default['loggly']['rsyslog']['port'] = node['loggly']['tls']['enabled'] ? 6514 : 514

# default['loggly']['rsyslog']['repeat_msg'] = false
default['loggly']['rsyslog']['file_owner'] = 'syslog'
default['loggly']['rsyslog']['file_group'] = 'adm'
default['loggly']['rsyslog']['file_create_mode'] = '0640'
default['loggly']['rsyslog']['dir_create_mode'] = '0755'
default['loggly']['rsyslog']['umask'] = '0022'
default['loggly']['rsyslog']['priv_drop_to_user'] = 'syslog'
default['loggly']['rsyslog']['priv_drop_to_group'] = 'syslog'
default['loggly']['rsyslog']['work_directory'] = '/var/spool/rsyslog'
default['loggly']['rsyslog']['input_file_poll_interval'] = 10
