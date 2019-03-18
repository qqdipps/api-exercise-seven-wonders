require "httparty"

#Starter Code:
seven_wonders = ["Great Pyramid of Giza", "Hanging Gardens of Babylon", "Colossus of Rhodes", "Pharos of Alexandria", "Statue of Zeus at Olympia", "Temple of Artemis", "Mausoleum at Halicarnassus"]

BASE_URL = "https://us1.locationiq.com/v1/search.php"
key = "4761fe29bfc618"

seven_wonders_locations = {}
if false
  seven_wonders.each do |wonder|
    query = {
      key: key,
      q: wonder,
      format: "json",
    }

    response = HTTParty.get(BASE_URL, query: query)
    sleep(1)
    seven_wonders_locations[wonder] = { "lat" => response.first["lat"], "lng" => response.first["lon"] }
  end

  p seven_wonders_locations
end

#Example Output:
#{"Great Pyramind of Giza"=>{"lat"=>29.9792345, "lng"=>31.1342019}, "Hanging Gardens of Babylon"=>{"lat"=>32.5422374, "lng"=>44.42103609999999}, "Colossus of Rhodes"=>{"lat"=>36.45106560000001, "lng"=>28.2258333}, "Pharos of Alexandria"=>{"lat"=>38.7904054, "lng"=>-77.040581}, "Statue of Zeus at Olympia"=>{"lat"=>37.6379375, "lng"=>21.6302601}, "Temple of Artemis"=>{"lat"=>37.9498715, "lng"=>27.3633807}, "Mausoleum at Halicarnassus"=>{"lat"=>37.038132, "lng"=>27.4243849}}

# Driving directions to Cairo Egypt to the Great Pyramid of Giza.
require "geocoder"
require "httparty"
places = ["Cairo Egypt", "Great Pyramid of Giza"]
key = "4761fe29bfc618"

lat_long = Geocoder.search(places[0]).first.coordinates
lat_long1 = Geocoder.search(places[1]).first.coordinates
URL = "https://us1.locationiq.com/v1"
query = {
  service: "directions",
  profile: "driving",
  coordinates: "#{lat_long[1]},#{lat_long[0]};#{lat_long1[1]},#{lat_long1[0]}",
  key: key,
}

drive = HTTParty.get("https://us1.locationiq.com/v1/directions/driving/#{lat_long[1]},#{lat_long[0]};#{lat_long1[1]},#{lat_long1[0]}?key=4761fe29bfc618&overview=false&steps=true")
p drive["routes"][0]["steps"]
