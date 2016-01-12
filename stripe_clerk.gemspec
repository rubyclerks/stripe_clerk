$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "stripe_clerk/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "stripe_clerk"
  s.version     = StripeClerk::VERSION
  s.authors     = ["Basia Klosowska, Anna Góra","Torsten Ruger"]
  s.email       = ["barbaraklosowska@gmail.com" , "torsten@villtaika.fi"]
  s.homepage    = "https://github.com/rubyclerks/stripe_clerk"
  s.summary     = "Stripe Payment method for office_clerk ecommerce system."
  s.description = s.summary
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "office_clerk" , "~> 1.0.0"
  s.add_dependency "stripe"
end
