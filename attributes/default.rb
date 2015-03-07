packages = %w( wget curl gcc git make build-essential openssh-server nginx libopencv-dev )

default['iotissue']['packages'] = packages

default['iotissue']['user'] = 'iotissue'
default['iotissue']['group'] = 'iotissue'

default['iotissue']['appdir'] = "/home/#{default['iotissue']['user']}/iotissue_app"

default['iotissue']['nginx_port'] = 80
default['iotissue']['server_name'] = 'iotissue.com'
