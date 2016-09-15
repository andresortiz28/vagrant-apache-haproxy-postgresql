# vagrant-apache-haproxy-postgresql
Code of provisioning of a load balancer for two web servers and a postgres database

This code will allow to any developer to deploy automatically a virtual infrastructure containing:

* One load balancer using haproxy
* Two web servers using apache
* One database using postgresql

This kind of infrastructure was deployed under a Linux based operating system, specifically ubuntu 14.04.

### Required Software:
* Vagrant
* Chef Solo
* VirtualBox

In the sections below, instructions for executing the provisioning infrastructure are presented:

### Clone the repository
Clone the repository to any folder in your computer
```sh
git clone https://github.com/andresort28/vagrant-apache-haproxy-postgresql.git
```

### Download CentOS
Due to each virtual machine has an operating system CentOS 6, you need to download a **.box** containing a clean CentOS 6 distribution from the following link:
```sh
https://atlas.hashicorp.com/boxes/search
```

### Install a BOX in Vagrant
Add the **.box** with the name *centos6*
```sh
vagrant box add centos6 /.../centos6.box
```

### Edit settings
Go to **Vagrantfile** an edit the name of the box you added to vagrant
```sh
server.vm.box = "centos6"
...
node1.vm.box = "centos6"
...
node2.vm.box = "centos6"
...
db.vm.box = "centos6"
```

### Deploy
Open a terminal, go to the directory where you cloned the repository, and deploy the infrastructure
```sh
vagrant up
```

### Verify
Open a browser and type 192.168.56.101:81 to see the load balancing, and type 192.168.56.101:81/select.php to view the queries to the database according to the web server

Ready !
