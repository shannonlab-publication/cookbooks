#
# Cookbook Name:: Python-3.5.2
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
cookbook_file "/usr/local/work/Python-3.5.2.tgz" do
  source "/usr/local/work/Python-3.5.2.tgz"
end

unless FileTest.exist?("/usr/local/work/Python-3.5.2.tgz") then
  bash "Install Python" do
    user "root"
    cwd "/usr/local/work/"
    not_if { ::Dir.exists?("/usr/local/work/Python-3.5.2") }
    code <<-EOH
    tar -zxvf Python-3.5.2.tgz
    cd Python-3.5.2
    ./configure --prefix=/usr/local/Python-3.5.2 --enable-shared
    make && make install
    EOH
  end
end

link '/usr/local/lib/libpython3.5m.so.1.0' do
  to '/usr/local/Python-3.5.2/lib/libpython3.5m.so.1.0'
end

link '/usr/local/Python-3.5.2/bin/python' do
  to '/usr/local/Python-3.5.2/bin/python3'
end

bash "ldconfig" do
  user "root"
  code <<-EOH
  ldconfig
  EOH
end

