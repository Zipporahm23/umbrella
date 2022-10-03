p "Where are you located?"
# user_location = gets.chomp
user_location = "Taj Mahal"

p user_location

require "open-uri"



full_url = "https://maps.googleapis.com/maps/api/geocode/json?address=UIC&key=AIzaSyD8RrOFB0dPsF-leqeFJdmX3yOvcQbfNyY"

#p subbed_string
#p gmaps_api_url




subbed_string = full_url.gsub("UIC", user_location)
raw_gmaps_data = URI.open(subbed_string).read
require "json"

parsed_gmaps_data = JSON.parse(raw_gmaps_data)
results_array = parsed_gmaps_data.fetch("results")

first_result = results_array.at(0)

geo = first_result.fetch("geometry")

loc = geo.fetch("location")

p latitude = loc.fetch("lat")

p longitude = loc.fetch("lng")
