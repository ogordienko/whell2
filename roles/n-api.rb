name "n-api"
description "nova-api"
run_list  "recipe[wheel::stack]"
override_attributes "wheel::stack" => { "enabled_services" => "n-api" }

