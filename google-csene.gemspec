lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'google/csene/version'

Gem::Specification.new do |spec|
  spec.name          = "google-csene"
  spec.version       = Google::Csene::VERSION
  spec.authors       = ['Hirofumi Wakasugi']
  spec.email         = ["komagata@gmail.com"]

  spec.summary       = %q{Easy to get some Google CSE results including search ranks and index count.}
  spec.description   = %q{Easy to get some Google CSE results including search ranks and index count.}
  spec.homepage      = "https://github.com/5t111111/google-csene"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "google-api-client", "~> 0.8.6"
  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
end
