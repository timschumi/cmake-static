# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.define "x64" do |x64|
    x64.vm.box = "generic/debian8"
  end

  config.vm.define "x86" do |x86|
    x86.vm.box = "timschumi/debian8-x32"
  end

  config.vm.hostname = "cmake-build"
  config.vm.synced_folder ".", "/vagrant", nfs_version: 4

  config.vm.provision "shell", inline: <<-SHELL
    apt update && apt -y upgrade

    apt -y install build-essential libssl-dev
  SHELL
end
