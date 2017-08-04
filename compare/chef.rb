# Chef

default['ntp']['toplevel_timeservers'] = ['pool.ntp.org']
default['ntp']['netdevice'] = 'eth0'

package "ntp" do
    action [:install]
end
 
template "/etc/ntp.conf" do
    source "ntp.conf.erb"
    variables( :ntp_server => node['ntp']['toplevel_timeservers'])
    notifies :restart, "service[ntpd]"
end
 
service "ntpd" do
    action [:enable,:start]
end

# vim: ft=ruby
