#
# Cookbook Name:: application
# Recipe:: rails
#
# This recipes sets up capistrano directories for app deployment
# and an environment bash script used to launch app processes
#

deploy_user = user(node['application']['deploy_user'])

# Create paths that capistrano needs
directories = [
  "",
  "releases",
  "shared",
  "shared/log",
  "shared/pids",
  "shared/system",
  "shared/sockets",
  "shared/sitemaps"
] + node['application']['rails']['directories']

directories.each do |dir|
  directory("#{node['application']['deploy_path']}/#{dir}") do
    owner deploy_user.username
    group deploy_user.group
    mode 0755
  end
end

# Create a bash environment script that is used to run application
# related processes
template "#{node['application']['deploy_path']}/environment" do
  cookbook "application"
  source "rails_environment.erb"
  owner deploy_user.username
  variables :environment => node['application']['environment'] || node.chef_environment || node['chef_environment']  # addresses vagrant
  mode 0700
end