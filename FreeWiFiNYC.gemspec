
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "FreeWiFiNYC/version"

Gem::Specification.new do |spec|
  spec.name          = "FreeWiFiNYC"
  spec.version       = FreeWiFiNYC::VERSION
  spec.authors       = ["jaredjames2020"]
  spec.email         = ["jaredjames2020@gmail.com"]

  spec.summary       = %q{Finding free WiFi in New York City has never been easier.
                          Search for WiFi locations in any New York City neighborhood near you.}
  spec.description   = %q{Accessing the internet in New York City is now easier than ever.
                          Free public WiFi can be found throughout New York City
                          in places like subway stations, neighborhood kiosks,
                          hotels, cafés, libraries, restaurants, shops, and many
                          more places. In an effort to help both locals and visitors
                          stay connected, you can use this search tool to find WiFi
                          locations in any New York City neighborhood near you. }
  spec.homepage      = "https://github.com/jaredjames2020/FreeWiFiNYC"
  spec.license       = "MIT"

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.executables << "freewifinyc"
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
end
