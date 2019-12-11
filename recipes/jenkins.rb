#
# Cookbook:: lamp_stack
# Recipe:: jenkins
#
# Copyright:: 2019, The Authors, All Rights Reserved.

package 'wget' do
    action :install
end

execute 'add repo key' do
    command 'wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -'
    not_if 'apt-key list | grep -i jenkins'
    action :run
end

execute 'add jenkins repo ' do
    command 'sudo sh -c "echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list"'
    not_if { ::File.exist?('/etc/apt/sources.list.d/jenkins.list')}
    action :run
end

apt_update

package 'openjdk-8-jdk' do
    action :install
end

package 'jenkins' do
    action :install
end


