# -*- mode: ruby -*-
# vi: set ft=ruby :

Ubuntu = 'chef/ubuntu-12.04'
CentOS = 'chef/centos-6.5'

nodes = {
'master' => "Ubuntu",
'node01' => "Ubuntu",
'node02' => "CentOS",
}

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  nodes.each do |node, flavor|
    config.vm.box = Ubuntu
    config.vm.define "#{node}" do |box|
      box.vm.hostname = "#{node}.devops.local"

      # Enable settings specific to the CentOS platform
      if flavor == "CentOS"
        box.vm.box = CentOS
        box.ssh.pty = true
      end

      # Determine which Shell script will be run based on the node type.
      if node == "master"
        provisioner = "provisioners/master.sh"
      else
        provisioner = "provisioners/#{flavor}.sh"
      end
      box.vm.provision :shell, :path => provisioner

      # If using this template for a Puppet Enterprise master, allocate 4 GB RAM to it.
      # Other nodes only require the amount of RAM dictated by the apps they run.
      box.vm.provider :vmware_fusion do |v|
        v.vmx["memsize"] = 256
        if node == "master"
          v.vmx["memsize"] = 4096
        end
      end
    end
  end
end
