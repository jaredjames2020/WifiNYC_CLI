require_relative "cli.rb"
require_relative "scraper.rb"
require_relative "api.rb"

require 'open-uri'
require 'nokogiri'
require 'json'
require 'pry'

class WifiNYC

  def call #self.program_exec
    Cli.call
  end
end

# WifiNYC.new.call#program_exec
