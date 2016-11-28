#
# Cookbook Name:: redis-2.8.17
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "tcl-devel" do
  action :install
end

cookbook_file "/tmp/redis-2.8.17.tar.gz" do
  source "/tmp/redis-2.8.17.tar.gz"
  mode 0755
end

bash "install redis-2.8.17" do
  user "root"
  cwd "/tmp"
  not_if { ::Dir.exists?("/usr/local/redis-2.8.17") }
  code <<-EOH
    tar -zxvf redis-2.8.17.tar.gz
    cd redis-2.8.17
    make PREFIX=/usr/local/redis-2.8.17
    make PREFIX=/usr/local/redis-2.8.17 install
    chown -R root:dev /usr/local/redis-2.8.17
  EOH
end

directory "/usr/local/redis-2.8.17/conf" do
  owner "root"
  group "dev"
  mode 00775
  action :create
end

directory "/usr/local/redis-2.8.17/log" do
  owner "root"
  group "dev"
  mode 00775
  action :create
end

directory "/usr/local/redis-2.8.17/dump" do
  owner "root"
  group "dev"
  mode 00775
  action :create
end

template "/usr/local/redis-2.8.17/conf/6379.conf" do
  source "/usr/local/redis-2.8.17/conf/6379.conf.erb"
  owner "root"
  group "dev"
  mode 00664
end

template "/etc/init.d/redis" do
  source "/etc/init.d/redis.erb"
  owner "root"
  group "dev"
  mode 00774
end

bash 'service redis start' do
  code <<-EOH
    service redis start
    EOH
end
