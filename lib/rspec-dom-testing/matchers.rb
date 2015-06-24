require 'action_controller'
require 'action_controller/test_case'

require 'rspec-dom-testing/matchers/dom_equal_matcher'
require 'rspec-dom-testing/matchers/selector_matcher'

module RSpecDomTesting
  module Matchers
    def have_css_selector(*args)
      SelectorMatcher.new(*args)
    end

    def be_dom_equal(*args)
      DomEqualMatcher.new(*args)
    end
  end
end
