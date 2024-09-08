Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/bionic64"
    
    config.vm.provider "virtualbox" do |v|
      v.memory = 2048
      v.cpus = 2
    end
    
    config.vm.define "master" do |master|
      master.vm.network "private_network", ip: "192.168.50.10"
      master.vm.hostname = "master"
      # master.vm.provision "shell", path: "bootstrap.sh"
      master.vm.provision "shell", path: "./scripts/docker.sh"
      master.vm.provision "shell", path: "./scripts/kubernetes.sh"
      master.vm.provision "shell", path: "./scripts/disable_swap.sh"
      master.vm.provision "shell", path: "./scripts/enable_container.sh"

      master.vm.provision "file", source: "./source/terminal.sh", destination: "$HOME/terminal.sh"
      master.vm.provision "file", source: "./source/plugin.sh", destination: "$HOME/plugin.sh"
      master.vm.provision "file", source: "./source/test-node.yaml", destination: "$HOME/test-node.yaml"
    end
  
    (1..2).each do |i| 
      config.vm.define "node-#{i}" do |node|
        node.vm.network "private_network", ip: "192.168.50.#{10 + i}"
        node.vm.hostname = "node-#{i}"
        # node.vm.provision "shell", path: "bootstrap.sh"
        node.vm.provision "shell", path: "./scripts/docker.sh"
        node.vm.provision "shell", path: "./scripts/kubernetes.sh"
        node.vm.provision "shell", path: "./scripts/disable_swap.sh"
        node.vm.provision "shell", path: "./scripts/enable_container.sh"
      end
    end
  end