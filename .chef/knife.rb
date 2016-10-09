# See http://docs.chef.io/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "danieljeyeshome"
client_key               "#{current_dir}/danieljeyeshome.pem"
validation_client_name "chefhomenow-validator"
validation_key "/users/chef/.chef/chefhomenow-validator.pem"
chef_server_url          "https://api.chef.io/organizations/chefhomenow"
cookbook_path            ["#{current_dir}/../cookbooks"]
