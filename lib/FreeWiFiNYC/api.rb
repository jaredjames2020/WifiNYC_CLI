class Api

  #attr_accessor :borough_name, :neighborhood_name

  def self.neighborhood
    puts "This is a list of the Wifi locations by neighborhood in #{Cli.borough_name}.\n"
    neighborhood_array = []
    Scraper.all_data.each do |each_entry|
      if each_entry["boroname"] == Cli.borough_name
          neighborhood_list = "#{each_entry["ntaname"]} - #{each_entry["location_t"]} - #{each_entry["location"]}"
          neighborhood_array << neighborhood_list unless neighborhood_array.include?(neighborhood_list)
        end #if
    end #do
    puts neighborhood_array.sort
    Cli.search_again_met
  end

  def self.zip_code
    puts "\nSearching for WiFi in zip code: #{Cli.find_wifi_input}\n\n"
    puts "\n.\n"
    puts "..."
    puts "....."
    puts "......."
    puts "........."
    puts "\n"
    puts "You can find free WiFi at the following locations: \n"
    zip_array = []

    Scraper.all_data.each do |each_entry|
      if each_entry["zip"] == Cli.find_wifi_input
        zip_list = "#{each_entry["ntaname"]} - #{each_entry["location_t"]} - #{each_entry["location"]}"
        zip_array << zip_list unless zip_array.include?(zip_list)
      end #if
    end #do
      puts zip_array.sort
      Cli.search_again_met
  end

  def self.neighborhood_list
    puts "Please select a #{@borough} neighborhood."
    neighborhood_array = []
    neighboorhood_hash = Hash.new
    Scraper.all_data.each do |each_entry|
      if each_entry["boroname"] == Cli.borough_name
      neighborhood_list = "#{each_entry["ntaname"]}"
      neighborhood_array << neighborhood_list unless neighborhood_array.include?(neighborhood_list)
      end #if
    end #do
      neighborhood_array.sort.each.with_index(1) do |neighborhood,i|
      puts "#{i} - #{neighborhood}"
      neighboorhood_hash[i] = neighborhood
      end #do
    puts "\nPlease select a neighborhood to search."
      neighborhood_search = gets.chomp.upcase
    Scraper.all_data.each do |each_entry|
      neighborhood_list_array = []
      if each_entry["ntaname"] == neighboorhood_hash[neighborhood_search.to_i]
        neighborhood_list = "#{each_entry["ntaname"]} - #{each_entry["location_t"]} - #{each_entry["location"]}"
        neighborhood_list_array << neighborhood_list unless neighborhood_list_array.include?(neighborhood_list)
        end#if
        puts neighborhood_list_array.sort
    end #do
    Cli.search_again_met
  end#method

end
