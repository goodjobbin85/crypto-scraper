require 'nokogiri' 
require 'open-uri' 
require 'pry' 

require_relative './cryptocurrency.rb' 

class Scraper 
    def get_page 
        link = "https://coinmarketcap.com/all/views/all/"
        page = Nokogiri::HTML(URI.open(link)) 

        rank = page.css(".cmc-table-row")[0].css(".cmc-table__cell--sort-by__rank").text
        name = page.css(".cmc-table-row")[0].css(".cmc-table__cell--sort-by__name").text
        price = page.css(".cmc-table-row")[0].css(".cmc-table__cell--sort-by__price").text 
        volume = page.css(".cmc-table-row")[0].css(".cmc-table__cell--sort-by__volume-24-h").text
        percent_change_1_hr = page.css(".cmc-table-row")[0].css(".cmc-table__cell--sort-by__percent-change-1-h").text
        percent_change_24_hr = page.css(".cmc-table-row")[0].css(".cmc-table__cell--sort-by__percent-change-24-h").text
        percent_change_7_d = page.css(".cmc-table-row")[0].css(".cmc-table__cell--sort-by__percent-change-7-d").text

        binding.pry 

    end 
end 

Scraper.new.get_page