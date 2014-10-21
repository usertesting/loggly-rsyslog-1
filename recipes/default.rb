#
# Cookbook Name:: loggly
# Recipe:: default
#
# Copyright (C) 2014 AgaMatrix
# 
# All rights reserved - Do Not Redistribute
#

#loggly_token = Chef::EncryptedDataBagItem.load('loggly', 'token')['token']
loggly_token = node['loggly']['token']
raise "No token was found in the loggly databag." if loggly_token.nil?

#service "rsyslog"

service "rsyslog" do
  case node["platform"]
  when "ubuntu"
    if node["platform_version"].to_f >= 14.04
      provider Chef::Provider::Service::Upstart
    end
  end
  action [:enable,:start]
  supports :restart => true
end

include_recipe "loggly-rsyslog::tls" if node['loggly']['tls']['enabled']

template '/etc/rsyslog.conf' do
  source 'loggly.conf.erb'
  owner 'root'
  group 'root'
  mode 0644
  variables({
    :monitor_files => !node['loggly']['log_files'].empty? || !node['loggly']['log_dirs'].empty?,
    :tags => node['loggly']['tags'].nil? || node['loggly']['tags'].empty? ? '' : "tag=\\\"#{node['loggly']['tags'].join("\\\" tag=\\\"")}\\\"",
    :token => loggly_token
  })


  notifies :restart, "service[rsyslog]", :immediately
end
