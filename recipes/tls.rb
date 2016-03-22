#
# Cookbook Name:: loggly
# Recipe:: tls
#
# Copyright (C) 2014 AgaMatrix
# 
# All rights reserved - Do Not Redistribute
#

package 'rsyslog-gnutls' do
  action :install
end

cert_path = node['loggly']['tls']['cert_path']

directory cert_path do
  owner 'root'
  group 'syslog'
  mode 0750
  action :create
  recursive true
end

remote_file 'loggly cert' do
  owner 'root'
  group 'root'
  mode 0644
  path ::File.join(cert_path, 'loggly_full.crt')
  source node['loggly']['tls']['cert_url']
  checksum node['loggly']['tls']['cert_checksum']
end
