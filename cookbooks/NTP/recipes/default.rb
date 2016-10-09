#
# Cookbook Name:: NTP
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "ntp" do
	action :install
end

template "/etc/ntp.conf" do
	source "ntp.conf.erb"
	owner "root"
	mode "0644"
end

service "ntp" do
	action :start
end
