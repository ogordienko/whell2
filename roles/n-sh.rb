name "n-sh"
description "nova-shedule"
run_list  "recipe[wheel::stack]"
override_attributes "wheel::stack" => { "enabled_services" => "n-sh" }
