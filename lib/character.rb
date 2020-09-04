class Character
    @@all = []

    attr_accessor :name, :url, :alias, :personality, :occupation, :alignment, :affiliations, :goal, :home, :family

    def initialize(name, url)
        self.name = name
        self.url = url
        @@all << self
    end

    def self.all
        @@all
    end








end