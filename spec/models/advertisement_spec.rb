require 'rails_helper'

RSpec.describe Advertisement, type: :model do
  let (:advertisement) { Advertisement.create!(title: "Advertisement Title", body: "Advertisement body", price: 10) }
  describe "attributes" do
    it "has title attribute" do
      expect(advertisement).to have_attributes(title: "Advertisement Title")
    end
    it "has body attribute" do
      expect(advertisement).to have_attributes(body: "Advertisement body")
    end
    it "has price attribute" do
      expect(advertisement).to have_attributes(price: 10)
    end
  end

end
