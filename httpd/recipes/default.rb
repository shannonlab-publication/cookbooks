#
# Cookbook Name:: httpd
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package "httpd-devel" do
  action :install
end

cookbook_file "/tmp/mod_wsgi-4.5.5.tar.gz" do
    source "/tmp/mod_wsgi-4.5.5.tar.gz"
end

execute 'Install mod_wsgi' do
  command <<-EOH
    cd /tmp
    tar zxvf mod_wsgi-4.5.5.tar.gz
    cd mod_wsgi-4.5.5
    ./configure --with-python=/usr/local/Python-3.5.2/bin/python
    make
    make install
  EOH
  not_if { ::File.exists?("/usr/lib64/httpd/modules/mod_wsgi.so") }
end

template "/etc/httpd/conf.d/wsgi.conf" do
  source "/etc/httpd/conf.d/wsgi.conf.erb"
  owner "root"
  group "root"
  mode 00644
end

