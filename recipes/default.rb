#
# Cookbook:: lamp_stack
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

file '/var/www/html/index.html' do
    content "Welcome to My project\n"
    owner 'root'
    group 'root'
    mode '0755'
    action :create
end


package 'apache2' do
    action :install
end

package 'elinks' do
    action :install
end


