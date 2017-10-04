require 'yaml'

def get_addresses_by_state(state)
  data = YAML::load_file('./class_mapping.yml')
  address_data = data[state.to_sym][:ADDRESS][0]
  d = [address_data['street'],address_data['city'],address_data['zip']]
  puts d
end

get_addresses_by_state("CT")

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

def exc_pop

end
