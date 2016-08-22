require 'rails_helper'
require 'geocoder'
require "geocoder/railtie"
Geocoder::Railtie.insert

RSpec.describe Owner, type: :model do
 

  it "has a valid factory" do
    assert FactoryGirl.create(:user).valid?
  end
  
  it "has none to begin with" do
    expect(Owner.count).to eq 0
  end

  it "has one after adding one" do
    owner = FactoryGirl.create(:owner)
    expect(owner.save!).to eq true
  end
  
  it "Password too short" do
    owner = FactoryGirl.build(:owner, 
                 password: "dude", password_confirmation: "dude")
    expect(owner.valid?).to eq false
  end
  
  it "Username too long" do
    owner = FactoryGirl.build(:owner, name: ""*81)
    expect(owner.valid?).to eq false
  end

  it "Invalid email" do
    owner =FactoryGirl.build(:owner, email: "invalid")
    expect(owner.valid?).to eq false
  end
  
  it "Email uniqness" do
    owner = FactoryGirl.create(:owner) 
    owner.save!
    owner2 = FactoryGirl.create(:owner) 
    owner2.email = owner.email
    expect(owner2.valid?).to eq false
  end
  
  it "email validation should accept valid addresses" do
    @owner = FactoryGirl.create(:owner) 
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @owner.email = valid_address
      assert @owner.valid?, "#{valid_address.inspect} should be valid"
    end
  end
  
  
  it "is invalid without a username" do
    assert !FactoryGirl.build(:owner, name: nil).valid?
  end
  
  it "is invalid without a email" do
    assert !FactoryGirl.build(:owner, email: nil).valid?
  end
  
  it "is invalid without a password" do
    assert !FactoryGirl.build(:owner, password: nil).valid?
  end
  
  it "is invalid without a password_confirmation" do
    assert !FactoryGirl.build(:owner, password_confirmation: nil).valid?
  end
  
    
end
