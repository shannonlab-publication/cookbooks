#
# Cookbook Name:: pip-modules
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
execute 'pip install Django' do
  command '/usr/local/Python-3.5.2/bin/pip install django==1.10'
end

execute 'pip install redis' do
  command '/usr/local/Python-3.5.2/bin/pip install redis==2.10.5'
end

execute 'pip install Keras' do
  command '/usr/local/Python-3.5.2/bin/pip install Keras==0.3.3'
end

execute 'pip install Theano' do
  command '/usr/local/Python-3.5.2/bin/pip install Theano==0.8.2'
end

execute 'pip install pandas' do
  command '/usr/local/Python-3.5.2/bin/pip install pandas==0.18.1'
end
