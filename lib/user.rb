class User 
    attr_accessor :name, :coins, :email, :password, :balance 

    @@all = [] 

    def initialize(name, coins=[], email, password, balance)  
        @name = name 
        @coins = coins 
        @email = email 
        @password = password 
        @balance = balance 
    end  

    def self.all 
        @@all 
    end 

    def coins
        @coins ? @coins : puts "No coins acquired yet! Let's get started!"
    end 

    def list_coins 

    end 

    def add_coin(coin) 

    end 

    def remove_coin(coin) 

    end 

    def add_funds(amount) 

    end 
end 