name "n-sh"
description "nova-shedule"
run_list  "recipe[wheel::stack]"
default_attributes "stack" => { "enabled_services" => [ "n-sh"] }
