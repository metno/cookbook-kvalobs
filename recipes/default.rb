#
# Cookbook Name:: met-kvalobs
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

template '/etc/pam.d/common-session' do
  source 'default/etc/pam.d/common-session.erb'
  owner 'root'
  group 'root'
  mode '0644'
end
