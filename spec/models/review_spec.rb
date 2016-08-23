require 'rails_helper'
require 'geocoder'
require "geocoder/railtie"
Geocoder::Railtie.insert
RSpec.describe Review, type: :model do
  
  it "has a valid factory" do
    assert FactoryGirl.create(:review).valid?
  end

  it "has none to begin with" do
    expect(Review.count).to eq 0
  end

  it "has one after adding one" do
    review = FactoryGirl.create(:review)
    expect(review.save!).to eq true
  end
end
