require 'rails_helper'
require 'omniauth'
require 'omniauth-facebook'
RSpec.describe UsersController, type: :controller do
   before :each do
     @user = FactoryGirl.create(:user)
     sign_in @user
   end
   
   it "should show user" do
     get :show, :id => @user
     expect(response).to render_template(:show)
     end

   
end
