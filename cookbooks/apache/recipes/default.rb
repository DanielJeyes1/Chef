#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package "httpd" do
	action :install
end

service "httpd" do
	action [ :enable, :start ]
end

execute "mv /etc/httpd/conf.d/welcome.conf /etc/httpd/conf.d/welcome.conf.disabled" do
	only_if do
		File.exist?("/etc/httpd/conf.d/welcome.conf")
	end
	notifies :restart, "service[httpd]"
end

node["apache"]["sites"].each do |site_name, site_data|
	document_root = "/srv/apache/#{site_name}"

template "/etc/httpd/conf.d/#{site_name}.conf" do
	source "custom.erb"
	mode "0644"
	variables(
		:document_root => document_root,
		:port => site_data["port"]
		)
		notifies :restart, "service[httpd]"
	end
	