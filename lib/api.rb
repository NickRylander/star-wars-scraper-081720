class API

    def self.scrape_characters
        resp = RestClient.get('https://swapi.dev/api/people/')
        binding.pry
        starwars_hash = JSON.parse(resp.body, symbolize_names:true)
        binding.pry
        starwars_arr = starwars_hash[:results]
        binding.pry
        starwars_arr.collect do | person |
            binding.pry
            Character.new(person)
        end
    end


    def self.scrape_character_details(character)
        resp = RestClient.get(character.url)
        char_hash = JSON.parse(resp.body, symbolize_names:true)
        character.height = char_hash[:height]
        character.mass = char_hash[:mass]
        character.hair_color = char_hash[:hair_color]
        character.skin_color = char_hash[:skin_color]
        character.eye_color = char_hash[:eye_color]
    end


end



