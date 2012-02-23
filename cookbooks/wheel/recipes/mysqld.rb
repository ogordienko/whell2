#
# Cookbook Name:: wheel
# Recipe:: mysqld
#

package "mysql-server" do
    action :install
end

service "mysql" do
    service_name value_for_platform([ "centos", "redhat", "suse", "fedora", "scientific", "amazon" ] => {"default" => "mysqld"}, "default" => "mysql")
    if (platform?("ubuntu") && node.platform_version.to_f >= 10.04)
        restart_command "restart mysql"
        stop_command "stop mysql"
        start_command "start mysql"
    end
    supports :status => true, :restart => true, :reload => true
    action :nothing
end

execute "assign-root-password" do
    command "/usr/bin/mysqladmin -u root password \"#{node[:stack][:mysql][:password]}\""
    action :run
    only_if "/usr/bin/mysql -u root -e 'show databases;'"
end

