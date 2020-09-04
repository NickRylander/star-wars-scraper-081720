class CLI
    def run
        puts "Welcome to the Star Wars Character Database!"
        puts "Please choose a character to see more information:"
        Scraper.scrape_characters
        list_characters
        menu
    end

    def list_characters
        Character.all.each.with_index(1) do | character, i |
            puts "#{i}. #{character.name}"
        end
    end

    def menu
        puts "Please select a number to get the details."
        input = gets.chomp
        if !input.to_i.between?(1, Character.all.count)
            puts "Character not found. Please select a different character!"
            list_characters
            menu
        else
            character = Character.all[input.to_i-1]
            display_character_details(character)
        end
        puts "Would you like to see another character?"
        puts "Please enter Y or N"
        another_character = gets.strip.downcase
        if another_character == "y"
            list_characters
            menu
        elsif another_character == "n"
            puts "Do or do not. There is no try."
            exit
        else
            puts "Darth Varder ate your answer. Please try again."
            list_characters
            menu
        end
    end

    def display_character_details(character)
        Scraper.scrape_character_details(character)
        puts "Here are the details for #{character.name}:"
        puts "#{character.alias}"
        puts "#{character.personality}"
        puts "#{character.occupation}"
        puts "#{character.alignment}"
        puts "#{character.affiliations}"
        puts "#{character.goal}"
        puts "#{character.home}"
        puts "#{character.family}"
    end
end
