# -*- mode: ruby -*-
# # vi: set ft=ruby :
#
# Cookbook Name:: wheel
# Recipe:: tempest 
#

include_recipe "wheel::stack"

git "/home/#{node[:wheel][:username]}/tempest" do
    repository node[:stack][:repos]["TEMPEST"]
    reference "#{node[:stack][:branch]}"
    action :sync
    user node[:wheel][:username]
end

execute "./conf_from_devstack --devstack-dir=/home/#{node[:wheel][:username]}/devstack" do
    user node[:wheel][:username]
    environment ({"HOME" => "/home/#{node[:wheel][:username]}"})
    cwd "/home/#{node[:wheel][:username]}/tempest/tempest/tools"
    not_if {File.exists?("/home/#{node[:wheel][:username]}/tempest/etc/tempest.conf")}
end

package "python-nose" do
    action :install
end

package "python-unittest2" do
    action :install
end

execute "nosetests tempest/tests" do
    user node[:wheel][:username]
    environment ({"HOME" => "/home/#{node[:wheel][:username]}"})
    cwd "/home/#{node[:wheel][:username]}/tempest/"
end

