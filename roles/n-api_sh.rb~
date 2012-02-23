name "n-api_sh"
description "nova-api_nova-shedule"
run_list  "recipe[wheel::stack]"
override_attributes "stack" => { "enabled_services" => [ "n-api", "n-sh" ] }
