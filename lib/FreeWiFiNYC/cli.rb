class Cli

  puts "Cli Class"

    def self.call
      Scraper.scrape_data
      welcome
      find_wifi
    end

    def self.welcome
      puts "\nHello, I can help you find free Wi-Fi. You can search by zip code or neighborhood.\n"
    end

    def self.goodbye
      puts "Thanks for using Search Free Wi-Fi NYC. Goodbye!"
    end

    def self.find_wifi
      puts "Please enter a zip code or type 'help' to search by neighborhood or type 'exit':"
      @find_wifi_input = gets.chomp.upcase

      if @find_wifi_input == "HELP"
        borough_selector
      # elsif @zip_codes.include?(@find_wifi_input)
      # elsif Scraper.zips.include?(@find_wifi_input)
    elsif Scraper.zipcode_hardcode.include?(@find_wifi_input)
        Api.zip_code
      elsif @find_wifi_input == "EXIT"
        return goodbye
      elsif @find_wifi_input.length != 5
        puts "Invalid entry. Please enter a 5 digit NYC zip code."
        find_wifi
      else
        Scraper.zips.include?(@find_wifi_input) ?
        (puts "Sorry there is no free wifi in this area of NYC.\nType 'help' to search by neighborhood.")
        : (puts "Invalid entry. Type 'help' to search by neighborhood.")
        find_wifi
      end
    end

    def self.find_wifi_input
      @find_wifi_input
    end

    def self.help
      puts "Enter 1 for list of neighborhoods. Enter 2 for list of location types."
      help_num = gets.chomp
        if help_num == "1"
          borough
        elsif help_num == "2"
          location_type
        else
          help
        end
    end

    def self.search_again_met
      puts "\nWould you like to search again? Type 'Yes' or 'No'."
      search_again = gets.chomp.upcase
      if search_again == "YES" || search_again == "Y"
        find_wifi
      elsif search_again == "NO" || search_again == "N"
        return goodbye
      else
        puts "Please type 'Yes' or 'No'."
        search_again_met
      end
    end

    def self.borough_selector
      puts "Please select a borough to begin your search."
      puts "
      1 - Bronx
      2 - Brooklyn
      3 - Manhattan
      4 - Queens
      5 - Staten Island
      "
      puts "Enter a number: \n"
      borough_assigner
    end

    def self.borough_assigner
      borough = gets.chomp.upcase
      case borough
        when "1"
          puts "Bronx"
          @borough = "Bronx"
          Api.neighborhood_list
        when "2"
          puts "Brooklyn"
          @borough = "Brooklyn"
          Api.neighborhood_list
        when "3"
          puts "Manhattan"
          @borough = "Manhattan"
          Api.neighborhood_list
        when "4"
          puts "Queens"
          @borough = "Queens"
          Api.neighborhood_list
        when "5"
          puts "Staten Island"
          @borough = "Staten Island"
          Api.neighborhood_list
        when "EXIT"
          find_wifi
        else
          puts "Invalid entry. Enter a number 1-5 or type 'exit'.\n"
          puts "
          1 - Bronx
          2 - Brooklyn
          3 - Manhattan
          4 - Queens
          5 - Staten Island
          "
          borough_assigner
        end
    end

    def self.borough_name
      @borough
    end

end
