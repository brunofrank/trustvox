
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "trustvox/version"

Gem::Specification.new do |spec|
  spec.name          = "trustvox"
  spec.version       = Trustvox::VERSION
  spec.authors       = ["Bruno Frank"]
  spec.email         = ["bfscordeiro@gmail.com"]

  spec.summary       = %q{Gem for Trustvox API access.}
  spec.description   = %q{This gem is used to acess the Trustvox api, create stores, send orders and etc.}
  spec.homepage      = "https://github.com/brunofrank/trustvox"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.7"
  spec.add_development_dependency "faker", "~> 1.8.7"
  spec.add_development_dependency "dotenv"
  spec.add_runtime_dependency "httparty", "~> 0.16"
end
