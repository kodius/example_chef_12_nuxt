#
# Cookbook Name:: kodius_cookbook
# Recipe:: default
#
# Copyright (c) 2020 The Authors, All Rights Reserved.
file "#{ENV['HOME']}/test.txt" do
  content 'This file was created by Chef Infra!'
end