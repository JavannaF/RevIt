require "rails_helper"

RSpec.describe "owner management", :type => :request do
  
  it "after signup redirect to the home page" do
    visit "/signupowners"
    #dev = FactoryGirl.create(:owner)
    fill_in "Name", :with => "Matteo"
    fill_in "Website" , :with => "www.ok.it"
    fill_in "Description", :with => "siamo aperti"
    fill_in "Address" , :with => "velletri"
    fill_in "Email", :with => "mhfdgdj@gmail.com"
    fill_in "Password", :with => "muromuro"
    fill_in "Confirmation", :with => "muromuro"
    click_button "Create my account"

    expect(current_path).to eq (root_path)
    #expect(page).to have_content "Now let's set up your skills"
    #expect(page).to have_css("h1", text: "Now let's set up your skills")
    
  end
  
  it "invalid signup (name too long)" do
    visit "/signupowners"
    #dev = FactoryGirl.create(:owner)
    fill_in "Name", :with => "Maaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
    fill_in "Website" , :with => "www.ok.it"
    fill_in "Description", :with => "siamo aperti"
    fill_in "Address" , :with => "velletri"
    fill_in "Email", :with => "mhfdgdj@gmail.com"
    fill_in "Password", :with => "muromuro"
    fill_in "Confirmation", :with => "muromuro"
    click_button "Create my account"

    expect(current_path).to eq "/owners"
    
    #expect(page).to have_css("h1", text: "Now let's set up your skills")
    
  end
  

    
  
  
  
  
  
  
  it "invalid signup (Password confirmation doesn't match Password)" do
    visit "signupowners"
    #dev = FactoryGirl.create(:owner)
    fill_in "Name", :with => "matteo"
    fill_in "Website" , :with => "www.ok.it"
    fill_in "Description", :with => "siamo aperti"
    fill_in "Address" , :with => "velletri"
    fill_in "Email", :with => "mhfdgdj@gmail.com"
    fill_in "Password", :with => "muromuro"
    fill_in "Confirmation", :with => "muromuroo"
    click_button "Create my account"
    expect(current_path).to eq "/owners"

    
  end
  
  it "logout -> signin, login -> home " do
    visit "/signupowners"
    #dev = FactoryGirl.create(:owner)
    fill_in "Name", :with => "Matteo"
    fill_in "Website" , :with => "www.ok.it"
    fill_in "Description", :with => "siamo aperti"
    fill_in "Address" , :with => "velletri"
    fill_in "Email", :with => "mhfdgdj@gmail.com"
    fill_in "Password", :with => "muromuro"
    fill_in "Confirmation", :with => "muromuro"
    click_button "Create my account"
    
    
    delete "/logoutowners"
    expect(current_path).to eq(root_path)
    
    visit "/loginowners"
    fill_in "Email", :with => "mhfdgdj@gmail.com"
    fill_in "Password", :with => "muromuro"
    click_button "Log in"

    expect(current_path).to eq(root_path)
  end

end