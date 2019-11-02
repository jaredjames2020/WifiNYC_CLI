# require "FreeWiFiNYC/version"
# require 'nokogiri'
# require 'open-uri'
# require 'json'
# require 'pry'
#
# module FreeWiFiNYC
#
#   attr_accessor :data, :zip_codes, :find_wifi_input, :borough, :boro_code, :all_nyc_zips
#
#   def self.initialize
#     @all_nyc_zips = []
#     @zip_codes = []
#
#     parsed_data = Nokogiri::HTML(open("https://data.cityofnewyork.us/resource/yjub-udmw.json?$offset=0&$limit=5000"))
#     zips_nyc_data = Nokogiri::HTML(open("http://www.city-data.com/zipmaps/New-York-New-York.html"))
#
#     @data = JSON.parse(parsed_data)
#     @all_nyc_zips = zips_nyc_data.css("div.zip-codes a").text.scan(/\d{5}/)
#
#     self.zips
#     self.welcome
#     self.find_wifi
#   end
#
#   def self.zips
#     @data.each do |each_entry|
#         @zip_codes << each_entry["zip"] unless @zip_codes.include?(each_entry["zip"])
#       end
#         @zip_codes.sort
#   end
#
#   def self.welcome
#     puts "Hello, I can help you find free Wi-Fi. You can search by zip code or neighborhood."
#   end
#
#   def self.find_wifi
#     puts "Please enter a zip code or type 'help' to search by neighborhood or type 'exit':"
#     @find_wifi_input = gets.chomp.upcase
#
#     if @find_wifi_input == "HELP"
#       borough
#     elsif @zip_codes.include?(@find_wifi_input)
#       zip_code_input
#     elsif @find_wifi_input == "EXIT"
#       return puts "Thanks for using Search Free Wi-Fi NYC. Goodbye!"
#     elsif @find_wifi_input.length != 5
#       puts "Invalid entry. Please enter a 5 digit NYC zip code."
#       find_wifi
#     else
#       @all_nyc_zips.include?(@find_wifi_input) ?
#       (puts "Sorry there is no free wifi in this area of NYC.\nType 'help' to search by neighborhood.")
#       : (puts "Invalid entry. Type 'help' to search by neighborhood.")
#       find_wifi
#     end
#   end
#
#   def self.help
#     puts "Enter 1 for list of neighborhoods. Enter 2 for list of location types."
#     help_num = gets.chomp
#       if help_num == "1"
#         borough
#       elsif help_num == "2"
#         location_type
#       else
#         help
#       end
#   end
#
#   def self.neighborhood
#     puts "This is a list of the Wifi locations by neighborhood in #{@borough}.\n"
#     neighborhood_array = []
#
#     @data.each do |each_entry|
#       if each_entry["boroname"] == @borough
#           neighborhood_list = "#{each_entry["ntaname"]} - #{each_entry["location_t"]} - #{each_entry["location"]}"
#           neighborhood_array << neighborhood_list unless neighborhood_array.include?(neighborhood_list)
#         end
#     end
#     puts neighborhood_array.sort
#     puts "\nWould you like to search again? Type 'Yes' or 'No'."
#     search_again = gets.chomp.upcase
#       if search_again == "YES"
#         find_wifi
#       else
#         return puts "\nThanks for using Search Free Wi-Fi NYC. Goodbye!\n"
#     end
#   end
#
#   def self.zip_code_input
#     puts "\nSearching for WiFi in zip code: #{@find_wifi_input}\n\n"
#     puts "You can find free WiFi at the following locations:"
#     zip_array = []
#
#     @data.each do |each_entry|
#       if each_entry["zip"] == @find_wifi_input
#         zip_list = "#{each_entry["ntaname"]} - #{each_entry["location_t"]} - #{each_entry["location"]}"
#         zip_array << zip_list unless zip_array.include?(zip_list)
#         end
#       end
#       puts zip_array.sort
#       puts "\nWould you like to search again? Type 'Yes' or 'No'."
#       search_again = gets.chomp.upcase
#       if search_again == "YES"
#         find_wifi
#       else
#         return puts "Thanks for using Search Free Wi-Fi NYC. Goodbye!"
#       end
#   end
#
#   def self.borough
#     puts "Please select a borough to begin your search."
#     puts "
#     1 - Bronx
#     2 - Brooklyn
#     3 - Manhattan
#     4 - Queens
#     5 - Staten Island
#     "
#     puts "Enter a number: "
#     borough = gets.chomp.upcase
#     case borough
#     when "1"
#       puts "Bronx"
#       @borough = "Bronx"
#       neighborhood_list
#     when "2"
#       puts "Brooklyn"
#       @borough = "Brooklyn"
#       neighborhood_list
#     when "3"
#       puts "Manhattan"
#       @borough = "Manhattan"
#       neighborhood_list
#     when "4"
#       puts "Queens"
#       @borough = "Queens"
#       neighborhood_list
#     when "5"
#       puts "Staten Island"
#       @borough = "Staten Island"
#       neighborhood_list
#     when "EXIT"
#       find_wifi
#     else
#       puts "Enter a number 1-5 or type 'exit'.\n"
#       find_wifi
#     end
#
#   end
#
#   def self.neighborhood_list
#   puts "Please select a #{@borough} neighborhood."
#   neighborhood_array = []
#   neighboorhood_hash = Hash.new
#   @data.each do |each_entry|
#     if each_entry["boroname"] == @borough
#       neighborhood_list = "#{each_entry["ntaname"]}"
#       neighborhood_array << neighborhood_list unless neighborhood_array.include?(neighborhood_list)
#       end #if
#     end #do PROBABLY GOING TO HAVE TO END THIS DO LOOP IF FAILED
#     neighborhood_array.sort.each.with_index(1) do |neighborhood,i|
#       puts "#{i} - #{neighborhood}"
#       neighboorhood_hash[i] = neighborhood
#       end #do
#     puts "\nPlease select a neighborhood to search."
#       search_again = gets.chomp.upcase
#     @data.each do |each_entry|
#       neighborhood_list_array = []
#       if each_entry["ntaname"] == neighboorhood_hash[search_again.to_i]
#         neighborhood_list = "#{each_entry["ntaname"]} - #{each_entry["location_t"]} - #{each_entry["location"]}"
#         neighborhood_list_array << neighborhood_list unless neighborhood_list_array.include?(neighborhood_list)
#         end#if
#         puts neighborhood_list_array.sort
#     end #do
#     puts "\nWould you like to search again? Type 'Yes' or 'No'."
#       search_again = gets.chomp.upcase
#       if search_again == "YES"
#         find_wifi
#       else
#         return puts "Thanks for using Search Free Wi-Fi NYC. Goodbye!"
#       end#if
#   end#method
#
#
# end#module
