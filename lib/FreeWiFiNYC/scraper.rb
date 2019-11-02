# require './cli'
# require './FreeWiFiNYC'

class Scraper

  puts "Scraper Class"

  attr_accessor :data, :zip_codes, :find_wifi_input, :borough, :boro_code, :all_nyc_zips

  def test
    puts "Scraper Test"
  end

  def self.scrape_data
    @all_nyc_zips = []
    @zip_codes = []

    parsed_data = Nokogiri::HTML(open("https://data.cityofnewyork.us/resource/yjub-udmw.json?$offset=0&$limit=5000"))
    zips_nyc_data = Nokogiri::HTML(open("http://www.city-data.com/zipmaps/New-York-New-York.html"))

    @data = JSON.parse(parsed_data)
    @all_nyc_zips = zips_nyc_data.css("div.zip-codes a").text.scan(/\d{5}/)

    zips
  end

  def zzzz
    zippers = #{Bronx =>
            {"Central Bronx" =>	[10453, 10457, 10460],
            "Bronx Park and Fordham" =>	[10458, 10467, 10468],
            "High Bridge and Morrisania" =>	[10451, 10452, 10456],
            "Hunts Point and Mott Haven" => [10454, 10455, 10459, 10474],
            "Kingsbridge and Riverdale" => [10463, 10471],
            "Northeast Bronx" => [10466, 10469, 10470, 10475],
            "Southeast Bronx" => 	[10461, 10462,10464, 10465, 10472, 10473]},

              #{Brooklyn =>
            {"Central Brooklyn" => [11212, 11213, 11216, 11233, 11238],
            "Southwest Brooklyn" => [11209, 11214, 11228],
            "Borough Park" => [11204, 11218, 11219, 11230],
            "Canarsie and Flatlands" => [11234, 11236, 11239],
            "Southern Brooklyn" => [11223, 11224, 11229, 11235],
            "Northwest Brooklyn" => [11201, 11205, 11215, 11217, 11231],
            "Flatbush" => [11203, 11210, 11225, 11226],
            "East New York and New Lots" => [11207, 11208],
            "Greenpoint" => [11211, 11222],
            "Sunset Park" => [11220, 11232],
            "Bushwick and Williamsburg" => [11206, 11221, 11237]}
            }
  end

  def self.zips
    # @data.each do |each_entry|
    Scraper.all_data.each do |each_entry|
        @zip_codes << each_entry["zip"] unless @zip_codes.include?(each_entry["zip"])
      end
        @zip_codes.sort
  end

  def self.all_data
    @data
  end

end
