require 'rest-client'

t = RestClient.get 'https://www.google.be/?gfe_rd=cr&ei=1KySVd-QEauk0AWq64CgBw#q=twilio'

puts t
