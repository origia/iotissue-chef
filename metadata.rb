name 'iotissue'
version '0.1.0'

recipe 'iotissue::default', 'Bootstrap iotissue node'

%w( apt nodejs ).each do |dep|
  depends dep
end

%w( debian ubuntu ).each do |os|
  supports os
end
