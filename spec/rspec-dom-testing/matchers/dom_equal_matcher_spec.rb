require 'spec_helper'

RSpec.describe RSpecDomTesting::Matchers::DomEqualMatcher do
  it "asserts equal" do
    attributes = %{<a b="hello" c="hello"></a>}
    reverse_attributes = %{<a c="hello" b="hello"></a>}
    expect(attributes).to be_dom_equal(reverse_attributes)
  end

  it "asserts not equal" do
    expect('<a></a>').not_to be_dom_equal('<b></b>')
  end
end
