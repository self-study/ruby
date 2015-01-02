#
# Cookbook Name:: for-rails
# Recipe:: default
#
# Copyright 2014, hiroyosi
#
# All rights reserved - Do Not Redistribute
#


package "vim-enhanced" do
  action :install
end

# service iptables stop
# chkconfig iptables off

service "iptables" do
  action [:stop, :disable]
end

# php mysql-server httpd

%w{php mysql-server httpd}.each do |p|
  package p do
    action :install
  end
end

service "httpd" do
  action [:start, :enable]
end

package "ruby" do
  action :remove
end

git "/home/vagrant/.rbenv" do
  repository "https://github.com/sstephenson/rbenv.git"
  revision   "master"
  user       "vagrant"
  group      "vagrant"
  action     :sync
end

directory "/home/vagrant/.rbenv/plugins" do
  owner  "vagrant"
  group  "vagrant"
  action :create
end

git "/home/vagrant/.rbenv/plugins/ruby-build" do
  repository "https://github.com/sstephenson/ruby-build.git"
  revision   "master"
  user       "vagrant"
  group      "vagrant"
  action     :sync
end


bash "path for rbenv" do
  user "root"
  code <<-EOS
echo 'export RBENV_ROOT="/home/vagrant/.rbenv"' >> /etc/profile
echo 'export PATH="/home/vagrant/.rbenv/bin:$PATH"' >> /etc/profile
echo 'eval "$(rbenv init -)"' >> /etc/profile
  EOS
  action :run
end


package "openssl-devel" do
  action :install
end


bash "rbenv install" do
  user   "vagrant"
  cwd    "/home/vagrant"
  code   "source /etc/profile; rbenv install 2.1.5"
  action :run
  not_if { ::File.exists? "/home/vagrant/.rbenv/versions/2.1.5" }
end

bash "rbenv rehash" do
  user   "vagrant"
  cwd    "/home/vagrant"
  code   "source /etc/profile; rbenv rehash"
  action :run
end

# install ruby
bash "rbenv global" do
  user   "vagrant"
  cwd    "/home/vagrant"
  code   "source /etc/profile; rbenv global 2.1.5"
  action :run
end

bash "bundler" do
  user   "vagrant"
  cwd    "/home/vagrant"
  code   "source /etc/profile; gem install bundler"
  action :run
  not_if { ::File.exists? "/home/vagrant/.rbenv/shims/bundle" }
end

bash "sqlite" do
  user   "root"
  cwd    "/home/vagrant"
  code   "yum -y install sqlite-devel"
  action :run
end

bash "rails" do
  user   "vagrant"
  cwd    "/home/vagrant"
  code   "source /etc/profile; gem install rails"
  action :run
end
