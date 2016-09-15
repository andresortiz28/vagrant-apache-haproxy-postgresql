
execute 'install_haproxy' do
 command 'yum install haproxy -y'
end

service 'haproxy' do
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start ]
end

bash "open port" do
	user "root"
	code <<-EOH
	iptables -I INPUT 5 -p tcp -m state --state NEW -m tcp --dport 81 -j ACCEPT
	service iptables save
	EOH
end

cookbook_file "/etc/haproxy/haproxy.cfg" do
	source "haproxy.cfg"
	mode 0644
	owner "root"
	group "wheel"
end