require 'nokogiri' 
require 'open-uri' 
require 'pry' 

require_relative './cryptocurrency.rb' 

class PageFormatError < StandardError
end 

class ParseError < StandardError
end 

class Scraper
    attr_accessor :url, :page, :coin_list

    def initialize(url = "https://coinmarketcap.com/all/views/all/")
        @url = url
        @page = Nokogiri::HTML(URI.open(url)) 
        @coin_list = [] 
        get_coins
    end

    private 

    def get_coins 
        @page.css(".cmc-table-row").each do |coin|
            coin_list << Cryptocurrency.new(parse(coin))
        end 
    end 

    def validate_value(str) 
        str.empty? ? "No value" : str
    end 

    def parse(nokogiri_coin) 
        coin = {}
        coin[:rank] = validate_value(nokogiri_coin.css(".cmc-table__cell--sort-by__rank").text)
        coin[:name] = nokogiri_coin.css(".cmc-table__cell--sort-by__name").text 
        coin[:price] = nokogiri_coin.css(".cmc-table__cell--sort-by__price").text 
        coin[:volume] = nokogiri_coin.css(".cmc-table__cell--sort-by__volume-24-h").text 
        coin[:percent_change_1_hr] = nokogiri_coin.css(".cmc-table__cell--sort-by__percent-change-1-h").text  
        coin[:percent_change_24_hr] = nokogiri_coin.css(".cmc-table__cell--sort-by__percent-change-24-h").text 
        coin[:percent_change_7_d] = nokogiri_coin.css(".cmc-table__cell--sort-by__percent-change-7-d").text 
        coin
    end 
    
end 


scraper = Scraper.new
puts scraper.coin_list
puts Cryptocurrency.all.count 
Cryptocurrency.print_list