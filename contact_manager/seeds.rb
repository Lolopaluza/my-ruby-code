require './contact_file'

contacts []

contacts << { name: "Thomas Jefferson", phone: "+1 2063101369", email: "tjeff@us.gov" }
contacts << { name: "Charles Darwin", phone: "+44 20 71234567", email: "darles@evolve.org" }
contacts << { name: "Nikola Tesla", phone: "+385 43 987 3355", email: "bik@inductlabs.com" }
contacts << { name: "Genghis Khan", phone: "+976 2 194 2222", email: "contact@empire.com" }
contacts << { name: "Malcom X", phone: "+1 310 155 8822", email: "x@theroost.org" }

write_contact( contacts )
