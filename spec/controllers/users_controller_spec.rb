require 'rails_helper'
require 'omniauth'
require 'omniauth-facebook'
RSpec.describe UsersController, type: :controller do
   before :each do
     @user = FactoryGirl.create(:user)
     sign_in @user
   end
   
  describe 'PUT update' do
      
      context "valid attributes" do
        it "located the requested @user" do
          put :update, id: @user, user: { name: @user.name }
          expect(assigns(:user)).to eq(@user)      
        end
      
        it "changes @user's attributes" do
          put :update, id: @user, user: { name: "Larry" }
          @user.save!
          assert_response :success
        end

      end
      
      context "invalid attributes" do
        it "locates the requested @user" do
          put :update, id: @user, user: { name: "e"}
          expect(assigns(:user)).to eq(@user)      
        end
        
        it "does not change @user's attributes" do
          @email = @user.email
          put :update, id: @user, 
            user: { name: "Larry", email: nil}
          @user.reload
          expect(@user.name).not_to eq("larry")
          expect(@user.email).to eq(@email)
        end
        
        it "re-renders the edit method" do
          put :update, id: @user, user: {email: nil}
          expect(response).to render_template(:edit) 
        end
      end
    end


 private
  def sign_in(user)
    #cookies.permanent.signed[:remember_token] = [user.id]
    session[:user_id] = user.id
    current_user = user
    @current_user = user
  end
  def sign_out
    current_user = nil
    @current_user = nil
    cookies.delete(:remember_token)
  end
  def signed_in?
    return !@current_user.nil?
  end
   
end
