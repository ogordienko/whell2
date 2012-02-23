#
# Cookbook Name:: wheel
# Recipe:: default
#

case node[:platform]
when "ubuntu", "debian"
    execute "apt-get update" do
        ignore_failure true
        action :run
    end
end

include_recipe "wheel::stack"

