#
# Cookbook Name:: base
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
template "/etc/sudoers" do
  source "/etc/sudoers.erb"
  owner "root"
  group "root"
  mode 00440
end

template "/etc/sshd_config" do
  source "/etc/sshd_config.erb"
  owner "root"
  group "root"
  mode 00600
end


