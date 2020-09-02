class Character
    @@all = []

    attr_accessor :name, :url, :height, :mass, :hair_color, :skin_color, :eye_color

    def initialize(person)
        self.name = person[:name]
        self.url = person[:url]
        @@all << self
    end

    def self.all
        @@all
    end


end