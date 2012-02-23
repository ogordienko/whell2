name "n-api"
description "nova-api"
run_list  "recipe[wheel::stack]"
default_attributes "stack" => { "enabled_services" => [ "n-api"] }

