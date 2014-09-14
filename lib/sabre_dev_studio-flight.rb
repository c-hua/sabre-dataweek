SabreDevStudio.configure do |c|
  c.client_id     = 'VjE6dHkycGFxOTB6d2pwcXl2aDpERVZDRU5URVI6RVhU'
  c.client_secret = 'TzBzNEJmb0c='
  c.uri           = 'https://api.test.sabre.com/'
end
options = {
  :origin        => 'JFK',
  :destination 	 => 'LAX',
  :lengthofstay  => '5',
  :maxfare       => '800'
}
fares = SabreDevStudio::Flight::Api.destination_air_shop(options)
fare_info = fares.fare_info