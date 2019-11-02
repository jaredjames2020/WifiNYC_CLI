require_relative "cli.rb"
require_relative "scraper.rb"
require_relative "api.rb"

require 'open-uri'
require 'nokogiri'
require 'json'
require 'pry'

class FreeWiFiNYC

  def initialize #self.program_exec
    Cli.call
  end
end

FreeWiFiNYC.new#program_exec
