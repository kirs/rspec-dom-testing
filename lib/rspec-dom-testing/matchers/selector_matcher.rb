require 'nokogiri'
require 'rails/dom/testing/assertions/selector_assertions'

module RSpecDomTesting
  module Matchers
    class SelectorMatcher
      include Rails::Dom::Testing::Assertions::SelectorAssertions

      def matches?(*args, &block)
        @selected ||= nil

        subject = args.first
        root = case subject
        when Nokogiri::XML::NodeSet
          subject
        when String
          Nokogiri::HTML::Document.parse(subject).root
        when ActionController::TestResponse
          Nokogiri::HTML::Document.parse(subject.body).root
        end

        selector = HTMLSelector.new(@context, @selected) { nodeset(root) }

        if selecting_no_body?(selector)
          return true
        end

        selector.select.tap do |matches|
          return false unless check_size(matches.size, selector.tests, selector.selector, selector.message)

          nest_selection(matches, &block) if block_given? && !matches.empty?
        end

        true
      end

      def check_size(size, equals, css_selector, message = nil)
        min, max, count = equals[:minimum], equals[:maximum], equals[:count]

        # message ||= %(Expected #{count_description(min, max, count)} matching "#{css_selector}", found #{size}.)
        if count
          count == size
        else
          return size >= min if min
          return size <= max if max
        end
      end

      def failure_message
        "fucked up"
        # "change #{@change_details.message} #{@relativity.to_s.gsub("_", " ")} #{description_of @expected_delta}"
      end

      def description
        "have selector"
      end

      def initialize(*args)
        @context = *args
      end
    end
  end
end
