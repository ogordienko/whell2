#
# Cookbook Name:: wheel
# Recipe:: rabbitmq
#

package "rabbitmq-server" do
    action :install
end

#service "rabbitmq-server" do
#    stop_command "/usr/sbin/rabbitmqctl stop"
#    action [:enable, :start]
#end
