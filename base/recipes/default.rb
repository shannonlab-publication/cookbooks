#
# Cookbook Name:: base
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package "openssl-devel" do
  action :install
end

package "sqlite-devel" do
  action :install
end

template "/etc/sudoers" do
  source "/etc/sudoers.erb"
  owner "root"
  group "root"
  mode 00440
end

service "sshd"
template "/etc/ssh/sshd_config" do
  source "/etc/ssh/sshd_config.erb"
  notifies :restart, "service[sshd]"
end

template "/etc/ld.so.conf" do
  source "/etc/ld.so.conf.erb"
  owner "root"
  group "root"
  mode 00644
end

template "/home/dev/.bash_profile" do
  source "/home/dev/.bash_profile.erb"
  owner "dev"
  group "dev"
  mode 00644
end

template "/root/.bash_profile" do
  source "/root/.bash_profile.erb"
  owner "root"
  group "root"
  mode 00644
end

service "iptables" do
  supports :status => true, :restart => true
  action [:disable, :stop]
end
