require 'rails/dom/testing/assertions/dom_assertions'

module RSpecDomTesting
  module Matchers
    class DomEqualMatcher
      include Rails::Dom::Testing::Assertions::DomAssertions

      def matches?(actual)
        expected_dom, actual_dom = fragment(@expected), fragment(actual)
        compare_doms(expected_dom, actual_dom)
      end

      def failure_message
        # "Expected: #{expected}\nActual: #{actual}"
        # "change #{@change_details.message} #{@relativity.to_s.gsub("_", " ")} #{description_of @expected_delta}"
      end

      def initialize(expected)
        @expected = expected
      end
    end
  end
end
