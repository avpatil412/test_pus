require 'yaml'

def get_addresses_by_state(state)
  data = YAML::load_file('./class_mapping.yml')
  address_data = data[state.to_sym][:ADDRESS][0]
  d = [address_data['street'],address_data['city'],address_data['zip']]
  puts d
end

#get_addresses_by_state("CT")

=begin
city = "cambridge"
address_data.each do |x|
  puts x['city']
  if x['city'].downcase===city.downcase
    street = x['street']
    zip = x['zip']
  end
  puts street
  puts zip
end
=end

def condition_check(agent_type,agency,underwriter_id=nil,producer_code=nil, underwriter_select=nil)
  $channel = "nwag"
  if agent_type.include? "Internal"
    agency_number =  agency ? agency : "29900"
    puts "**** agency number **** #{agency_number}"
    puts "hello => I am an internal user"
  elsif agent_type.include? "External"
    puts "hello => I am an external user"
    puts "---- creating quote for external user ---"
    puts "count of windows : is 1"
  else
    #replace puts with fail
    puts "---User is niether internal nor external exiting tests ----"
  end
  puts "**** underwriter id **** #{underwriter_id}" if underwriter_id
  puts "**** producer code **** #{producer_code}"  if producer_code
  puts "***** underwriter selected **** #{underwriter_select}" if underwriter_select
end

condition_check("external","3001","under_id","pro","under_select")
