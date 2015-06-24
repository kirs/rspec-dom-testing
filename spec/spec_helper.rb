require 'rspec-dom-testing'
require 'pry'

RSpec.configure do |config|
  config.include RSpecDomTesting::Matchers
end
