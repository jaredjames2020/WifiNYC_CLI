
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "FreeWiFiNYC/version"

Gem::Specification.new do |spec|
  spec.name          = "FreeWiFiNYC"
  spec.version       = FreeWiFiNYC::VERSION
  spec.authors       = ["jaredjames2020"]
  spec.email         = ["jaredjames2020@gmail.com"]

  spec.summary       = %q{Write a short summary, because RubyGems requires one.}
  spec.description   = %q{Write a longer description or delete this line.}
  spec.homepage      = "https://github.com/jaredjames2020/FreeWiFiNYC"
  spec.license       = "MIT"

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib", "FreeWiFiNYC/cli", "FreeWiFiNYC/scraper", "FreeWiFiNYC/FreeWiFiNYC", "FreeWiFiNYC/api"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
end
