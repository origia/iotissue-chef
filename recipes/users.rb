settings = node['iotissue']

authorized_keys = search(:ssh_keys, '*:*').map { |h| h['key'] }.join("\n")
home = "/home/#{settings['user']}"

group settings['group'] do
  action :create
end

user settings['user'] do
  supports manage_home: true
  comment 'iotissue user'
  home "/home/#{settings['user']}"
  shell '/bin/bash'
  group settings['group']
end

directory 'ssh directory' do
  user settings['user']
  group settings['group']
  path "#{home}/.ssh"
  mode '0755'
  action :create
end

file 'authorized_keys' do
  user settings['user']
  group settings['group']
  path "#{home}/.ssh/authorized_keys"
  mode '0644'
  action :create
  content authorized_keys
end
