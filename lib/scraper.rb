class Scraper
    CHARACTER_URL = "https://disney.fandom.com/wiki/Category:Star_Wars_characters"

    RELATIVE_URL = "https://disney.fandom.com"


    def self.scrape_characters
        # open web page with open uri
        html = open(CHARACTER_URL)
        # use nokogiri to translate the page into nokogiri nodes
        doc = Nokogiri::HTML(html)
        # select the nodes that we want
        doc.css("li.category-page__member").each do | character |
            
            name = character.css('a').text.strip
            url = character.css('a').attr('href').value
            Character.new(name, url)
        end
        # loop through the lis that we found and create objects from the LIs


    end




    def self.scrape_character_details(character)
        html = open(RELATIVE_URL+character.url)
        # use nokogiri to translate the page into nokogiri nodes
        doc = Nokogiri::HTML(html)
        character.alias = doc.css("div[data-source='alias']").text
        character.personality = doc.css("div[data-source='personality']").text
        character.occupation = doc.css("div[data-source='occupation']").text
        character.alignment = doc.css("div[data-source='alignment']").text
        character.affiliations = doc.css("div[data-source='affiliations']").text
        character.goal = doc.css("div[data-source='goal']").text
        character.home = doc.css("div[data-source='home']").text
        character.family = doc.css("div[data-source='family']").text

    end




end



