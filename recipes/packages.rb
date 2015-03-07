settings = node['iotissue']

include_recipe 'apt'

settings['packages'].each do |pkg|
  package pkg
end

include_recipe 'nodejs'
execute 'install pm2' do
  command 'npm install -g pm2'
end
