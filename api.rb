require_relative 'character'
require 'rest-client'
require 'json'
require 'pry'




resp = RestClient.get('https://swapi.dev/api/people/')
starwars_hash = JSON.parse(resp.body, symbolize_names:true)
starwars_arr = starwars_hash[:results]

starwars_characters = starwars_arr.collect do | person |
    Character.new(person)
end


starwars_characters.each do | char |
    resp = RestClient.get(char.url)
    char_hash = JSON.parse(resp.body, symbolize_names:true)
    binding.pry
    char.height = char_hash[:height]
    char.mass = char_hash[:mass]
    char.hair_color = char_hash[:hair_color]
    char.skin_color = char_hash[:skin_color]
    char.eye_color = char_hash[:eye_color]
end



binding.pry




