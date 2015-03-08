log_level                :info
log_location             STDOUT
node_name                "tuvistavie"
client_key               "#{ENV['HOME']}/.chef/tuvistavie.pem"
validation_client_name   "tuvistavie-validator"
validation_key           "#{ENV['HOME']}/.chef/tuvistavie-validator.pem"
chef_server_url          "https://api.opscode.com/organizations/tuvistavie"
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )

knife[:cookbook_path] = 'berks-cookbooks'
knife[:secret_file] = File.expand_path('~/.chef/secret_key')
knife[:run_list] = 'recipe[iotissue]'
knife[:use_sudo] = true
knife[:username] = 'root'
