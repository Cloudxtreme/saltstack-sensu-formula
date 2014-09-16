# -*- mode: ruby -*-
# vi: set ft=ruby :
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "nrel/CentOS-6.5-x86_64"
  config.vm.provider "virtualbox" do |v|
    v.memory = 512
    v.cpus = 1
  end

  config.vm.define "sensu" do |sensu|
    sensu.vm.host_name = "sensu"
    sensu.vm.network "private_network", ip: "192.168.250.100"
    sensu.vm.synced_folder "sensu/", "/srv/salt/sensu/"
    sensu.vm.provision "shell", inline: "sudo bash"
    sensu.vm.provision "shell", inline: "rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm"
    sensu.vm.provision "shell", inline: "echo '192.168.250.100 salt' >> /etc/hosts"
    sensu.vm.provision "shell", inline: "service iptables stop"
    sensu.vm.provision "shell", inline: "yum remove ruby -y"
    sensu.vm.provision "shell", inline: "yum install redis -y"
    sensu.vm.provision "shell", inline: "chkconfig redis on"
    sensu.vm.provision "shell", inline: "service redis start"
    sensu.vm.provision "shell", inline: "yum install salt-master -y"
    sensu.vm.provision "shell", inline: "chkconfig salt-master on"
    sensu.vm.provision "shell", inline: "service salt-master start"
    sensu.vm.provision "shell", inline: "yum install salt-minion -y"
    sensu.vm.provision "shell", inline: "chkconfig salt-minion on"
    sensu.vm.provision "shell", inline: "echo 'sensu' >> /etc/salt/minion_id"
    sensu.vm.provision "shell", inline: "service salt-minion start"
    sensu.vm.provision "shell", inline: "echo 'EMBEDDED_RUBY=true' > /etc/default/sensu"
    sensu.vm.provision "shell", inline: "ln -s /opt/sensu/embedded/bin/ruby /usr/bin/"
  end

  config.vm.define "client1" do |client|
    client.vm.host_name = "client1"
    client.vm.network "private_network", ip: "192.168.250.101"
    client.vm.synced_folder "sensu/", "/srv/salt/sensu/"
    client.vm.provision "shell", inline: "sudo bash"
    client.vm.provision "shell", inline: "rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm"
    client.vm.provision "shell", inline: "echo '192.168.250.100 salt' >> /etc/hosts"
    client.vm.provision "shell", inline: "service iptables stop"
    client.vm.provision "shell", inline: "yum remove ruby -y"
    client.vm.provision "shell", inline: "yum install salt-minion -y"
    client.vm.provision "shell", inline: "chkconfig salt-minion on"
    client.vm.provision "shell", inline: "echo 'client1' >> /etc/salt/minion_id"
    client.vm.provision "shell", inline: "service salt-minion start"
    client.vm.provision "shell", inline: "echo 'EMBEDDED_RUBY=true' > /etc/default/sensu"
    client.vm.provision "shell", inline: "ln -s /opt/sensu/embedded/bin/ruby /usr/bin/"
  end

end