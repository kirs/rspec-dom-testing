require 'spec_helper'

RSpec.describe RSpecDomTesting::Matchers::SelectorMatcher do
  context "with simple tags" do
    subject { %Q{<div id="1"></div><div id="2"></div>} }

    it { is_expected.to have_css_selector('div') }
    it { is_expected.not_to have_css_selector('p') }
  end

  context "tags with content" do
    subject { %Q{<title id="1">Welcome</title>} }

    it { is_expected.to have_css_selector('title', 'Welcome') }
    it { is_expected.not_to have_css_selector('title', 'well') }
  end

  context "with nested tags" do
    context "with one nested tag" do
      subject { %Q{<div id="1"><p id="2"></p></div>} }

      it "finds" do
        expect(subject).to have_css_selector("div") do |el|
          expect(el).to have_css_selector("p")
          expect(el).not_to have_css_selector("p", minimum: 2)
        end
      end
    end

    context "with two nested tags" do
      subject { %Q{<div id="1"><p id="2"></p><p id="2"></p></div>} }

      it "finds" do
        expect(subject).to have_css_selector("div") do |el|
          expect(el).to have_css_selector("p", minimum: 2)
        end
      end
    end
  end

  context "with ActionController::TestResponse" do
    let(:fake_response) {
      OpenStruct.new.tap do |s|
        s.status = 200
        s.body = %Q{<div id="1"><p id="2"></p><p id="2"></p></div>}
        s.headers = {}
      end
    }
    let(:response) { ActionController::TestResponse.from_response(fake_response) }

    it "works with response" do
      expect(response).to have_css_selector("div") do |el|
        expect(el).to have_css_selector("p", minimum: 2)
      end
    end
  end
end
