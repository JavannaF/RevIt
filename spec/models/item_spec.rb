require 'rails_helper'
require 'carrierwave'
require 'mini_magick'
require 'carrierwave/orm/activerecord'
RSpec.describe Item, type: :model do
  it "has a valid factory" do
    assert FactoryGirl.create(:item).valid?
  end

  it "has none to begin with" do
    expect(Item.count).to eq 0
  end

  it "has one after adding one" do
    item = FactoryGirl.create(:item)
    expect(item.save!).to eq true
  end
end
