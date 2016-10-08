yum_package 'httpd'
yum_package 'php'
yum_package 'php-pgsql'

execute 'pg' do
 command 'yum localinstall http://yum.postgresql.org/9.4/redhat/rhel-6-x86_64/pgdg-centos94-9.4-3.noarch.rpm -y'
end

yum_package 'postgresql94'

service 'httpd' do
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start ]
end

bash "open port" do
	user "root"
	code <<-EOH
	iptables -I INPUT 5 -p tcp -m state --state NEW -m tcp --dport 80 -j ACCEPT
	service iptables save
	EOH
end

cookbook_file "/var/www/html/index.php" do
	source "index.php"
	mode 0644
	owner "root"
	group "wheel"
end

cookbook_file "/var/www/html/info.php" do
	source "info.php"
	mode 0644
	owner "root"
	group "wheel"
end

cookbook_file "/var/www/html/select.php" do
	source "select.php"
	mode 0644
	owner "root"
	group "wheel"
end
