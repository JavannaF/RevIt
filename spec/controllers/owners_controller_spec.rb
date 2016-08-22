require 'rails_helper'
require 'geocoder'
require "geocoder/railtie"
Geocoder::Railtie.insert
RSpec.describe OwnersController, type: :controller do
  before :each do
     @owner = FactoryGirl.create(:owner)
     sign_in @owner
   end

  describe 'PUT update' do
      
      context "valid attributes" do
        it "located the requested @user" do
          put :update, id: @owner, owner: { name: @owner.name }
          expect(assigns(:owner)).to eq(@owner)      
        end
      
        it "changes @user's attributes" do
          put :update, id: @owner, owner: { name: "Larry" }
          @owner.save!
          assert_response :success
        end

      end
      
      context "invalid attributes" do
        it "locates the requested @user" do
          put :update, id: @owner, owner: { name: "e"}
          expect(assigns(:owner)).to eq(@owner)      
        end
        
        it "does not change @user's attributes" do
          @email = @owner.email
          put :update, id: @owner, 
            owner: { name: "Larry", email: nil}
          @owner.reload
          expect(@owner.name).not_to eq("larry")
          expect(@owner.email).to eq(@email)
        end
        
        it "re-renders the edit method" do
          put :update, id: @owner, owner: {email: nil}
          expect(response).to render_template(:edit) 
        end
      end
    end


 private
  def sign_in(owner)
    #cookies.permanent.signed[:remember_token] = [user.id]
    session[:owner_id] = owner.id
    current_owner = owner
    @current_owner = owner
  end
  def sign_out
    current_owner = nil
    @current_owner = nil
    cookies.delete(:remember_token)
  end
  def signed_in?
    return !@current_owner.nil?
  end
  
end
