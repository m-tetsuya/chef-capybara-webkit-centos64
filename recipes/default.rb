#
# Cookbook Name:: chef-capybara-webkit-centos64
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

template "/etc/yum.repos.d/qt.repo" do
  owner "root"
  group "root"
  mode 0644
end

%w{xorg-x11-server-Xvfb qt48-qt-webkit-devel}.each do |pkg|
  package pkg do
    action  :install
  end
end

link "/opt/rh/qt48/root/usr/include/QtCore/qconfig-x86_64.h" do
  to "/opt/rh/qt48/root/usr/include/QtCore/qconfig-64.h"
end

template "/etc/profile.d/capybara.sh" do
  owner "root"
  group "root"
  mode 0644
end

gem_package 'capybara-webkit' do
  action  :install
end
