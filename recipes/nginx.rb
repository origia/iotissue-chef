settings = node['iotissue']

file '/etc/nginx/sites-enabled/default' do
  action :delete
end

template 'nginx' do
  source 'iotissue_nginx.erb'
  action :create
  path '/etc/nginx/sites-available/iotissue'
  variables port: settings['nginx_port'],
            appdir: settings['appdir'],
            server_name: settings['server_name']
end

link '/etc/nginx/sites-enabled/iotissue' do
  to '/etc/nginx/sites-available/iotissue'
end

service 'nginx' do
  supports status: true, restart: true, reload: true
  action :reload
end
