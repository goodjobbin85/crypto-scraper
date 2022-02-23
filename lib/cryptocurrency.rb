require 'pry'

class Cryptocurrency 
    attr_accessor :rank, :name, :price, :volume, :percent_change_1_hr, 
        :percent_change_24_hr, :percent_change_7_d 

    @@all = []

    def initialize(coin) 
            @rank = coin[:rank]
            @name = coin[:name]
            @price = coin[:price]
            @volume = coin[:volume]
            @percent_change_1_hr = coin[:percent_change_1_hr]
            @percent_change_24_hr = coin[:percent_change_24_hr]
            @percent_change_7_d = coin[:percent_change_7_d] 

            @@all << self
    end 

    def self.all 
        @@all
    end 

    def self.print_list 
        self.all.each do |coin| 
            puts "Rank: #{coin.rank}"
            puts "Name: #{coin.name}" 
            puts "Price: #{coin.price}" 
            puts "Volume: #{coin.volume}" 
            puts "1 Hour % Change: #{coin.percent_change_1_hr}" 
            puts "24 Hour % Change: #{coin.percent_change_24_hr}" 
            puts "7 Day % Change: #{coin.percent_change_7_d}"
        end 
    end 
end 

