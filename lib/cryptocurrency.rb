class Cryptocurrency 
    attr_accessor :rank, :name, :symbol, :market_cap, :price, :circulating_supply, 
                  :volume, :seven_day_shift 

    @@all = [] 

    def initialize 
        @@all << self 
    end 

    def self.all 
        @@all 
    end 

    def self.reset 
        @@all.clear 
    end 
    
end 