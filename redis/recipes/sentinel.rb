#
# Cookbook Name::       redis
# Description::         Install redis_sentinel and configure master node
# Recipe::              sentinel.rb
# Author::              Giorgio Balconi
#
# Copyright 2018, Giorgio Balconi
#

# Install redis_server
package 'redis-sentinel'

# Configure master node template

template "#{node[:redis][:conf_dir]}/sentinel.conf" do
  source        "sentinel.conf.erb"
  owner         "root"
  group         "root"
  mode          "0644"
  variables     :port => node[:redis][:server][:port], :master_name => node[:sentinel][:master_name]
end
